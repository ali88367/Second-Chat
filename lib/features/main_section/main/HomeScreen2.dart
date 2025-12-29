import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:second_chat/core/themes/textstyles.dart';

class HomeScreen2 extends StatelessWidget {
  const HomeScreen2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0A0A0A),
      body: Stack(
        children: [
          // 🔹 Top Background Image
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            height: 300.h,
            child: Image.asset(
              'assets/images/topbarshade.png',
              fit: BoxFit.cover,
            ),
          ),

          // 🔹 Gradient Overlay
          Positioned.fill(
            child: Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Color(0x661A1A1A), Color(0xFF0A0A0A)],
                ),
              ),
            ),
          ),

          // 🔹 Header (Image Buttons)
          SafeArea(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 28.h),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Offline Button
                  _buildImageButton(
                    'assets/images/offline.png',
                    width: 119.w,
                    height: 36.h,
                  ),

                  // Right Buttons
                  Row(
                    children: [
                      _buildImageButton(
                        'assets/images/streak_icon.png',
                        width: 72.w,
                        height: 36.w,
                      ),
                      SizedBox(width: 6.w),
                      _buildImageButton(
                        'assets/images/gift.png',
                        width: 36.w,
                        height: 36.w,
                      ),
                      SizedBox(width: 6.w),
                      _buildImageButton(
                        'assets/images/settings.png',
                        width: 36.w,
                        height: 36.w,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),

          // 🔹 Center Content
// 🔹 Center Content
          // 🔹 Center Content with Stack
          Center(
            child: Stack(
              alignment: Alignment.center,
              clipBehavior: Clip.none,
              children: [
                // The main text
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Image.asset(
                      'assets/images/stream.png',
                      width: 47.w,
                      height: 56.w,
                    ),
                    SizedBox(height: 24.h),
                    Text(
                      'You haven\'t started the\nstream yet, but in the\nmeantime you can',
                      textAlign: TextAlign.center,
                      style: sfProDisplay400(28.sp, Color.fromRGBO(255, 255, 255, 0.4))
                    ),
                  ],
                ),

                // Arrow Positioned below the text
                Positioned(
                 right: -18.w,
                  top: 145.h, // adjust this value to move the arrow up/down
                  child: Image.asset(
                    'assets/images/arrow.png',
                    width: 30.w,
                    height: 75.w,
                  ),
                ),
              ],
            ),
          ),

        ],
      ),
    );
  }

  /// 🔹 Reusable Image Button
  static Widget _buildImageButton(
    String assetPath, {
    required double width,
    required double height,
  }) {
    return SizedBox(
      width: width,
      height: height,
      child: Image.asset(assetPath, fit: BoxFit.contain),
    );
  }
}
