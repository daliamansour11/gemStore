import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/extentions/sizes_utils_extensions.dart';
import '../../../../core/resources/colors_manger.dart';
import '../../../../core/resources/strings_manger.dart';

class CountryPickerWidget extends StatefulWidget {
  const CountryPickerWidget({super.key});

  @override
  _CountryPickerWidgetState createState() => _CountryPickerWidgetState();
}

class _CountryPickerWidgetState extends State<CountryPickerWidget> {
  String? selectedCountry;

  void _selectCountry() {
    showCountryPicker(
      context: context,
      showPhoneCode: false,
      searchAutofocus: true,
      countryListTheme: CountryListThemeData(
        bottomSheetHeight: 500.h,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(16.0.r),
          topRight: Radius.circular(16.0.r),
        ),
      ),
      onSelect: (Country country) {
        setState(() => selectedCountry = country.name);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _selectCountry,
      child: Container(
        padding: 12.ph + 16.pv,
        decoration: BoxDecoration(
          border: Border.all(color: ColorsManger.grey),
          borderRadius: BorderRadius.circular(8.r),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              selectedCountry ?? AppString.selectCountry,
              style: TextStyle(fontSize: 16.sp),
            ),
            const Icon(Icons.arrow_drop_down),
          ],
        ),
      ),
    );
  }
}
