import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../textstyles.dart';
import 'intro_screen4.dart'; // Make sure this import points to your screen

// Step 1: Create a GetX Controller
class IntroScreen3Controller extends GetxController {
  var isLoading = false.obs;

  void startTrial() async {
    isLoading.value = true;

    // Show loading for 2 seconds
    await Future.delayed(const Duration(seconds: 2));

    isLoading.value = false;

    // Navigate to IntroScreen4 using GetX
    Get.to(() => const IntroScreen4());
  }
}

class IntroScreen3 extends StatelessWidget {
  const IntroScreen3({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Step 2: Initialize the controller
    final IntroScreen3Controller controller = Get.put(IntroScreen3Controller());

    return Scaffold(
      body: Stack(
        children: [
          // Background Image
          Positioned.fill(
            child: Image.asset(
              'assets/Background.png',
              fit: BoxFit.cover,
            ),
          ),

          // Content
          SafeArea(
            child: Column(
              children: [
                // Top Bar with Close Button
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
                  child: Align(
                    alignment: Alignment.topRight,
                    child: GestureDetector(
                      onTap: () => Navigator.pop(context),
                      child: Container(
                        width: 44.w,
                        height: 44.w,
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.2),
                          shape: BoxShape.circle,
                        ),
                        child: Icon(
                          Icons.close,
                          color: Colors.white,
                          size: 24.sp,
                        ),
                      ),
                    ),
                  ),
                ),

                SizedBox(height: 20.h),

                // Logo Image
                Image.asset(
                  'assets/logo.png',
                  width: 280.w,
                  height: 140.h,
                  fit: BoxFit.contain,
                ),

                SizedBox(height: 30.h),

                // Title
                Text(
                  'How your Premium',
                  style: sfProDisplay600(32.sp, Colors.white),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 4.h),
                Text(
                  'free trial works',
                  style: sfProDisplay600(32.sp, Colors.white),
                  textAlign: TextAlign.center,
                ),

                SizedBox(height: 40.h),

                // Trial Image
                SizedBox(
                  height: 283.h,
                  child: Image.asset('assets/trial.png'),
                ),

                // Bottom Button
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 20.h),
                  child: Obx(() => GestureDetector(
                    onTap: controller.isLoading.value ? null : controller.startTrial,
                    child: Container(
                      width: double.infinity,
                      height: 56.h,
                      decoration: BoxDecoration(
                        gradient: const LinearGradient(
                          colors: [
                            Color(0xFFE8B87E),
                            Color(0xFFD4A574),
                          ],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),
                        borderRadius: BorderRadius.circular(28.r),
                      ),
                      child: Center(
                        child: controller.isLoading.value
                            ? SizedBox(
                          width: 24.w,
                          height: 24.w,
                          child: const CircularProgressIndicator(
                            strokeWidth: 2.5,
                            valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                          ),
                        )
                            : Text(
                          'Start My 14 Day Free Trial',
                          style: sfProText500(17.sp, Colors.white),
                        ),
                      ),
                    ),
                  )),
                ),

                SizedBox(height: 10.h),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
