import 'package:flutter/material.dart';

import '../../app/nice_ui/nice_ui.dart';
import '../../app/nice_ui/widgets/nice_main_item_widget.dart';
import '../../book_analyses/view/book_analyses_page.dart';

class MainAnalysesView extends StatelessWidget {
  const MainAnalysesView({
    Key? key,
  }) : super(key: key);

  static const List<String> titles = [
    "ГОРМОНИ",
    "ГОРМОНИ 2",
    "ГОРМОНИ 3",
    "ГОРМОНИ 4",
  ];

  static const List<List<String>> subtitles = [
    ["Тиреоїдна панель"],
    ["Репродуктивна панель"],
    ["Репродуктивна панель 2"],
    ["Репродуктивна панель 3"]
  ];

  static const List<List<String>> items = [
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
    [
      "Фолікулостимулюючий гормон",
      "Лютеїнізуючий гормон",
      "Прогестерон",
      "Тестостерон загальний",
      "Тестостерон вільний",
      "Пролактин",
    ],
    [
      "Фолікулостимулюючий гормон",
      "Лютеїнізуючий гормон",
      "Прогестерон",
      "Тестостерон загальний",
      "Тестостерон вільний",
      "Пролактин",
    ],
    [
      "Фолікулостимулюючий гормон",
      "Лютеїнізуючий гормон",
      "Прогестерон",
      "Тестостерон загальний",
      "Тестостерон вільний",
      "Пролактин",
    ],
  ];

  @override
  Widget build(BuildContext context) {
    return const ExpandableListWidget(
      titles: titles,
      subtitles: subtitles,
      items: items,
    );
  }
}

class ExpandableListWidget extends StatelessWidget {
  final List<String> titles;
  final List<List<String>> subtitles;
  final List<List<String>> items;
  final bool useDivider;

  const ExpandableListWidget({
    Key? key,
    required this.titles,
    required this.subtitles,
    required this.items,
    this.useDivider = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: titles.length,
      itemBuilder: (context, index) {
        final title = titles[index];
        final subtitleList = subtitles[index];
        final itemList = items[index];
        return NiceMainItem(
          child: ExpansionTile(
            title: MenuTitleWidget(title: title),
            children: [
              Column(
                children: [
                  if (items.isNotEmpty)
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: subtitleList.map((subtitle) {
                        return Container(
                          color: Colors.amber,
                          padding: const EdgeInsets.all(4.0),
                          alignment: Alignment.center,
                          child: MenuSubTitleWidget(subTitle: subtitle),
                        );
                      }).toList(),
                    ),
                  if (items.isNotEmpty)
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: itemList.map((item) {
                        return GestureDetector(
                            onTap: () {
                              Navigator.of(context).pushReplacement<void, void>(
                                  BookAnalysesPage.route());
                            },
                            child:
                                MenuItemWidget(item: item, useDivider: false));
                      }).toList(),
                    ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
