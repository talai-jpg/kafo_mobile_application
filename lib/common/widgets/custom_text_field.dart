import 'package:flutter/material.dart';
import 'package:kafo_app/app_color.dart';

class CustomTextField extends StatefulWidget {
  final String label;
  final String hint;
  final IconData icon;
  final bool obscure;
  final TextEditingController controller;
  final String? Function(String?) validator;

  const CustomTextField({
    super.key,
    required this.label,
    required this.hint,
    required this.icon,
    this.obscure = false,
    required this.controller,
    required this.validator,
  });

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool _obscureText = true;

  @override
  void initState() {
    super.initState();
    _obscureText = widget.obscure;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.label,
          style: Theme.of(context).textTheme.titleMedium,
          textAlign: TextAlign.right,
        ),
        const SizedBox(height: 8),
        SizedBox(
          width: 328,
          child: TextFormField(
            controller: widget.controller,
            obscureText: widget.obscure ? _obscureText : false,
            validator: widget.validator,
            decoration: InputDecoration(
              hintText: widget.hint,

              prefixIcon: Padding(
                padding: const EdgeInsets.only(right: 12),
                child: Icon(widget.icon, color: AppColor.primary_400),
              ),
              prefixIconConstraints: BoxConstraints(
                minWidth: 24 + 4,
                minHeight: 24,
              ),

              suffixIcon: widget.obscure
                  ? IconButton(
                      icon: Icon(
                        _obscureText
                            ? Icons.visibility_off_outlined
                            : Icons.visibility_outlined,
                        color: AppColor.primary_400,
                      ),
                      onPressed: () {
                        setState(() {
                          _obscureText = !_obscureText;
                        });
                      },
                    )
                  : null,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(color: AppColor.primary_400),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(color: AppColor.primary_400, width: 0.3),
              ),

              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(color: AppColor.primary_300, width: 2),
              ),
              contentPadding: EdgeInsets.symmetric(vertical: 2, horizontal: 8),
            ),
          ),
        ),
      ],
    );
  }
}
