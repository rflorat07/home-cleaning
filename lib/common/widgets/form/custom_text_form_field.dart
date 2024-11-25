import 'package:flutter/material.dart';

import '../../../utils/utils.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    this.maxLines = 1,
    required this.labelText,
    required this.placeholder,
    this.fieldHeight = TSizes.size44,
  });

  final int? maxLines;
  final double? fieldHeight;
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
          decoration: const BoxDecoration(
            color: TColors.whiteSmoke,
            borderRadius: BorderRadius.all(
              Radius.circular(TSizes.size8),
            ),
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
