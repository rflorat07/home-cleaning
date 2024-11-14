import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_core/theme.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';

import '../../../utils/utils.dart';

class TCustomPriceRange extends StatelessWidget {
  const TCustomPriceRange({super.key});

  @override
  Widget build(BuildContext context) {
    SfRangeValues values = const SfRangeValues(30.0, 60.0);

    return Padding(
      padding: const EdgeInsets.all(TSizes.defaultSpace),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Label
          Text(
            TTexts.priceRange,
            style: Theme.of(context)
                .textTheme
                .headlineSmall!
                .copyWith(fontWeight: FontWeight.w500),
          ),

          const SizedBox(height: TSizes.size12),

          SfRangeSliderTheme(
            data: TSliderThemeData.lightSfRangeSliderThemeData,
            child: SfRangeSlider(
              min: 20.0,
              max: 70.0,
              numberFormat: NumberFormat('\$'),
              values: values,
              interval: 10.0,
              showLabels: true,
              onChanged: (dynamic value) {},
            ),
          )
        ],
      ),
    );
  }
}
