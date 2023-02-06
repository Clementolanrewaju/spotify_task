import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:spotify_task/app/shared/helpers/functions/dims.dart';
import 'package:spotify_task/app/shared/utils/theme/app_colors.dart';

class CustomTextField extends StatefulWidget {
  final String? hint;
  final ValueChanged<String>? onChanged;
  final bool headerLess;
  final TextEditingController? textEditingController;
  final int lines;
  final bool readOnly;
  final bool obscureText;
  final Widget? prefix;
  final TextInputType? keyboardType;
  final List<TextInputFormatter>? inputFormatters;
  final FocusNode? focusNode;
  final Widget? suffix;
  final TextInputAction textInputAction;
  final Border? border;
  final Color? backgroundColor;
  final AppColor appColor;
  final String? prefixText;
  final String? headerText;

  const CustomTextField({
    Key? key,
    required this.appColor,
    this.hint,
    this.onChanged,
    this.headerText = '',
    this.headerLess = true,
    this.textEditingController,
    this.lines = 1,
    this.readOnly = false,
    this.obscureText = false,
    this.prefix,
    this.keyboardType,
    this.inputFormatters,
    this.focusNode,
    this.suffix,
    this.textInputAction = TextInputAction.done,
    this.border,
    this.backgroundColor,
    this.prefixText,
  }) : super(key: key);

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  @override
  void initState() {
    _node = widget.focusNode ?? FocusNode();
    super.initState();
  }

  FocusNode? _node;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(_node);
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          !widget.headerLess
              ? Text(
                  widget.headerText!,
                  style: TextStyle(
                    color: widget.appColor.textFieldLabelColor,
                    fontWeight: FontWeight.w400,
                    fontSize: 12,
                  ),
                )
              : const SizedBox.shrink(),
          const YBox(5),
          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 5,
              vertical: 1,
            ),
            decoration: BoxDecoration(
              color: widget.appColor.textFieldColor,
              borderRadius: BorderRadius.circular(5),
            ),
            child: Row(
              children: [
                widget.prefix ?? const SizedBox(width: 15),
                Expanded(
                  child: TextFormField(
                    cursorHeight: 20,
                    focusNode: _node,
                    cursorColor: widget.appColor.primaryColor,
                    readOnly: widget.readOnly,
                    onChanged: widget.onChanged,
                    textInputAction: widget.textInputAction,
                    obscureText: widget.obscureText,
                    keyboardType: widget.keyboardType,
                    controller: widget.textEditingController,
                    inputFormatters: widget.inputFormatters,
                    maxLines: widget.obscureText ? 1 : (widget.lines),
                    minLines: widget.obscureText ? 1 : (widget.lines),
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      color: widget.appColor.textFieldLabelColor,
                      fontSize: 14,
                    ),
                    decoration: InputDecoration(
                      prefixText: widget.prefixText,
                      prefixStyle: TextStyle(
                        fontWeight: FontWeight.w600,
                        color: widget.appColor.textColor,
                        fontSize: 14,
                      ),
                      border: InputBorder.none,
                      labelStyle: TextStyle(
                        color: widget.appColor.textFieldLabelColor,
                        fontWeight: FontWeight.w400,
                        fontSize: 12,
                      ),
                      hintText:
                        widget.hint ?? '',
                      hintStyle: TextStyle(
                        color: widget.appColor.textFieldLabelColor,
                        fontWeight: FontWeight.w400,
                        fontSize: 12,
                      ),
                    ),
                  ),
                ),
                widget.suffix ?? const SizedBox()
              ],
            ),
          ),
        ],
      ),
    );
  }
}
