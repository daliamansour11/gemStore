import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';

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
      countryListTheme: const CountryListThemeData(
        bottomSheetHeight: 500,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(16.0),
          topRight: Radius.circular(16.0),
        ),
      ),
      onSelect: (Country country) {
        setState(() {
          selectedCountry = country.name;
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _selectCountry,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              selectedCountry ?? 'Select Country',
              style: const TextStyle(fontSize: 16),
            ),
            const Icon(Icons.arrow_drop_down),
          ],
        ),
      ),
    );
  }
}
