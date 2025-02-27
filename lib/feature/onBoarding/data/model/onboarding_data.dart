import '../../../../core/resources/assets_manger.dart';
import '../../../../core/resources/strings_manger.dart';
import 'onboarding_item.dart';

final List<OnboardingItem> onboardingPages = [
  OnboardingItem(
    title:AppString.titles[0] ,
    subtitle: AppString.subtitles[0],
      imagePath: ImageAssets.onboardingLogo1,
  ),
  OnboardingItem(
    title: AppString.titles[1],
    subtitle: AppString.subtitles[1],
    imagePath: ImageAssets.onboardingLogo2,
  ),
  OnboardingItem(
    title:AppString.titles[2] ,
    subtitle: AppString.subtitles[2],
    imagePath: ImageAssets.onboardingLogo3,
  ),
];
