import 'dart:developer';

import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:package_info_plus/package_info_plus.dart';

class RemoteConfigService {
  final FirebaseRemoteConfig _remoteConfig = FirebaseRemoteConfig.instance;

  Future<void> initialize() async {
    try {
      await _remoteConfig.setDefaults({
        'required_build_number': '1',
      });

      await _remoteConfig.setConfigSettings(RemoteConfigSettings(
        fetchTimeout: const Duration(seconds: 10),
        minimumFetchInterval: const Duration(hours: 1), 
      ));

      await _remoteConfig.fetchAndActivate();
    } catch (e) {
      log('Error initializing Remote Config: $e');
    }
  }

  Future<bool> isUpdateRequired() async {
    try {
      String requiredBuildNumber = _remoteConfig.getString('required_build_number');
      PackageInfo packageInfo = await PackageInfo.fromPlatform();
      String currentBuildNumber = packageInfo.buildNumber;

      int required = int.tryParse(requiredBuildNumber) ?? 0;
      int current = int.tryParse(currentBuildNumber) ?? 0;

      log('Required Build Number: $required');
      log('Current Build Number: $current');

      return current < required;
    } catch (e) {
      log('Error checking update: $e');
      return false;
    }
  }
}