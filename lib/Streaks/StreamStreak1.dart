import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../textstyles.dart';

// Controller
class StreamStreaksController extends GetxController {
  var selectedDays = <String, bool>{
    'Mon': false,
    'Tue': true,
    'Wed': true,
    'Thur': true,
    'Fri': false,
    'Sat': true,
    'Sun': false,
  }.obs;

  var threeTimesWeek = false.obs;

  void toggleDay(String day) {
    selectedDays[day] = !selectedDays[day]!;
    selectedDays.refresh();
  }

  void toggleThreeTimesWeek(bool value) {
    threeTimesWeek.value = value;
    if (value) {
      // Auto-select first 3 days when enabled
      int count = 0;
      selectedDays.forEach((key, val) {
        if (count < 3) {
          selectedDays[key] = true;
          count++;
        } else {
          selectedDays[key] = false;
        }
      });
      selectedDays.refresh();
    }
  }

  bool get areDaysDisabled => threeTimesWeek.value;
}

// Screen
class StreamStreaksScreen extends StatelessWidget {
  final controller = Get.put(StreamStreaksController());
  StreamStreaksScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Column(
          children: [
            _buildHeader(),
            Expanded(
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  child: Column(
                    children: [
                      SizedBox(height: 40.h),
                      _buildFireIcon(),
                      SizedBox(height: 40.h),
                      _buildTitle(),
                      SizedBox(height: 12.h),
                      _buildSubtitle(),
                      SizedBox(height: 50.h),
                      _buildDayToggles(),
                      SizedBox(height: 40.h),
                      _buildDivider(),
                      SizedBox(height: 40.h),
                      _buildThreeTimesOption(),
                      SizedBox(height: 60.h),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 16.h),
      child: Row(
        children: [
          GestureDetector(
            onTap: () {
              // Navigation action - currently nothing as per requirement
            },
            child: Container(
              width: 40.w,
              height: 40.w,
              decoration: BoxDecoration(
                color: const Color(0xFF1C1C1E),
                borderRadius: BorderRadius.circular(12.r),
              ),
              child: Center(
                child: Icon(
                  Icons.close,
                  color: Colors.white,
                  size: 24.sp,
                ),
              ),
            ),
          ),
          Expanded(
            child: Center(
              child: Text(
                'Stream Streaks',
                style: sfProDisplay600(20.sp, Colors.white),
              ),
            ),
          ),
          SizedBox(width: 40.w), // Balance the layout
        ],
      ),
    );
  }

  Widget _buildFireIcon() {
    return Container(
      width: 280.w,
      height: 280.w,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
            color: const Color(0xFFFDB747).withOpacity(0.3),
            blurRadius: 100.r,
            spreadRadius: 30.r,
          ),
          BoxShadow(
            color: const Color(0xFFE6B8F5).withOpacity(0.2),
            blurRadius: 80.r,
            spreadRadius: 20.r,
          ),
        ],
      ),
      child: Center(
        child: Image.asset(
          'assets/fireicon.png',
          width: 140.w,
          height: 140.w,
          errorBuilder: (context, error, stackTrace) {
            // Fallback gradient fire icon
            return Container(
              width: 140.w,
              height: 140.w,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    const Color(0xFFFDB747),
                    const Color(0xFFE6B8F5),
                  ],
                ),
                borderRadius: BorderRadius.circular(70.r),
              ),
              child: Icon(
                Icons.local_fire_department,
                size: 80.sp,
                color: Colors.white,
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _buildTitle() {
    return Text(
      'Build a long-term habit',
      style: sfProDisplay600(28.sp, Colors.white),
      textAlign: TextAlign.center,
    );
  }

  Widget _buildSubtitle() {
    return Text(
      'Settings a streak goals  helps you stay consistent',
      style: sfProText400(15.sp, const Color(0xFF8E8E93)),
      textAlign: TextAlign.center,
    );
  }

  Widget _buildDayToggles() {
    return Obx(() {
      final days = controller.selectedDays.keys.toList();
      return Column(
        children: [
          _buildDayRow(days[0], days[1]),
          SizedBox(height: 16.h),
          _buildDayRow(days[2], days[3]),
          SizedBox(height: 16.h),
          _buildDayRow(days[4], days[5]),
          SizedBox(height: 16.h),
          _buildDayRow(days[6], null),
        ],
      );
    });
  }

  Widget _buildDayRow(String day1, String? day2) {
    return Row(
      children: [
        Expanded(
          child: _buildDayToggle(day1),
        ),
        if (day2 != null) ...[
          SizedBox(width: 16.w),
          Expanded(
            child: _buildDayToggle(day2),
          ),
        ] else
          Expanded(child: SizedBox()),
      ],
    );
  }

  Widget _buildDayToggle(String day) {
    return Obx(() {
      final isSelected = controller.selectedDays[day] ?? false;
      final isDisabled = controller.areDaysDisabled;

      return GestureDetector(
        onTap: isDisabled ? null : () => controller.toggleDay(day),
        child: AnimatedOpacity(
          duration: const Duration(milliseconds: 200),
          opacity: isDisabled ? 0.4 : 1.0,
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 16.h),
            decoration: BoxDecoration(
              color: const Color(0xFF1C1C1E),
              borderRadius: BorderRadius.circular(14.r),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  day,
                  style: sfProText400(
                    17.sp,
                    isSelected ? Colors.white : const Color(0xFF8E8E93),
                  ),
                ),
                AnimatedContainer(
                  duration: const Duration(milliseconds: 200),
                  width: 51.w,
                  height: 31.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15.5.r),
                    color: isSelected
                        ? const Color(0xFFFDB747)
                        : const Color(0xFF39393D),
                  ),
                  child: AnimatedAlign(
                    duration: const Duration(milliseconds: 200),
                    curve: Curves.easeInOut,
                    alignment:
                    isSelected ? Alignment.centerRight : Alignment.centerLeft,
                    child: Container(
                      width: 27.w,
                      height: 27.w,
                      margin: EdgeInsets.symmetric(horizontal: 2.w),
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    });
  }

  Widget _buildDivider() {
    return Row(
      children: [
        Expanded(
          child: Container(
            height: 1.h,
            color: const Color(0xFF2C2C2E),
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Text(
            'OR',
            style: sfProText400(13.sp, const Color(0xFF8E8E93)),
          ),
        ),
        Expanded(
          child: Container(
            height: 1.h,
            color: const Color(0xFF2C2C2E),
          ),
        ),
      ],
    );
  }

  Widget _buildThreeTimesOption() {
    return Obx(() {
      final isSelected = controller.threeTimesWeek.value;
      return GestureDetector(
        onTap: () => controller.toggleThreeTimesWeek(!isSelected),
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 16.h),
          decoration: BoxDecoration(
            color: const Color(0xFF1C1C1E),
            borderRadius: BorderRadius.circular(14.r),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Icon(
                    Icons.repeat,
                    color: const Color(0xFF8E8E93),
                    size: 20.sp,
                  ),
                  SizedBox(width: 12.w),
                  Text(
                    '3-times a week',
                    style: sfProText400(
                      17.sp,
                      isSelected ? Colors.white : const Color(0xFF8E8E93),
                    ),
                  ),
                ],
              ),
              AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                width: 51.w,
                height: 31.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15.5.r),
                  color: isSelected
                      ? const Color(0xFFFDB747)
                      : const Color(0xFF39393D),
                ),
                child: AnimatedAlign(
                  duration: const Duration(milliseconds: 200),
                  curve: Curves.easeInOut,
                  alignment:
                  isSelected ? Alignment.centerRight : Alignment.centerLeft,
                  child: Container(
                    width: 27.w,
                    height: 27.w,
                    margin: EdgeInsets.symmetric(horizontal: 2.w),
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}