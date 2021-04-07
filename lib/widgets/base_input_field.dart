import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BaseInputField extends StatefulWidget {
  final TextInputType? keyboardType;
  final void Function(String) onChanged;
  final bool? obscureText;
  final String labelText;
  final String? errorText;

  const BaseInputField(
      {Key? key,
      this.keyboardType,
      required this.onChanged,
      this.obscureText,
      required this.labelText,
      required this.errorText})
      : super(key: key);

  @override
  _BaseInputFieldState createState() => _BaseInputFieldState();
}

class _BaseInputFieldState extends State<BaseInputField> {
  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200.w,
      child: TextFormField(
        key: widget.key,
        controller: controller,
        keyboardType: widget.keyboardType,
        onChanged: widget.onChanged,
        obscureText: widget.obscureText ?? false,
        decoration: InputDecoration(
          labelText: widget.labelText,
          errorText: widget.errorText,
        ),
      ),
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}
