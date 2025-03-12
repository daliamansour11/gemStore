import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';

import '../../../../core/resources/strings_manger.dart';
import '../../../../core/utils/custom_app_bar.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: customAppBar(title: AppString.settingAppBar, context: context,
          isBackable: false, haveActions: false),
      body: Column(
        children: [
          _buildSettingsItem(Icons.language, 'Language'),
          _buildSettingsItem(Icons.article, 'Terms of Use'),
          _buildSettingsItem(Icons.info_outline, 'Privacy Policy'),
        ],
      ),
    );
  }

  Widget _buildSettingsItem(IconData icon, String title) {
    return ListTile(
      leading: Icon(icon, color: Colors.grey.shade600),
      title: Text(title, style: const TextStyle(fontSize: 16)),
      trailing: const Icon(Icons.arrow_forward_ios, size: 16, color: Colors.grey),
      onTap: () {
        // Add navigation logic here
      },
    );
  }
}
