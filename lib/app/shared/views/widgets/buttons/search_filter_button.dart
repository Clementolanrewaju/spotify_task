import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:spotify_task/app/providers/ui_providers/search_filter/search_filter_completion_provider.dart';
import 'package:spotify_task/app/shared/helpers/functions/dims.dart';

import '../../../utils/theme/app_colors.dart';

class SearchFilterButton extends StatefulWidget {
  final AppColor appColor;
  final WidgetRef ref;
  const SearchFilterButton(
      {Key? key, required this.appColor, required this.ref})
      : super(key: key);

  @override
  State<SearchFilterButton> createState() => _SearchFilterButtonState();
}

class _SearchFilterButtonState extends State<SearchFilterButton> {
  final List<FilterText> items = [
    FilterText(title: "Albums"),
    FilterText(title: "Artists")
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(right: 50),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: List.generate(
          items.length,
          (index_) => Expanded(child: buildItem(index_)),
        ),
      ),
    );
  }

  int index = 0;
  Widget buildItem(int index_) {
    bool selected = index == index_;
    FilterText item = items[index_];
    return GestureDetector(
      onTap: () {
        setState(() {
          index = index_;
        });
        widget.ref
            .read(searchFilterCompletionStateProvider.notifier)
            .jumpToPage(index);
      },
      child: Container(
        margin: const EdgeInsets.only(right: 40),
        height: context.deviceHeight() / 20,
        decoration: BoxDecoration(
          border: Border.all(
            width: 2,
            color: selected
                ? Colors.green.shade900
                : widget.appColor.tertiaryColor,
          ),
          borderRadius: BorderRadius.circular(25),
          color: selected ? Colors.green : Colors.black,
        ),
        child: Center(
          child: Text(
            item.title,
            style: const TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w500,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}

class FilterText {
  final String title;
  FilterText({
    required this.title,
  });
}
