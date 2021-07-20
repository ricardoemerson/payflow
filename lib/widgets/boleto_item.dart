import 'package:flutter/material.dart';

import '../modules/models/boleto.dart';
import '../shared/themes/themes.dart';

class BoletoItem extends StatelessWidget {
  final Boleto boleto;

  const BoletoItem({
    Key? key,
    required this.boleto,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListTile(
        title: Text(
          boleto.name!,
          style: TextStyles.titleListTile,
        ),
        subtitle: Text(
          'Vence em ${boleto.dueDate}',
          style: TextStyles.captionBody,
        ),
        trailing: Text.rich(TextSpan(
          text: 'R\$ ',
          style: TextStyles.trailingRegular,
          children: [
            TextSpan(
              text: '${boleto.value!.toStringAsFixed(2)}',
              style: TextStyles.trailingBold,
            ),
          ],
        )),
      ),
    );
  }
}
