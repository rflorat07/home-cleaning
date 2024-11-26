import 'package:flutter/material.dart';

import '../../../utils/utils.dart';

class CustomExpansionTile extends StatelessWidget {
  const CustomExpansionTile({
    super.key,
    this.children,
    this.content,
    this.isExpanded = false,
    required this.title,
    this.padding = const EdgeInsets.only(bottom: TSizes.size8),
  });

  final String title;
  final String? content;
  final bool isExpanded;
  final List<Widget>? children;
  final EdgeInsetsGeometry? padding;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Container(
      padding: padding,
      child: ExpansionTile(
        initiallyExpanded: isExpanded,
        expandedAlignment: Alignment.topLeft,
        title: Text(
          title,
          style: textTheme.labelLarge!.copyWith(
            fontWeight: FontWeight.w500,
          ),
        ),
        children: children ??
            [
              Text(
                content ?? '',
                style: textTheme.labelLarge!.apply(color: TColors.darkerGrey),
              ),
            ],
      ),
    );
  }
}
