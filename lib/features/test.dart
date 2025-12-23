import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
      appBar: CustomAppBar(
        title: 'Test',
        showBackButton: true,
        onBackPressed: () {
          Get.back();
        },
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.search),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(height: 20.h),
            Text(
              'Custom Components Test',
              style: TextStyle(
                fontSize: 24.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 32.h),
            
            // Custom Text Field
            CustomTextField(
              label: 'Test Input',
              hint: 'Enter text here',
              onChanged: (value) {
                setState(() {
                  _test = value;
                });
              },
            ),
            SizedBox(height: 24.h),

            // Custom Switch
            CustomSwitch(
              value: _switchValue,
              onChanged: (value) {
                setState(() {
                  _switchValue = value;
                });
              },
              label: 'Enable Notifications',
              description: 'Receive push notifications',
            ),
            SizedBox(height: 32.h),

            // Custom Button Examples
            Text(
              'Button Examples',
              style: TextStyle(
                fontSize: 18.sp,
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(height: 16.h),

            // Default Button (Full Width, Rounded)
            CustomButton(
              text: 'Default Button',
              onPressed: () {
                // Handle button press
              },
            ),
            SizedBox(height: 16.h),

            // Custom Styled Button
            CustomButton(
              text: 'Custom Styled Button',
              backgroundColor: AppColors.secondary,
              foregroundColor: AppColors.textInverse,
              borderRadius: 20.r,
              height: 60.h,
              onPressed: () {
                // Handle button press
              },
            ),
            SizedBox(height: 16.h),

            // Button with Icon
            CustomButton(
              text: 'Button with Icon',
              prefixIcon: Icons.add,
              backgroundColor: AppColors.accent,
              foregroundColor: AppColors.textInverse,
              onPressed: () {
                // Handle button press
              },
            ),
            SizedBox(height: 16.h),

            // Button with Custom Shadow
            CustomButton(
              text: 'Button with Shadow',
              backgroundColor: AppColors.primary,
              foregroundColor: AppColors.textInverse,
              boxShadow: [
                BoxShadow(
                  color: AppColors.primary.withOpacity(0.3),
                  blurRadius: 12,
                  offset: const Offset(0, 6),
                ),
              ],
              onPressed: () {
                // Handle button press
              },
            ),
            SizedBox(height: 16.h),

            // Custom Width Button
            CustomButton(
              text: 'Custom Width Button',
              width: 200.w,
              backgroundColor: AppColors.success,
              foregroundColor: AppColors.textInverse,
              borderRadius: 25.r,
              onPressed: () {
                // Handle button press
              },
            ),
            SizedBox(height: 16.h),

            // Loading Button
            CustomButton(
              text: 'Loading Button',
              isLoading: true,
              backgroundColor: AppColors.primary,
              foregroundColor: AppColors.textInverse,
              onPressed: () {
                // Handle button press
              },
            ),
            SizedBox(height: 16.h),

            // Disabled Button
            CustomButton(
              text: 'Disabled Button',
              isDisabled: true,
              backgroundColor: AppColors.primary,
              foregroundColor: AppColors.textInverse,
              onPressed: () {
                // Handle button press
              },
            ),
            SizedBox(height: 16.h),

            // Button with Border
            CustomButton(
              text: 'Button with Border',
              backgroundColor: Colors.transparent,
              foregroundColor: AppColors.primary,
              borderColor: AppColors.primary,
              borderWidth: 2.w,
              borderRadius: 15.r,
              onPressed: () {
                // Handle button press
              },
            ),
            SizedBox(height: 32.h),
          ],
        ),
      ),
    );
  }
}
