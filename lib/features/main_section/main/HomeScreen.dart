import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0A0A0A),
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        systemOverlayStyle: SystemUiOverlayStyle.light,
        toolbarHeight: 70.h,
        automaticallyImplyLeading: false,
        flexibleSpace: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Offline Indicator
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.4),
                    borderRadius: BorderRadius.circular(20.r),
                    border: Border.all(
                      color: Colors.white.withOpacity(0.1),
                      width: 1,
                    ),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        Icons.close,
                        size: 16.sp,
                        color: Colors.white70,
                      ),
                      SizedBox(width: 6.w),
                      Text(
                        'Offline',
                        style: TextStyle(
                          color: Colors.white70,
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),

                // Right Icons
                Row(
                  children: [
                    _buildIconButton(Icons.person_outline),
                    SizedBox(width: 12.w),
                    _buildIconButton(Icons.card_giftcard_outlined),
                    SizedBox(width: 12.w),
                    _buildIconButton(Icons.settings_outlined),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              const Color(0xFF1A1A1A),
              const Color(0xFF0A0A0A),
            ],
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Crossed Video Icon
              Container(
                width: 80.w,
                height: 80.w,
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.3),
                  shape: BoxShape.circle,
                ),
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Icon(
                      Icons.videocam_outlined,
                      size: 40.sp,
                      color: Colors.white24,
                    ),
                    Transform.rotate(
                      angle: -0.785398, // -45 degrees in radians
                      child: Container(
                        width: 60.w,
                        height: 3.h,
                        color: Colors.white24,
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(height: 24.h),

              // Text
              Text(
                'You haven\'t started the\nstream yet',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white38,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w400,
                  height: 1.5,
                  letterSpacing: 0.2,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildIconButton(IconData icon) {
    return Container(
      width: 40.w,
      height: 40.w,
      decoration: BoxDecoration(
        color: Colors.black.withOpacity(0.4),
        shape: BoxShape.circle,
        border: Border.all(
          color: Colors.white.withOpacity(0.1),
          width: 1,
        ),
      ),
      child: Icon(
        icon,
        size: 20.sp,
        color: Colors.white70,
      ),
    );
  }
}