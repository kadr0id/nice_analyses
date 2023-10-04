import 'package:flutter/material.dart';
import 'package:nice_analyses/app/nice_ui/widgets/menu_item.dart';
import 'package:nice_analyses/app/nice_ui/widgets/menu_subtitle.dart';
import 'package:nice_analyses/app/nice_ui/widgets/menu_title.dart';

class MenuData {
  final String menuTitle;
  final List<MenuSubData> menuSubDataList;

  MenuData(this.menuTitle, this.menuSubDataList);
}

class MenuSubData {
  final String menuSubTitle;
  final List<String> menuItems;

  MenuSubData(this.menuSubTitle, this.menuItems);
}

class MainAnalysesView extends StatelessWidget {
  static Route route() {
    return MaterialPageRoute<void>(
      builder: (_) => MainAnalysesView(),
      settings: const RouteSettings(name: '/main-analyses'),
    );
  }

  final List<MenuData> menuDataList = [
    MenuData(
      "ГОРМОНИ",
      [
        MenuSubData(
          "Тиреоїдна панель",
          [
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
            "Антимікросомальні антитіла",
          ],
        ),
        MenuSubData(
          "Репродуктивна панель",
          [
            "Фолікулостимулюючий гормон",
            "Лютеїнізуючий гормон",
            "Прогестерон",
            "Тестостерон загальний",
            "Тестостерон вільний",
            "Пролактин",
          ],
        ),
      ],
    ),
    MenuData(
      "ГОРМОНИ 2",
      [
        MenuSubData(
          "Репродуктивна панель 2",
          [
            "Фолікулостимулюючий гормон",
            "Лютеїнізуючий гормон",
            "Прогестерон",
            "Тестостерон загальний",
            "Тестостерон вільний",
            "Пролактин",
          ],
        ),
      ],
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ExpandableListWidget(menuDataList: menuDataList),
    );
  }
}

class ExpandableListWidget extends StatelessWidget {
  final List<MenuData> menuDataList;
  final bool useDivider;

  ExpandableListWidget({
    required this.menuDataList,
    this.useDivider = false,
  });

  final Divider customDivider = const Divider(
    color: Colors.grey,
    thickness: 1.0,
  );

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: menuDataList.length,
      itemBuilder: (context, index) {
        final menuData = menuDataList[index];
        return Container(
          decoration: BoxDecoration(color: Colors.white, boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
              blurRadius: 5,
            ),
          ]),
          child: ExpansionTile(
            title: Column(
              children: [
                MenuTitleWidget(title: menuData.menuTitle),
                if (useDivider) const Divider(),
              ],
            ),
            shape: const Border(bottom: BorderSide.none),
            children: menuData.menuSubDataList.map((menuSubData) {
              return Column(
                children: [
                  Container(
                    color: Colors.amber,
                    padding: const EdgeInsets.all(4.0),
                    alignment: Alignment.center,
                    child: Column(
                      children: [
                        MenuSubTitleWidget(subTitle: menuSubData.menuSubTitle),
                        if (useDivider)
                          const Divider(
                            color: Colors.red,
                            thickness: 0.0,
                          ),
                      ],
                    ),
                  ),
                  Column(
                    children: menuSubData.menuItems.map((item) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          MenuItemWidget(item: item),
                          if (!useDivider) const Divider(),
                        ],
                      );
                    }).toList(),
                  ),
                ],
              );
            }).toList(),
          ),
        );
      },
    );
  }
}
