import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../utils/utils.dart';
import '../controllers/service_details.controller.dart';

class ServiceDetailsBookContainer extends StatelessWidget {
  const ServiceDetailsBookContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = ServiceDetailsController.instance;
    return Container(
      height: TSizes.size68,
      padding: const EdgeInsets.symmetric(
          horizontal: TSizes.defaultSpace, vertical: TSizes.size8),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(16),
          topRight: Radius.circular(16),
        ),
        border: Border(
          top: BorderSide(color: TColors.borderPrimary),
          left: BorderSide(color: TColors.borderPrimary),
          right: BorderSide(color: TColors.borderPrimary),
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Total Price',
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium!
                      .apply(color: TColors.davyGrey)),
              Obx(
                () => Text(
                    '\$ ${controller.serviceSelected.value.price.toStringAsFixed(2)}',
                    style: Theme.of(context)
                        .textTheme
                        .titleMedium!
                        .apply(color: TColors.green)),
              ),
            ],
          ),
          FilledButton(
            onPressed: () {},
            style: ButtonStyle(
              padding: WidgetStateProperty.all(
                const EdgeInsets.symmetric(
                    horizontal: TSizes.size50, vertical: TSizes.size12),
              ),
              textStyle: WidgetStateProperty.all(
                Theme.of(context)
                    .textTheme
                    .titleMedium!
                    .apply(color: TColors.white),
              ),
              backgroundColor: WidgetStateProperty.all(TColors.green),
            ),
            child: const Text('Book Now'),
          ),
        ],
      ),
    );
  }
}
