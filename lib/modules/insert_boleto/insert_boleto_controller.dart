import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../models/boleto.dart';

class InsertBoletoController {
  final formKey = GlobalKey<FormState>();
  Boleto boleto = Boleto();

  String? validateName(String? value) =>
      value?.isEmpty ?? true ? 'O nome não pode ser vazio' : null;
  String? validateVencimento(String? value) =>
      value?.isEmpty ?? true ? 'A data de vencimento não pode ser vazio' : null;
  String? validateValor(double value) =>
      value == 0 ? 'Insira um valor maior que R\$ 0,00' : null;
  String? validateCodigo(String? value) =>
      value?.isEmpty ?? true ? 'O código do boleto não pode ser vazio' : null;

  void onChange({
    String? name,
    String? dueDate,
    double? value,
    String? barcode,
  }) {
    boleto = boleto.copyWith(
        name: name, dueDate: dueDate, value: value, barcode: barcode);
  }

  Future<void> saveBoleto() async {
    final instance = await SharedPreferences.getInstance();
    final boletos = instance.getStringList('boletos') ?? <String>[];

    boletos.add(boleto.toJson());

    await instance.setStringList('boletos', boletos);
  }

  Future<void> cadastrarBoleto() async {
    final form = formKey.currentState;

    if (form!.validate()) {
      await saveBoleto();
    }
  }
}
