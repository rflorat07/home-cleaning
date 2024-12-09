import 'package:flutter/material.dart';

import '../../../utils/utils.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    this.border,
    this.maxLines = 1,
    required this.labelText,
    required this.placeholder,
    this.fieldHeight = TSizes.size44,
    this.borderRadius = TSizes.size8,
    this.backgroundColor = TColors.whiteSmoke,
  });

  final int? maxLines;
  final BoxBorder? border;
  final double? fieldHeight;
  final double borderRadius;
  final Color backgroundColor;
  final String labelText, placeholder;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          labelText,
          style: Theme.of(context)
              .textTheme
              .headlineSmall!
              .copyWith(fontWeight: FontWeight.w500),
        ),
        const SizedBox(height: TSizes.size8),
        Container(
          decoration: BoxDecoration(
            color: backgroundColor,
            borderRadius: BorderRadius.all(
              Radius.circular(borderRadius),
            ),
            border: border,
          ),
          //height: maxLines != null ? null : fieldHeight,
          child: TextFormField(
            maxLines: maxLines,
            onSaved: (value) {},
            decoration: InputDecoration(
              hintText: placeholder,
              hintStyle: Theme.of(context).textTheme.titleSmall!.apply(
                    color: TColors.darkerGrey,
                  ),
              border: InputBorder.none,
              focusedBorder: InputBorder.none,
              enabledBorder: InputBorder.none,
            ),
          ),
        ),
      ],
    );
  }
}
