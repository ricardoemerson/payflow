import 'package:flutter/material.dart';

import '../shared/themes/themes.dart';

class InputText extends StatelessWidget {
  final String label;
  final IconData icon;
  final String? initialValue;
  final bool autoFocus;
  final String? Function(String?)? validator;
  final TextEditingController? controller;
  final void Function(String value) onChanged;
  final TextInputAction? textInputAction;
  final TextCapitalization? textCapitalization;
  final TextInputType? keyboardType;

  const InputText({
    Key? key,
    required this.label,
    required this.icon,
    this.initialValue,
    this.validator,
    this.controller,
    this.textInputAction = TextInputAction.next,
    this.textCapitalization = TextCapitalization.none,
    this.keyboardType = TextInputType.text,
    this.autoFocus = false,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Column(
        children: [
          TextFormField(
            controller: controller,
            onChanged: onChanged,
            initialValue: initialValue,
            validator: validator,
            style: TextStyles.input,
            textInputAction: textInputAction,
            textCapitalization: TextCapitalization.none,
            keyboardType: TextInputType.text,
            autofocus: autoFocus,
            decoration: InputDecoration(
              contentPadding: EdgeInsets.zero,
              border: InputBorder.none,
              labelText: label,
              labelStyle: TextStyles.input,
              icon: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 18),
                    child: Icon(
                      icon,
                      color: AppColors.primary,
                    ),
                  ),
                  Container(
                    width: 1,
                    height: 48,
                    color: AppColors.stroke,
                  )
                ],
              ),
            ),
          ),
          Divider(
            height: 1,
            thickness: 1,
            color: AppColors.stroke,
          )
        ],
      ),
    );
  }
}
