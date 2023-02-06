class GetTokenModel {
  final String email;


  GetTokenModel({
    required this.email,
  });

  Map<String, dynamic> toMap() {
    return {
      "email": email,
    };
  }
}
