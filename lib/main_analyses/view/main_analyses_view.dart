import 'package:flutter/material.dart';
import 'package:nice_analyses/app/nice_ui/widgets/nice_item_widget.dart';
import 'package:nice_analyses/app/nice_ui/widgets/selected_items.dart';

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

  static const Map<String, double> selectedItems = {
    "Фолікулостимулюючий гормон": 315,
    "Лютеїнізуючий гормон": 176,
    "Прогестерон": 488,
    "Тестостерон загальний": 104,
    "Тестостерон вільний": 222,
    "Пролактин": 391,
  };

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      child: Column(
        children: [
          SelectedItemsWidget(selectedItems: selectedItems),
          ExpandableListWidget(
            titles: titles,
            items: items,
          ),
        ],
      ),
    );
  }
}

class ExpandableListWidget extends StatelessWidget {
  final List<String> titles;
  final List<List<String>> items;
  final bool useDivider;

  const ExpandableListWidget({
    Key? key,
    required this.titles,
    required this.items,
    this.useDivider = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: titles.length,
      itemBuilder: (context, index) {
        final title = titles[index];
        final itemList = items[index];
        return NiceMainItem(
          child: ExpansionTile(
            title: MenuTitleWidget(title: title),
            shape: Border.all(color: Colors.transparent),
            children: [
              Column(
                children: [
                  if (items.isNotEmpty)
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: itemList.map((item) {
                        return GestureDetector(
                          onTap: () {
                            Navigator.of(context).pushReplacement<void, void>(
                                BookAnalysesPage.route());
                          },
                          child: NiceItem(
                            title: title,
                            price: '111',
                            time: '10',
                          ),
                        );
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
