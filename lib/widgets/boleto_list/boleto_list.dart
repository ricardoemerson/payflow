import 'package:flutter/material.dart';

import '../../modules/models/boleto.dart';
import '../boleto_item.dart';
import 'boleto_list_controller.dart';

class BoletoList extends StatefulWidget {
  final BoletoListController controller;

  const BoletoList({
    Key? key,
    required this.controller,
  }) : super(key: key);

  @override
  _BoletoListState createState() => _BoletoListState();
}

class _BoletoListState extends State<BoletoList> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ValueListenableBuilder<List<Boleto>>(
        valueListenable: widget.controller.boletosNotifier,
        builder: (_, boletos, __) => Column(
          children:
              boletos.map((boleto) => BoletoItem(boleto: boleto)).toList(),
        ),
      ),
    );
  }
}
