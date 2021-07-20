import 'package:flutter/material.dart';
import 'package:payflow/modules/models/user.dart';

import '../../shared/themes/themes.dart';
import '../extract/extract_page.dart';
import '../meus_boletos/meus_boletos_page.dart';
import 'home_controller.dart';

class HomePage extends StatefulWidget {
  final User user;

  const HomePage({
    Key? key,
    required this.user,
  }) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final controller = HomeController();

  final pages = [
    Container(
      child: MeusBoletosPage(
        key: UniqueKey(),
      ),
    ),
    Container(
      child: ExtractPage(
        key: UniqueKey(),
      ),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(152),
        child: Container(
          height: 152,
          color: AppColors.primary,
          child: Center(
            child: ListTile(
              title: Text.rich(
                TextSpan(
                  text: 'Olá, ',
                  style: TextStyles.titleRegular,
                  children: [
                    TextSpan(
                      text: widget.user.name,
                      style: TextStyles.titleBoldBackground,
                    ),
                  ],
                ),
              ),
              subtitle: Text('Mantenha suas constas em dia',
                  style: TextStyles.captionShape),
              trailing: Container(
                height: 48,
                width: 48,
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(5),
                  image: DecorationImage(
                    image: NetworkImage(widget.user.photoUrl!),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
      body: [
        Container(
          child: MeusBoletosPage(
            key: UniqueKey(),
          ),
        ),
        Container(
          child: ExtractPage(
            key: UniqueKey(),
          ),
        ),
      ][controller.currentPage],
      bottomNavigationBar: Container(
        height: 80,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            IconButton(
              onPressed: () {
                controller.setPage(0);
                setState(() {});
              },
              icon: Icon(Icons.home),
              color: controller.currentPage == 0
                  ? AppColors.primary
                  : AppColors.body,
            ),
            GestureDetector(
              onTap: () async =>
                  await Navigator.pushNamed(context, '/barcode_scanner'),
              child: Container(
                width: 56,
                height: 56,
                decoration: BoxDecoration(
                    color: AppColors.primary,
                    borderRadius: BorderRadius.circular(5)),
                child: Icon(
                  Icons.add_box_outlined,
                  color: AppColors.background,
                ),
              ),
            ),
            IconButton(
              onPressed: () {
                controller.setPage(1);
                setState(() {});
              },
              icon: Icon(Icons.description_outlined),
              color: controller.currentPage == 1
                  ? AppColors.primary
                  : AppColors.body,
            ),
          ],
        ),
      ),
    );
  }
}
