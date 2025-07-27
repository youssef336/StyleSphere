import 'package:flutter/material.dart';

class CustomTextFormFeild extends StatefulWidget {
  const CustomTextFormFeild({
    super.key,
    required this.hintText,
    required this.textInputType,
    this.onTap,
    this.onChanged,
    this.suffixIcon,
    this.onSaved,
    this.obscureText = false,
    this.maxLines = 1,
  });
  final String hintText;
  final void Function()? onTap;
  final TextInputType textInputType;
  final void Function(String)? onChanged;
  final Widget? suffixIcon;
  final void Function(String?)? onSaved;
  final bool obscureText;
  final int? maxLines;

  @override
  State<CustomTextFormFeild> createState() => _CustomTextFormFeildState();
}

class _CustomTextFormFeildState extends State<CustomTextFormFeild> {
  final _focusNode = FocusNode();
  final _textController = TextEditingController();

  @override
  void dispose() {
    _focusNode.dispose();
    _textController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: _textController,
      focusNode: _focusNode,
      onChanged: (value) {
        if (widget.onChanged != null) {
          widget.onChanged!(value);
        }
      },
      onTap: () {
        _focusNode.requestFocus();
        if (widget.onTap != null) {
          widget.onTap!();
        }
      },
      maxLines: widget.maxLines,
      obscureText: widget.obscureText,
      onSaved: widget.onSaved,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter some text';
        }
        return null;
      },
      keyboardType: widget.textInputType,
      decoration: InputDecoration(
        suffixIcon: widget.suffixIcon,
        hintText: widget.hintText,
        hintStyle: const TextStyle(
          color: Color(0xFF9B9B9B),
          fontSize: 14,
          fontWeight: FontWeight.w400,
        ),
        filled: true,
        fillColor: const Color(0xFFF9FAFA),
        border: _buildBorder(),
        enabledBorder: _buildBorder(),
        focusedBorder: _buildBorder(),
      ),
    );
  }

  OutlineInputBorder _buildBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(4),
      borderSide: const BorderSide(color: Color(0xFFE6E9E9), width: 1.0),
    );
  }
}
