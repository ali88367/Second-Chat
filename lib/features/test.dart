import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:second_chat/core/constants/app_images/app_images.dart';
import 'package:second_chat/features/main_section/settings/settings_bottomsheet_column.dart';
import '../../core/widgets/custom_app_bar.dart';
import '../../core/widgets/custom_text_field.dart';
import '../../core/widgets/custom_button.dart';
import '../../core/widgets/custom_switch.dart';
import '../../core/constants/app_colors/app_colors.dart';

class Test extends StatefulWidget {
  const Test({super.key});

  @override
  State<Test> createState() => _TestState();
}

class _TestState extends State<Test> {
  String _test = '';
  bool _switchValue = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Expanded(
          child: Container(
            decoration: BoxDecoration(
              color: Colors.black
              // image: DecorationImage(image: AssetImage(AppImages.background), fit: BoxFit.fill)
            ),
            child: SettingsBottomsheetColumn(),
          ),
        ),
      ),
    );
  }
}
