import 'package:flutter/material.dart';

import '../../../../../utils/utils.dart';

class CustomListTileRadio extends StatelessWidget {
  const CustomListTileRadio({
    super.key,
    this.value,
    this.shape,
    this.trailing,
    this.leading,
    this.groupValue,
    required this.icon,
    required this.title,
  });

  final int? value;
  final int? groupValue;
  final String title, icon;
  final ShapeBorder? shape;
  final Widget? trailing, leading;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return ListTile(
        onTap: () {},
        dense: true,
        title: Text(title),
        leading: leading ??
            Image(
              image: AssetImage(icon),
              width: TSizes.size24,
              height: TSizes.size24,
            ),
        trailing: trailing ??
            Radio(
              value: value,
              groupValue: groupValue,
              onChanged: (value) {},
            ),
        titleTextStyle: textTheme.bodyLarge!.apply(color: TColors.darkerGrey),
        contentPadding: const EdgeInsets.symmetric(horizontal: TSizes.size12),
        shape: shape);
  }
}
