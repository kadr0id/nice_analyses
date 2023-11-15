import 'package:flutter/material.dart';
import 'package:nice_analyses/book_analyses/view/book_analyses_page.dart';

class SecondMenuView extends StatelessWidget {
  const SecondMenuView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return ListView.builder(
      itemCount: input.length,
      itemBuilder: (context, index) => Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: _getChildren(input, index, width, height, context),
      ),
    );
  }
}

List<Widget> _getChildren(List<String> list, index, width, height, context) {
  List<Widget> test = <Widget>[];
  List<String> two = <String>[];
  index % 2 == 0 ? two.addAll(list.take(2)) : two.add(list.first);

  two.forEach((element) {
    test.add(
      menuItemWidget(
          text: list[index],
          width: width,
          height: height,
          image: image[index],
          context: context),
    );
  });

  return test;
}

List<String> input = [
  "Тіреотропний гормон",
  "Трийодтиронін загальний",
  "Трийодтиронін вільний",
  "Тироксин загальний",
  "Тироксин вільний",
  "Тиреоглобулін",
  "Антитіла до тиреоглобуліну",
  "Антитіла до тиреопероксидази",
  "Тиреотропний гормон, а/т до рецепторів",
  "Кальцитонін",
  "Антимікросомальні антитіла"
];
List image = [
  "assets/icons/alertas_menu.png",
  "assets/icons/citas_menu.png",
  "assets/icons/medicos_menu.png",
  "assets/icons/medicamentos_menu.png",
  "assets/icons/inmunizaciones_menu.png",
  "assets/icons/recetas_menu.png",
  "assets/icons/medicamentos_menu.png",
  "assets/icons/medicamentos_menu.png",
  "assets/icons/inmunizaciones_menu.png",
  "assets/icons/recetas_menu.png",
  "assets/icons/medicamentos_menu.png",
];

Widget menuItemWidget(
    {required double width,
    required double height,
    required String text,
    required String image,
    required context}) {
  double cardHeight = (width - 20.0) / 2;
  double cardWidth = (width - 80.0) / 2;
  return GestureDetector(
    onTap: () {
      Navigator.of(context)
          .pushReplacement<void, void>(BookAnalysesPage.route());
    },
    child: Padding(
      padding: const EdgeInsets.only(
          top: 16.0, left: 10.0, right: 10.0, bottom: 16.0),
      child: Container(
        decoration: shadowOpenMainCard(),
        height: cardHeight,
        width: cardWidth,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(4.0),
              child: Container(
                decoration: shadowMainCard(),
                height: cardHeight - 78.0,
                width: cardWidth - 10.0,
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Image.asset(image),
                ),
              ),
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.all(5.0),
                child: Text(
                  text,
                  textAlign: TextAlign.center,
                  style: const TextStyle(fontWeight: FontWeight.w500),
                ),
              ),
            ),
          ],
        ),
      ),
    ),
  );
}

BoxDecoration shadowOpenMainCard({double radius = 20, Color? color}) =>
    BoxDecoration(
        color: const Color(0xFFAC72C1),
        shape: BoxShape.rectangle,
        borderRadius: const BorderRadius.all(Radius.circular(15.0)),
        boxShadow: [
          BoxShadow(
            color: color ?? Colors.black.withOpacity(0.2),
            blurRadius: radius,
          ),
        ]);

BoxDecoration shadowMainCard({double radius = 20, Color? color}) =>
    BoxDecoration(
        color: Colors.white,
        shape: BoxShape.rectangle,
        borderRadius: const BorderRadius.all(Radius.circular(10.0)),
        boxShadow: [
          BoxShadow(
            color: color ?? Colors.black.withOpacity(0.2),
            blurRadius: radius,
          ),
        ]);
