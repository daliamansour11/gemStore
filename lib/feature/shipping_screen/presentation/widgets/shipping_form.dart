import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/extentions/extentions.dart';
import '../../../../core/global/global.dart';
import '../../../../core/resources/strings_manger.dart';
import '../../../cart_screen/presentation/widgets/custom_button.dart';
import '../pages/shipping_complete.dart';
import 'country_picker.dart';
import 'custom_text_field.dart';
import 'shipping_method.dart';

class ShippingForm extends StatefulWidget {
  const ShippingForm({super.key});

  @override
  State<ShippingForm> createState() => _ShippingFormState();
}

class _ShippingFormState extends State<ShippingForm> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController streetController = TextEditingController();
  final TextEditingController cityController = TextEditingController();
  final TextEditingController stateController = TextEditingController();
  final TextEditingController zipCodeController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: ListView(
        shrinkWrap: true,
        physics: const BouncingScrollPhysics(),
        children: [
          CustomTextField(
              label: AppString.firstName,
              controller: firstNameController,
              isRequired: true,
              keyboardType: TextInputType.name),
          CustomTextField(
              label: AppString.lastName,
              controller: lastNameController,
              isRequired: true,
              keyboardType: TextInputType.name),
          const CountryPickerWidget(),
          CustomTextField(
              label: AppString.streetName,
              controller: streetController,
              isRequired: true,
              keyboardType: TextInputType.text),
          CustomTextField(
              label: AppString.city,
              controller: cityController,
              isRequired: true,
              keyboardType: TextInputType.text),
          CustomTextField(
              label: AppString.state,
              controller: stateController,
              isRequired: true,
              keyboardType: TextInputType.text),
          CustomTextField(
              label: AppString.zipCode,
              controller: zipCodeController,
              isRequired: true,
              keyboardType: TextInputType.number),
          CustomTextField(
              label: AppString.phoneNumber,
              controller: phoneController,
              isRequired: true,
              keyboardType: TextInputType.phone),
          SizedBox(height: 20.h),
          const ShippingMethod(),
          SizedBox(height: 20.h),
          CustomButton(
            onPressed: () {
              Global.analytics.logEvent(
                name: 'Payment_button_clicked',
                parameters: {
                  'button_name': 'Continue to payment',
                },
              );
              // if (_formKey.currentState?.validate() ?? false) {}
              context.pushNamed(const ShippingComplete());
            },
            title: AppString.continueToPayment,
          ),
        ],
      ),
    );
  }
}
