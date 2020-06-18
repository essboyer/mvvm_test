import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TextInputFormField extends StatelessWidget {
  //final TextEditingController _controller = TextEditingController();
  final String value;
  final String label;
  final String hint;
  final TextCapitalization cap;
  final TextStyle style;
  final int maxLines;
  final Function onChanged;
  final Function onSaved;
  final Function validator;
  final bool autoFocus;
  final List<TextInputFormatter> inputFormatters;

  /// To be used in conjunction with the built-in validator
  final bool required;
  final Icon prefixIcon;
  final Icon suffixIcon;

  TextInputFormField({
    this.value,
    this.label,
    this.hint,
    this.cap,
    this.style,
    this.maxLines,
    this.autoFocus = false,
    this.onChanged,
    this.onSaved,
    this.validator,
    this.required = false,
    this.inputFormatters,
    this.prefixIcon,
    this.suffixIcon,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      inputFormatters: inputFormatters ?? [],
      initialValue: value,
      autofocus: autoFocus,
      maxLines: maxLines,
      //controller: _controller,
      textCapitalization: cap != null ? cap : TextCapitalization.sentences,
      style: style,
      validator: validator != null
          ? validator
          : (val) {
              if (required && val.isEmpty) {
                return 'Missing $label';
              }
              if (val.isNotEmpty && val.length < 2) {
                return 'Missing $label';
              }
              return null;
            },
      onChanged: onChanged,
      onSaved: onSaved,
    );
  }
}
