import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../modules/models/boleto.dart';

class BoletoListController {
  final boletosNotifier = ValueNotifier<List<Boleto>>(<Boleto>[]);

  List<Boleto> get boletos => boletosNotifier.value;
  set boletos(List<Boleto> list) => boletosNotifier.value = list;

  BoletoListController() {
    getBoletos();
  }

  Future<void> getBoletos() async {
    try {
      final instance = await SharedPreferences.getInstance();
      final response = instance.getStringList('boletos') ?? <String>[];

      boletos = response.map((e) => Boleto.fromJson(e)).toList();
    } catch (err) {
      boletos = <Boleto>[];
    }
  }
}
