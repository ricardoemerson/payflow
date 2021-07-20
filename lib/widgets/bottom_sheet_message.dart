import 'package:flutter/material.dart';

import '../shared/themes/themes.dart';
import 'group_label_buttons.dart';

class BottomSheetMessage extends StatelessWidget {
  final String primaryLabel;
  final VoidCallback primaryOnPressed;
  final String secondaryLabel;
  final VoidCallback secondaryOnPressed;
  final String title;
  final String subTitle;

  const BottomSheetMessage({
    Key? key,
    required this.primaryLabel,
    required this.primaryOnPressed,
    required this.secondaryLabel,
    required this.secondaryOnPressed,
    required this.title,
    required this.subTitle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: RotatedBox(
        quarterTurns: 1,
        child: Material(
          child: Container(
            child: Container(
              color: AppColors.shape,
              child: Column(
                children: [
                  Expanded(
                    child: Container(
                      color: Colors.black.withOpacity(0.6),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(40),
                    child: Text.rich(
                      TextSpan(
                        text: title,
                        style: TextStyles.buttonBoldHeading,
                        children: [
                          TextSpan(
                            text: '\n$subTitle',
                            style: TextStyles.buttonHeading,
                          ),
                        ],
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Container(
                    height: 1,
                    color: AppColors.stroke,
                  ),
                  GroupLabelButtons(
                    primaryLabel: primaryLabel,
                    primaryOnPressed: primaryOnPressed,
                    enablePrimaryColor: true,
                    secondaryLabel: secondaryLabel,
                    secondaryOnPressed: secondaryOnPressed,
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
