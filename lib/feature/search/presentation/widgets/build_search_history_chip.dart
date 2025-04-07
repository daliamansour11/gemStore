import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/services/firebase_analytic.dart';
import 'search_result_card.dart';
import '../../../../core/resources/assets_manger.dart';
import 'search_textfield_widget.dart';
import '../../../../config/theme/theme_data.dart';
import '../../../../core/resources/colors_manger.dart';
import '../../../../core/resources/font_manger.dart';
import '../../../../core/resources/strings_manger.dart';
import '../../../../core/resources/values_manger.dart';

class BuildSearchHistoryChip extends StatefulWidget {
  const BuildSearchHistoryChip({
    super.key,
  });

  @override
  State<BuildSearchHistoryChip> createState() => _BuildSearchHistoryChipState();
}

class _BuildSearchHistoryChipState extends State<BuildSearchHistoryChip> {
  TextEditingController searchController = TextEditingController();
  List<String> recentSearches = [];

  void _addSearchItem(String text) {
    if (text.isNotEmpty && !recentSearches.contains(text)) {
      setState(() {
        recentSearches.add(text);
      });
    }
    searchController.clear();
  }

  void _clearAllSearches() {
    setState(() {
      recentSearches.clear();
    });
  }

  void _removeSearchItem(int index) {
    setState(() {
      recentSearches.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.only(
                    left: AppPadding.p33,
                    top: AppPadding.p40,
                    bottom: AppPadding.p22),
                child: CircleAvatar(
                  backgroundColor: Colors.white,
                  child: IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(
                      Icons.arrow_back_ios,
                      size: 20,
                      color: ColorsManger.dark,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
        SearchTextFieldWidget(
            label: 'search',
            controller: searchController,
            isReadOnly: false,
            onPressed: () {
              FirebaseAnalytic.buttonClicked('searchTextField clicked');
            },
            onSubmit: (value) {
              value = searchController.text;
              _addSearchItem(searchController.text);

              const SearchResultCard();
            }),

        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.only(
                  top: AppPadding.p28,
                  bottom: AppPadding.p28,
                  left: AppPadding.p33),
              child: Text(
                AppString.recentSearches,
                style: appTheme().textTheme.titleLarge,
              ),
            ),
            // if (recentSearches.isNotEmpty)
            Padding(
              padding: const EdgeInsets.only(
                top: AppPadding.p28,
                bottom: AppPadding.p28,
                right: AppPadding.p28,
              ),
              child: InkWell(
                child: Image.asset(
                  ImageAssets.trashIcon,
                ),
                onTap: () {
                  FirebaseAnalytic.buttonClicked('clear_button clicked');
                  _clearAllSearches();
                },
              ),
            )
          ],
        ),
        // SizedBox(height: 10,),
        Wrap(
          spacing: 15,
          runSpacing: 20,
          children: recentSearches.map((search) {
            return _buildSearchHistoryChip(
              search,
            );
          }).toList(),
        ),
      ],
    );
  }

  Widget _buildSearchHistoryChip(String text) {
    int index = 0;
    return Container(
        width: 163.w,
        height: 38.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: ColorsManger.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.9),
              offset: const Offset(0, 1),
              blurRadius: 1,
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.only(
                  top: AppPadding.p8,
                  bottom: AppPadding.p8,
                  left: AppPadding.p22,
                  right: AppPadding.p21),
              child: Flexible(
                fit: FlexFit.loose,
                child: Text(
                  text,
                  style: TextStyle(
                      color: ColorsManger.rentSearchColors.withOpacity(0.7),
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      fontFamily: FontConstants.nunitoFamily),
                ),
              ),
            ),
            IconButton(
                onPressed: () {
                  _removeSearchItem(index);
                },
                icon: const Icon(
                  Icons.clear,
                  color: ColorsManger.lightGrey,
                ))
          ],
        ));
  }
}
