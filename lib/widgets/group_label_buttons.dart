import 'package:flutter/material.dart';

import '../shared/themes/themes.dart';
import 'divider_vertical.dart';
import 'label_button.dart';

class GroupLabelButtons extends StatelessWidget {
  final String primaryLabel;
  final VoidCallback primaryOnPressed;
  final String secondaryLabel;
  final VoidCallback secondaryOnPressed;
  final bool enablePrimaryColor;
  final bool enableSecondaryColor;

  const GroupLabelButtons({
    Key? key,
    required this.primaryLabel,
    required this.primaryOnPressed,
    required this.secondaryLabel,
    required this.secondaryOnPressed,
    this.enablePrimaryColor = false,
    this.enableSecondaryColor = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Container(
        color: AppColors.background,
        height: 57,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Divider(
              height: 1,
              thickness: 1,
              color: AppColors.stroke,
            ),
            Container(
              height: 56,
              child: Row(
                children: [
                  Expanded(
                    child: LabelButton(
                      label: primaryLabel,
                      onPressed: primaryOnPressed,
                      style:
                          enablePrimaryColor ? TextStyles.buttonPrimary : null,
                    ),
                  ),
                  DividerVertical(),
                  Expanded(
                    child: LabelButton(
                      label: secondaryLabel,
                      onPressed: secondaryOnPressed,
                      style: enableSecondaryColor
                          ? TextStyles.buttonPrimary
                          : null,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
