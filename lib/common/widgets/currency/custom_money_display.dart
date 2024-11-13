import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../utils/utils.dart';

class CustomMoneyDisplay extends StatelessWidget {
  const CustomMoneyDisplay({
    super.key,
    this.padding,
    this.amountStyle,
    required this.amount,
  });
  final double amount;
  final TextStyle? amountStyle;
  final EdgeInsets? padding;

  @override
  Widget build(BuildContext context) {
    final formater = NumberFormat.currency(
      locale: 'en_US',
      customPattern: '#,###.##',
      symbol: '',
      decimalDigits: 2,
    );

    final String convertedMoneyToString = formater.format(amount);

    return Container(
      padding: padding,
      child: Text(
        '\$ $convertedMoneyToString',
        style: amountStyle ??
            Theme.of(context).textTheme.bodyLarge!.apply(color: TColors.green),
      ),
    );
  }
}
