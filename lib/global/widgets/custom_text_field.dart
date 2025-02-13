import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mechtronz/global/widgets/tochable_opacity.dart';

import '../../constants/app_colors.dart';

class CustomTextField extends StatefulWidget {
  final String? label;
  final TextEditingController? controller;
  final bool obscureText;
  final String? Function(String?)? validator;
  final TextInputType? keyboardType;
  final int? maxLength;
  final int? maxLines;
  final bool isDisabled;
  final Widget? prefix;
  final Widget? suffix;
  const CustomTextField({
    super.key,
    required this.label,
    this.controller,
    this.obscureText = false,
    this.validator,
    this.keyboardType,
    this.maxLength,
    this.isDisabled = false,
    this.maxLines = 1,
    this.prefix,
    this.suffix,
  });

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool obscureText = false;

  @override
  void initState() {
    if (mounted) {
      setState(() {
        obscureText = widget.obscureText;
      });
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      obscureText: obscureText,
      cursorColor: AppColors.primary,
      cursorWidth: 1,
      maxLength: widget.maxLength,
      decoration: InputDecoration(
        counterText: '',
        enabled: !widget.isDisabled,
        prefix: widget.prefix,
        floatingLabelBehavior:
            widget.prefix != null ? FloatingLabelBehavior.always : null,
        suffix: widget.suffix,
        suffixIcon: widget.obscureText
            ? TouchableOpacity(
                onTap: () {
                  if (mounted) {
                    setState(() {
                      obscureText = !obscureText;
                    });
                  }
                },
                child: Icon(
                  obscureText ? CupertinoIcons.eye : CupertinoIcons.eye_slash,
                  color: AppColors.primary,
                ),
              )
            : null,
        label: widget.label != null ? Text(widget.label!) : null,
      ),
      maxLines: widget.maxLines,
      keyboardType: widget.keyboardType,
      validator: widget.validator,
    );
  }
}
