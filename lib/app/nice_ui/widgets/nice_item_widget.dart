import 'package:flutter/material.dart';
import 'package:nice_analyses/app/nice_ui/nice_ui.dart';

import '../colors/nice_colors.dart';

/// {@template nice_item}
/// Creates a nice main item.
///
/// Can be extended for various different use purposes.
///
/// {@endtemplate}
class NiceItem extends StatelessWidget {
  /// {@macro nice_item}
  const NiceItem({
    Key? key,
    required this.title,
    required this.price,
    required this.time,
    this.onPressed,
  }) : super(key: key);

  /// Title which describes item purpose
  final String title;

  /// Title which describes item price
  final String price;

  /// Title which describes item time
  final String time;

  /// Callback which opens dropdown
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Container(
        decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            gradient: LinearGradient(
                begin: Alignment.centerRight,
                end: Alignment.centerLeft,
                colors: [NiceColors.water, Colors.white])),
        child: Padding(
          padding: const EdgeInsets.all(NiceSpacing.sm),
          child: InkWell(
            onTap: onPressed,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: theme.textTheme.headlineMedium?.copyWith(
                        fontWeight: NiceFontWeight.regular,
                        color: NiceColors.darkPrimary,
                      ),
                    ),
                    const SizedBox(height: NiceSpacing.sm),
                    Row(
                      children: [
                        Text(
                          '$price ₴',
                          style: theme.textTheme.headlineMedium?.copyWith(
                            fontWeight: NiceFontWeight.bold,
                            color: NiceColors.darkPrimary,
                          ),
                        ),
                        const Padding(
                          padding:
                              EdgeInsets.only(left: NiceSpacing.xxs, right: 4),
                          child: Icon(
                            Icons.access_time,
                            color: NiceColors.darkSecondary,
                          ),
                        ),
                        Text(
                          '$time min',
                          style: theme.textTheme.bodyLarge?.copyWith(
                            fontWeight: NiceFontWeight.bold,
                            color: NiceColors.darkSecondary,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Icon(
                    Icons.add_circle_outline,
                    size: 32,
                    color: NiceColors.oceanBlue,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
