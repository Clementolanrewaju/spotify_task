bool isValidEmailAddress(String it) =>
    RegExp(r'^.+@[a-zA-Z]+\.{1}[a-zA-Z]+(\.{0,1}[a-zA-Z]+)$').hasMatch(it);

bool isValidPassword(String it) =>
    RegExp("^(?=.*[a-z])(?=.*[A-Z])(?=.*[0-9])(?=.*[!@#\$%^&*])(?=.{8,})")
        .hasMatch(it);

String capitalize(String it) => it.isEmpty
    ? it
    : it[0].toUpperCase() + it.substring(1, it.length).toLowerCase();

String formatAmount(double it, [int itAsFixed = 2]) {
  return it.toStringAsFixed(itAsFixed).replaceAllMapped(
        RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'),
        (Match m) => '${m[1]},',
      );
}

String shrinkAmount(double it) {
  if (it > 999999) {
    return '${(it / 1000000).toStringAsFixed(2)}M';
  }
  return formatAmount(it);
}

String chunk4(String it) {
  return it.replaceAllMapped(RegExp(r".{4}"), (match) => "${match.group(0)} ");
}

String zeroPrefixNumber(int number) => number < 10 ? "0$number" : "$number";
String countryCodePrefixNumber(String number) {
  if (number.contains('+234')) {
    return number;
  }
  if (number.startsWith('0')) {
    return '+234 ${number.substring(1)}';
  }
  return '+234 $number';
}

String? validator({
  required String error,
  required bool isValid,
}) {
  if (isValid) {
    return null;
  }
  return error;
}

String numberSuffixWord(int number, String word) {
  if (word.endsWith('y')) {
    return "$number ${number > 1 ? "${word.substring(0, word.length - 1)}ies" : word}";
  }
  return "$number ${number > 1 ? "${word}s" : word}";
}

String formatPhone(String phone) {
  //format (xxx) xxx-xxxx-xxx
  return phone.replaceAllMapped(
    RegExp(r'(\d{3})(\d{3})(\d{4})(\d{3})'),
    (Match match) => '${match[1]} ${match[2]} ${match[3]} ${match[4]}',
  );
}
