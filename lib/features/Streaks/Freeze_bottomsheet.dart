import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:second_chat/core/constants/app_colors/app_colors.dart';
import 'package:second_chat/core/themes/textstyles.dart';
import 'package:second_chat/features/Streaks/Compact_freeze.dart' hide CellType;
import '../../controllers/Main Section Controllers/streak_controller.dart';

class StreakFreezePreviewBottomSheet extends StatelessWidget {
  const StreakFreezePreviewBottomSheet({super.key});

  static const int days = 7;
  static const double horizontalPadding = 12;
  static const double rowHeight = 32;

  // ---------------- ICONS ----------------

  Widget _tick({bool highlighted = false}) {
    return AnimatedScale(
      scale: highlighted ? 1.05 : 1,
      duration: const Duration(milliseconds: 180),
      curve: Curves.easeOutBack,
      child: Container(
        padding: EdgeInsets.all(4.w),
        decoration: highlighted
            ? const BoxDecoration(
          color: Colors.white,
          shape: BoxShape.circle,
        )
            : null,
        child: Icon(
          Icons.check,
          size: 18.sp,
          color: highlighted ? const Color(0xFFFDB747) : Colors.white,
        ),
      ),
    );
  }

  Widget _cross() => Icon(Icons.close, color: const Color(0xFF8E8E93), size: 22.sp);

  Widget _freeze() => Image.asset('assets/images/Privacy & Security - SVG.png');

  Widget _dot() => Opacity(
    opacity: 0.3,
    child: Icon(Icons.circle, size: 10.sp, color: Colors.white),
  );

  // ---------------- LAYOUT HELPERS ----------------

  Widget _highlight(int start, int end, double totalWidth) {
    final int count = end - start + 1;
    final double cellWidth = totalWidth / days;

    final decoration = count >= 3
        ? BoxDecoration(
      gradient: const LinearGradient(colors: [Color(0xFFF2B269), Color(0xFFFFE6A7)]),
      borderRadius: BorderRadius.circular(22.r),
    )
        : BoxDecoration(
      color: const Color(0xFF3C3C43).withOpacity(0.6),
      borderRadius: BorderRadius.circular(22.r),
    );

    return Positioned(
      left: start * cellWidth,
      width: count * cellWidth,
      top: 0,
      bottom: 0,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 2.w),
        decoration: decoration,
      ),
    );
  }

  Widget _row(int rowIndex, StreamStreaksController c, double totalWidth) {
    return Obx(() {
      final rowData = c.calendarRows[rowIndex];
      final groups = c.getTickGroups(rowData);

      return SizedBox(
        height: rowHeight.h,
        child: Stack(
          children: [
            for (final g in groups) _highlight(g[0], g[1], totalWidth),
            Row(
              children: List.generate(days, (i) {
                final cell = rowData[i];
                final isLast = c.lastTappedRow.value == rowIndex && c.lastTappedCol.value == i;
                final tappable = cell == CellType.tick || cell == CellType.cross;

                Widget icon;
                switch (cell) {
                  case CellType.tick: icon = _tick(highlighted: isLast); break;
                  case CellType.cross: icon = _cross(); break;
                  case CellType.freeze: icon = _freeze(); break;
                  case CellType.dot: icon = _dot(); break;
                }

                return Expanded(
                  child: GestureDetector(
                    behavior: HitTestBehavior.opaque,
                    onTap: tappable ? () => c.toggleCalendarCell(rowIndex, i) : null,
                    child: Center(child: icon),
                  ),
                );
              }),
            ),
          ],
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<StreamStreaksController>();

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
          body: Stack(
            children: [
              SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                padding: EdgeInsets.only(bottom: 100.h),
                child: Column(
                  children: [
                    SizedBox(height: 12.h),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16.w),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          InkWell(onTap: Get.back, child: Image.asset('assets/icons/x_icon.png', height: 44.h)),
                          Text("Stream Streaks", style: sfProText600(17.sp, Colors.white)),
                          SizedBox(width: 44.w),
                        ],
                      ),
                    ),
                    Image.asset('assets/images/Content(2).png', width: 560.w, height: 352.w),
                    SizedBox(height: 20.h),

                    // --- CALENDAR CARD ---
                    Container(
                      width: 361.w,
                      padding: EdgeInsets.symmetric(horizontal: horizontalPadding.w, vertical: 16.h),
                      decoration: BoxDecoration(
                        color: const Color(0xFF1E1D20),
                        borderRadius: BorderRadius.circular(24.r),
                      ),
                      child: LayoutBuilder(
                        builder: (context, constraints) {
                          final totalWidth = constraints.maxWidth;
                          return Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Row(
                                children: ['Mon', 'Tue', 'Wed', 'Thur', 'Fri', 'Sat', 'Sun'].map((d) {
                                  return Expanded(
                                    child: Center(
                                      child: Text(
                                        d,
                                        maxLines: 1,
                                        style: TextStyle(
                                          color: const Color(0xFF8E8E93),
                                          fontSize: 13.sp,
                                        ),
                                      ),
                                    ),
                                  );
                                }).toList(),
                              ),
                              SizedBox(height: 16.h),
                              for (int i = 0; i < controller.calendarRows.length; i++) ...[
                                _row(i, controller, totalWidth),
                                if (i != controller.calendarRows.length - 1)
                                  SizedBox(height: 12.h),
                              ],
                            ],
                          );
                        },
                      ),
                    ),
                    SizedBox(height: 40.h),
                  ],
                ),
              ),
              Positioned(
                left: 16.w,
                right: 16.w,
                bottom: 16.h,
                child: SizedBox(
                  height: 50.h,
                  child: ElevatedButton(
                    onPressed: () => Get.bottomSheet(const StreakFreezeSingleRowPreviewBottomSheet(), isScrollControlled: true),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(36.r)),
                    ),
                    child: Text("Let's go", style: sfProText600(17.sp, Colors.black)),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}