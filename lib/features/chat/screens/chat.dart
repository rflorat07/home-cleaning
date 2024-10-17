import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../common/common.dart';
import '../../../utils/utils.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: TColors.green,
      appBar: TAppBar(
        systemOverlayStyle: SystemUiOverlayStyle.light,
        title: Row(
          children: [
            const CircleAvatar(
              radius: 20,
              backgroundColor: TColors.lightSilver,
            ),
            const SizedBox(width: TSizes.sm),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Jenny Wilson',
                    style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                        color: TColors.white, fontWeight: FontWeight.w500)),
                Text('Online',
                    style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                        color: TColors.white, fontWeight: FontWeight.w100)),
              ],
            ),
          ],
        ),
        actions: [
          IconButton.filled(
            iconSize: TSizes.appBarIconSize,
            onPressed: () {},
            style: ButtonStyle(
                backgroundColor: WidgetStateProperty.all(TColors.white)),
            icon: Transform.rotate(
                angle: 90 * pi / 180,
                child: const Icon(Icons.more_horiz_outlined)),
          )
        ],
      ),
      body: TRoundedContainer(
        width: double.infinity,
        margin: const EdgeInsets.only(top: TSizes.defaultSpace),
        padding: const EdgeInsets.all(TSizes.defaultSpace),
        isBorderRadiusCircular: false,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
        child: Column(
          children: [
            Text('TODAY', style: Theme.of(context).textTheme.labelLarge),
            Container(
              margin: const EdgeInsets.only(right: 50),
              child: Column(
                children: [
                  const SizedBox(height: TSizes.spaceBtwItems),
                  TRoundedContainer(
                    showBorder: true,
                    padding: const EdgeInsets.all(TSizes.defaultSpace / 2),
                    isBorderRadiusCircular: false,
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(8),
                      topRight: Radius.circular(8),
                      bottomRight: Radius.circular(8),
                    ),
                    child: Text(
                        'Lorem Ipsum is simply dummy text of the printing and typesetting industry.',
                        style: Theme.of(context)
                            .textTheme
                            .labelLarge!
                            .apply(heightFactor: 1.5)),
                  ),
                  const SizedBox(height: TSizes.spaceBtwItems),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          const CircleAvatar(
                            radius: TSizes.spaceBtwSections / 2,
                            backgroundColor: TColors.lightSilver,
                          ),
                          const SizedBox(width: TSizes.sm),
                          Text(
                            'Jenny Wilson',
                            style: Theme.of(context).textTheme.labelLarge,
                          ),
                        ],
                      ),
                      Text(
                        '08:04 pm',
                        style: Theme.of(context).textTheme.labelLarge,
                      )
                    ],
                  ),
                  const SizedBox(height: TSizes.spaceBtwItems),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.only(left: 50),
              child: Column(
                children: [
                  TRoundedContainer(
                    backgroundColor: TColors.green,
                    padding: const EdgeInsets.all(TSizes.defaultSpace / 2),
                    isBorderRadiusCircular: false,
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(8),
                      topRight: Radius.circular(8),
                      bottomLeft: Radius.circular(8),
                    ),
                    child: Text(
                        'Lorem Ipsum is simply dummy text of the printing and typesetting industry.',
                        style: Theme.of(context)
                            .textTheme
                            .labelLarge!
                            .apply(color: TColors.white, heightFactor: 1.5)),
                  ),
                  const SizedBox(height: TSizes.spaceBtwItems),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '08:04 pm',
                        style: Theme.of(context).textTheme.labelLarge,
                      ),
                      Row(
                        children: [
                          const CircleAvatar(
                            radius: TSizes.spaceBtwSections / 2,
                            backgroundColor: TColors.lightSilver,
                          ),
                          const SizedBox(width: TSizes.sm),
                          Text(
                            'Esther Howard',
                            style: Theme.of(context).textTheme.labelLarge,
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: TSizes.spaceBtwItems),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
