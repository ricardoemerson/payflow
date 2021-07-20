import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_masked_text2/flutter_masked_text2.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../shared/themes/themes.dart';
import '../../widgets/group_label_buttons.dart';
import '../../widgets/input_text.dart';
import 'insert_boleto_controller.dart';

class InsertBoletoPage extends StatefulWidget {
  final String? barcode;

  const InsertBoletoPage({
    Key? key,
    this.barcode,
  }) : super(key: key);

  @override
  _InsertBoletoPageState createState() => _InsertBoletoPageState();
}

class _InsertBoletoPageState extends State<InsertBoletoPage> {
  final controller = InsertBoletoController();

  final moneyInputTextController = MoneyMaskedTextController(
    leftSymbol: 'R\$ ',
  );

  final dueDateInputTextController = MaskedTextController(mask: '00/00/0000');
  final barcodeInputTextController = TextEditingController();

  @override
  void initState() {
    if (widget.barcode != null) {
      barcodeInputTextController.text = widget.barcode!;
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.background,
        elevation: 0,
        leading: BackButton(
          color: AppColors.input,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 93),
                child: Text(
                  'Preencha os dados do boleto',
                  style: TextStyles.titleBoldHeading,
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(
                height: 24,
              ),
              Form(
                key: controller.formKey,
                child: Column(
                  children: [
                    InputText(
                      label: 'Nome do boleto',
                      icon: Icons.description_outlined,
                      onChanged: (value) => controller.onChange(name: value),
                      validator: controller.validateName,
                      textCapitalization: TextCapitalization.sentences,
                      keyboardType: TextInputType.name,
                      autoFocus: true,
                    ),
                    InputText(
                      label: 'Vencimento',
                      icon: FontAwesomeIcons.timesCircle,
                      onChanged: (value) => controller.onChange(dueDate: value),
                      controller: dueDateInputTextController,
                      validator: controller.validateVencimento,
                      keyboardType: TextInputType.datetime,
                    ),
                    InputText(
                      label: 'Valor',
                      icon: FontAwesomeIcons.wallet,
                      onChanged: (value) => controller.onChange(
                          value: moneyInputTextController.numberValue),
                      controller: moneyInputTextController,
                      keyboardType: TextInputType.number,
                      validator: (_) => controller
                          .validateValor(moneyInputTextController.numberValue),
                    ),
                    InputText(
                      label: 'Código',
                      icon: FontAwesomeIcons.barcode,
                      onChanged: (value) => controller.onChange(barcode: value),
                      controller: barcodeInputTextController,
                      keyboardType: TextInputType.number,
                      validator: controller.validateCodigo,
                      textInputAction: TextInputAction.none,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: GroupLabelButtons(
        primaryLabel: 'Cancelar',
        primaryOnPressed: () => Navigator.pop(context),
        secondaryLabel: 'Cadastrar',
        secondaryOnPressed: () async {
          await controller.cadastrarBoleto();
          Navigator.pop(context);
        },
        enableSecondaryColor: true,
      ),
    );
  }
}
