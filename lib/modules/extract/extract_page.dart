import 'package:animated_card/animated_card.dart';
import 'package:flutter/material.dart';

import '../../shared/themes/themes.dart';
import '../../widgets/boleto_list/boleto_list.dart';
import '../../widgets/boleto_list/boleto_list_controller.dart';

class ExtractPage extends StatefulWidget {
  const ExtractPage({Key? key}) : super(key: key);

  @override
  _ExtractPageState createState() => _ExtractPageState();
}

class _ExtractPageState extends State<ExtractPage> {
  final controller = BoletoListController();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 24, left: 24, right: 24),
            child: Row(
              children: [
                Text(
                  'Meus extratos',
                  style: TextStyles.titleBoldHeading,
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 24),
            child: Divider(
              color: AppColors.stroke,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: AnimatedCard(
              child: BoletoList(
                controller: controller,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
