import 'package:animated_card/animated_card.dart';
import 'package:flutter/material.dart';

import '../../shared/themes/app_text_styles.dart';
import '../../shared/themes/themes.dart';
import '../../widgets/boleto_info.dart';
import '../../widgets/boleto_list/boleto_list.dart';
import '../../widgets/boleto_list/boleto_list_controller.dart';
import '../models/boleto.dart';

class MeusBoletosPage extends StatefulWidget {
  const MeusBoletosPage({Key? key}) : super(key: key);

  @override
  _MeusBoletosPageState createState() => _MeusBoletosPageState();
}

class _MeusBoletosPageState extends State<MeusBoletosPage> {
  final controller = BoletoListController();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Stack(
            children: [
              Container(
                color: AppColors.primary,
                height: 40,
                width: double.maxFinite,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: ValueListenableBuilder<List<Boleto>>(
                  valueListenable: controller.boletosNotifier,
                  builder: (_, boletos, __) => AnimatedCard(
                    direction: AnimatedCardDirection.top,
                    child: BoletoInfo(
                      size: boletos.length,
                    ),
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 24, left: 24, right: 24),
            child: Row(
              children: [
                Text(
                  'Meus boletos',
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
