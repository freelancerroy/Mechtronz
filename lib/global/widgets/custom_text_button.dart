import 'package:flutter/material.dart';
import 'package:mechtronz/constants/app_colors.dart';
import 'package:mechtronz/utils/text_preset.dart';

class CustomTextButton extends StatefulWidget {
  final String linkText;
  final String? preLinkText;
  final String? postLinkText;
  final Function()? onTap;
  final TextStyle style;
  final Color linkColor;
  final Color textColor;

  const CustomTextButton({
    super.key,
    required this.linkText,
    this.onTap,
    this.style = const TextStyle(),
    this.linkColor = AppColors.primary,
    this.preLinkText,
    this.postLinkText,
    this.textColor = AppColors.black,
  });

  @override
  State<CustomTextButton> createState() => _CustomTextButtonState();
}

class _CustomTextButtonState extends State<CustomTextButton> {
  late bool isDown;

  @override
  void initState() {
    super.initState();
    setState(() => isDown = false);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (_) => setState(() => isDown = true),
      onTapUp: (_) => setState(() => isDown = false),
      onTapCancel: () => setState(() => isDown = false),
      onTap: widget.onTap,
      behavior: HitTestBehavior.opaque,
      child: RichText(
          text: TextSpan(
        children: [
          if (widget.preLinkText != null)
            TextSpan(
              text: widget.preLinkText,
              style: kLink.copyWith(
                color: widget.textColor,
                decorationColor: widget.textColor,
                decoration: TextDecoration.none,
                fontWeight: FontWeight.w400,
              ),
            ),
          TextSpan(
            text: widget.linkText,
            style: kLink.copyWith(
              color: widget.linkColor.withOpacity(isDown ? 0.5 : 1),
              decorationColor: widget.linkColor,
            ),
          ),
          if (widget.postLinkText != null)
            TextSpan(
              text: widget.postLinkText,
              style: kLink.copyWith(
                color: widget.textColor,
                decorationColor: widget.textColor,
                decoration: TextDecoration.none,
              ),
            ),
        ],
      )),
    );
  }
}
