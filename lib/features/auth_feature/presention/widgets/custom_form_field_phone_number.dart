import 'package:flutter/material.dart';
import 'package:route_smart/core/app/theme/my_colors.dart';
import 'package:route_smart/core/common/widgets/adabtive_text_form_field.dart';
import 'package:route_smart/core/extensions/app_validators.dart';

class CustomFormFieldPhoneNumber extends StatelessWidget {
  const CustomFormFieldPhoneNumber({
    super.key,
    required TextEditingController phoneController,
  }) : _phoneController = phoneController;

  final TextEditingController _phoneController;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Phone Number', style: Theme.of(context).textTheme.labelLarge),
        const SizedBox(height: 10),
        Row(
          children: [
            Container(
              width: 70,
              height: 55,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: Colors.grey[50],
                border: Border.all(color: MyColors.light.stroke),
                borderRadius: BorderRadius.circular(10.67),
              ),
              child: const Text('+20', style: TextStyle(fontWeight: FontWeight.bold)),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: AdaptiveInputField(
                validate: AppValidators.validatePhone,
                context: context,
                controller: _phoneController,
                hintText: '01010700701',
                keyboardType: TextInputType.phone,
              ),
            ),
          ],
        ),
        const SizedBox(height: 20),
      ],
    );
  }
}