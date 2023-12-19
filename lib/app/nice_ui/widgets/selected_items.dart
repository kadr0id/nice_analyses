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
          padding: const EdgeInsets.symmetric(
              horizontal: NiceSpacing.lg, vertical: NiceSpacing.sm),
          child: Text(
            'Перелік аналізів',
            style: NiceTextStyle.headline4,
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
                height: NiceSpacing.xxlg,
                padding: const EdgeInsets.only(left: NiceSpacing.lg),
                child: Row(
                  children: [
                    Text(
                      key,
                      style: NiceTextStyle.bodyText1,
                    ),
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            value.toString(),
                            style: NiceTextStyle.bodyText1,
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
