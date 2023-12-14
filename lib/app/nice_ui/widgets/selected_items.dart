import 'package:flutter/material.dart';
import 'package:nice_analyses/app/nice_ui/colors/nice_colors.dart';
import 'package:nice_analyses/app/nice_ui/nice_ui.dart';

class SelectedItemsWidget extends StatelessWidget {
  final Map<String, double> selectedItems;
  final VoidCallback? onPressed;

  const SelectedItemsWidget({
    Key? key,
    required this.selectedItems,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Container(
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10),
              topRight: Radius.circular(10),
            ),
            gradient: LinearGradient(
                begin: Alignment.centerRight,
                end: Alignment.centerLeft,
                colors: [Colors.grey, Colors.white]),
          ),
          padding: const EdgeInsets.all(8.0),
          child: const Text(
            'Перелік аналізів',
            style: TextStyle(
              fontWeight: NiceFontWeight.regular,
              fontSize: 16,
              color: NiceColors.darkPrimary,
            ),
          ),
        ),
        Container(
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(10),
              bottomRight: Radius.circular(10),
            ),
            color: NiceColors.whiteSecondary,
          ),
          child: ListView.builder(
            shrinkWrap: true,
            itemCount: selectedItems.length,
            itemBuilder: (context, index) {
              String key = selectedItems.keys.elementAt(index);
              double value = selectedItems.values.elementAt(index);
              return Container(
                padding: const EdgeInsets.only(left: 4.0, right: 4.0),
                child: Row(
                  children: [
                    Text(
                      key,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            value.toString(),
                            style: const TextStyle(
                              color: NiceColors.black,
                              fontSize: 14,
                            ),
                          ),
                          IconButton(
                            icon: const Icon(Icons.cancel),
                            iconSize: 16,
                            color: NiceColors.grey,
                            onPressed: onPressed,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}