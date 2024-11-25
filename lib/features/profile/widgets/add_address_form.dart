
import 'package:flutter/material.dart';

import '../../../common/common.dart';
import '../../../utils/utils.dart';

class AddAddressForm extends StatelessWidget {
  const AddAddressForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Padding(
        padding: EdgeInsets.symmetric(
            horizontal: TSizes.defaultSpace),
        child: Form(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// Complete address
              CustomTextFormField(
                maxLines: 5,
                labelText: TTexts.completeAddress,
                placeholder: TTexts.completeAddressPlaceholder,
              ),
    
              SizedBox(height: TSizes.size16),
    
              /// Floor
              CustomTextFormField(
                labelText: TTexts.floor,
                placeholder: TTexts.floorPlaceholder,
              ),
    
              SizedBox(height: TSizes.size16),
    
              /// Landmark
              CustomTextFormField(
                labelText: TTexts.landmark,
                placeholder: TTexts.landmarkPlaceholder,
              ),
            ],
          ),
        ));
  }
}