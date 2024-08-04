import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomTextField extends StatefulWidget {
  final String labelText;
  final TextEditingController controller;
  final TextInputType? inputType;
  final int? lineNumber;
  final void Function(String?) onSave;
  final String? Function(String?)? validator;
  final bool? isPassField;
  final IconData icon;

  const CustomTextField({
    super.key,
    required this.labelText,
    required this.onSave,
    this.inputType = TextInputType.text,
    this.lineNumber = 1,
    this.validator,
    this.isPassField,
    required this.controller,
    required this.icon,
  });

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool showPass = false;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        obscureText: widget.isPassField == null || showPass ? false : true,
        controller: widget.controller,
        maxLines: widget.lineNumber,
        decoration: InputDecoration(
            labelText: widget.labelText,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(19.0),
              borderSide: const BorderSide(color: Colors.black),

            ),
            suffixIcon: widget.isPassField == null
                ? const SizedBox()
                : GestureDetector(
                    onTap: () {
                      setState(() {
                        showPass = !showPass;
                      });
                    },
                    child: Icon(showPass
                        ? Icons.visibility_outlined
                        : Icons.visibility_off_outlined),
                  ),
            prefixIcon: Icon(widget.icon)),
        keyboardType: widget.inputType,
        onSaved: (value) {
          widget.onSave(value?.isEmpty ?? true ? null : value);
        },
        validator: widget.validator,
        inputFormatters: [
          LengthLimitingTextInputFormatter(700),
          if (widget.inputType == TextInputType.number)
            FilteringTextInputFormatter.allow(RegExp(r'^-?\d*\.?\d*')),
        ],
      ),
    );
  }
}
