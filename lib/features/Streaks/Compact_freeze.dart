import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:second_chat/core/constants/app_colors/app_colors.dart';
import 'package:second_chat/core/themes/textstyles.dart';
import 'package:second_chat/features/Streaks/Compact_freeze.dart';
import 'package:second_chat/features/Streaks/Freeze_bottomsheet.dart';
import 'package:second_chat/features/Streaks/Last_streak.dart';
import '../../controllers/Main Section Controllers/streak_controller.dart';

class StreakFreezeSingleRowPreviewBottomSheet extends StatelessWidget {
  const StreakFreezeSingleRowPreviewBottomSheet({super.key});

  static const int days = 7;
  static const double cardWidth = 361;
  static const double cardHeight = 248;
  static const double horizontalPadding = 12;
  static const double rowHeight = 28;
  static const double rowSpacing = 12;

  // ---------------- ICONS ----------------

  Widget _tick({
    bool grey = false,
    bool highlighted = false,
    bool darkCircle = false,
    bool plainWhite = false,
  }) {
    return Container(
      padding: EdgeInsets.all(4.w),
      decoration: (highlighted || darkCircle)
          ? BoxDecoration(
        color: darkCircle
            ? const Color(0xFF3C3C43).withOpacity(0.6)
            : Colors.white,
        shape: BoxShape.circle,
      )
          : null,
      child: Icon(
        Icons.check,
        size: 18.sp,
        color: plainWhite
            ? Colors.white
            : (darkCircle || highlighted
            ? (highlighted ? const Color(0xFFFDB747) : Colors.white)
            : (grey ? const Color(0xFF8E8E93) : Colors.white)),
      ),
    );
  }

  Widget _cross() => Icon(Icons.close, color: const Color(0xFF8E8E93), size: 22.sp);

  Widget _freeze() => Icon(Icons.ac_unit, color: Colors.cyanAccent, size: 26.sp);

  Widget _dot() => Opacity(
    opacity: 0.3,
    child: Icon(Icons.circle, size: 10.sp, color: Colors.white),
  );

  // ---------------- LAYOUT HELPERS ----------------

  double get _cellWidth =>
      (cardWidth.w - (horizontalPadding.w * 2) - 22.w * (days - 1)) / days;

  Widget _cell(Widget child) {
    return SizedBox(
      width: _cellWidth,
      child: Center(child: child),
    );
  }

  Widget _gradient({required int start, required int end}) {
    return Positioned(
      left: start * (_cellWidth + 22.w),
      width: (end - start + 1) * _cellWidth + (end - start) * 22.w,
      top: 0,
      bottom: 0,
      child: Container(
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            colors: [
              Color(0xFFF2B269),
              Color(0xFFFFE6A7),
            ],
          ),
          borderRadius: BorderRadius.circular(22.r),
        ),
      ),
    );
  }

  Widget _row({
    int? gradientStart,
    int? gradientEnd,
    required List<Widget> children,
  }) {
    return SizedBox(
      height: rowHeight.h,
      child: Stack(
        alignment: Alignment.centerLeft,
        children: [
          if (gradientStart != null && gradientEnd != null)
            _gradient(start: gradientStart, end: gradientEnd),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: List.generate(days, (i) => _cell(children[i])),
          ),
        ],
      ),
    );
  }

  // ---------------- UI ----------------

  @override
  Widget build(BuildContext context) {
    Get.put(StreamStreaksController());

    return Container(
      height: Get.height * 0.9,
      decoration: BoxDecoration(
        color: bottomSheetGrey,
        borderRadius: const BorderRadius.vertical(top: Radius.circular(18)),
      ),
      child: ClipRRect(
        borderRadius: const BorderRadius.vertical(top: Radius.circular(18)),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          // Use bottomSheet to create a native "Done" button bar style
          bottomSheet: Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
            color: bottomSheetGrey,
            child: SafeArea(
              top: false,
              child: SizedBox(
                height: 50.h,
                child: ElevatedButton(
                  onPressed: () {
                    Get.bottomSheet(
                      const StreakFreezeUseBottomSheet(),
                      isScrollControlled: true,
                      ignoreSafeArea: false,
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(36.r),
                    ),
                  ),
                  child: Text(
                    "Done",
                    style: sfProText600(17.sp, Colors.black),
                  ),
                ),
              ),
            ),
          ),
          body: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            // Extra padding at bottom to prevent content from being hidden under the bottomSheet
            padding: EdgeInsets.only(bottom: 80.h),
            child: Column(
              children: [
                SizedBox(height: 12.h),

                // Header
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        onTap: Get.back,
                        child: Image.asset(
                          'assets/icons/x_icon.png',
                          height: 44.h,
                        ),
                      ),
                      Text(
                        "Stream Streaks",
                        style: sfProText600(17.sp, Colors.white),
                      ),
                      SizedBox(width: 44.w),
                    ],
                  ),
                ),

                Image.asset(
                  'assets/images/Content(3).png',
                  width: 560.w,
                  height: 462.w,
                  fit: BoxFit.cover,
                ),

                SizedBox(height: 20.h),

                // Calendar Card
                Container(
                  width: 361.w,
                  height: 88.h,
                  padding: EdgeInsets.symmetric(
                    horizontal: horizontalPadding.w,
                    vertical: 12.h,
                  ),
                  decoration: BoxDecoration(
                    color: const Color(0xFF1E1D20),
                    borderRadius: BorderRadius.circular(24.r),
                  ),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 20.h,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: ['Mon', 'Tue', 'Wed', 'Thur', 'Fri', 'Sat', 'Sun']
                              .map((d) => _cell(
                            Text(
                              d,
                              style: TextStyle(
                                color: const Color(0xFF8E8E93),
                                fontSize: 13.sp,
                              ),
                            ),
                          ))
                              .toList(),
                        ),
                      ),

                      SizedBox(height: rowSpacing.h),

                      _row(
                        gradientStart: 2,
                        gradientEnd: 4,
                        children: [
                          _tick(darkCircle: true),
                          _cross(),
                          _tick(plainWhite: true),
                          _tick(plainWhite: true),
                          _tick(highlighted: true),
                          _cross(),
                          _cross(),
                        ],
                      ),

                      const Spacer(),
                    ],
                  ),
                ),

                SizedBox(height: 40.h),
              ],
            ),
          ),
        ),
      ),
    );
  }
}