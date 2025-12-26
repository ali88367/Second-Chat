import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../textstyles.dart';

class IntroScreen4 extends StatefulWidget {
  const IntroScreen4({Key? key}) : super(key: key);

  @override
  State<IntroScreen4> createState() => _IntroScreen4State();
}

class _IntroScreen4State extends State<IntroScreen4> {
  bool _isLoading = false;
  final ScrollController _scrollController = ScrollController();


  void _startTrial() async {
    setState(() {
      _isLoading = true;
    });

    await Future.delayed(const Duration(seconds: 3));

    setState(() {
      _isLoading = false;
    });

    print('Trial started');
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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

          SafeArea(
            child: Column(
              children: [
                // Close Button
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
                  child: Align(
                    alignment: Alignment.topRight,
                    child: GestureDetector(
                      onTap: () => Navigator.pop(context),
                      child: Container(
                        width: 40.w,
                        height: 40.w,
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.2),
                          shape: BoxShape.circle,
                        ),
                        child: Icon(
                          Icons.close,
                          color: Colors.white,
                          size: 22.sp,
                        ),
                      ),
                    ),
                  ),
                ),

                SizedBox(height: 20.h),

                // Title
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 40.w),
                  child: Column(
                    children: [
                      Text(
                        'Unlock the full',
                        style: sfProDisplay600(32.sp, Colors.white),
                        textAlign: TextAlign.center,
                      ),
                      Text(
                        'experience with',
                        style: sfProDisplay600(32.sp, Colors.white),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: 4.h),
                      ShaderMask(
                        shaderCallback: (bounds) => LinearGradient(
                          colors: const [
                            Color(0xFFE8B87E),
                            Color(0xFFE89B7E),
                          ],
                        ).createShader(bounds),
                        child: Text(
                          'Premium',
                          style: sfProDisplay600(32.sp, Colors.white),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                  ),
                ),

                SizedBox(height: 30.h),

                // Main Content: 70% Features + 30% Badge
                Expanded(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // 70% - Features List
                      Expanded(
                        flex: 8,
                        child: SingleChildScrollView(
                          controller: _scrollController,
                          padding: EdgeInsets.symmetric(horizontal: 16.w),
                          child: Column(
                            children: [
                              _buildHeaderRow(),
                              SizedBox(height: 16.h),
                              _buildFeatureRow('Multi-Platform Chat', true, false),
                              _buildFeatureRow('Multi-Stream Monitor', false, true),
                              _buildFeatureRow('Activity Feed', true, false),
                              _buildFeatureRow('Title/Category Manage', false, true),
                              _buildFeatureRow('Edge LED Notification', false, true),
                              SizedBox(height: 100.h), // extra space for button
                            ],
                          ),
                        ),
                      ),

                      // 30% - Premium Badge (vertically centered, follows scroll)
                      Expanded(
                        flex: 2,
                        child: AnimatedBuilder(
                          animation: _scrollController,
                          builder: (context, child) {
                            return _buildPremiumBadge();
                          },
                        ),
                      ),
                      SizedBox(width: 20.w,)
                    ],
                  ),
                ),

                // Start Trial Button
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 16.h),
                  child: GestureDetector(
                    onTap: _isLoading ? null : _startTrial,
                    child: Container(
                      width: double.infinity,
                      height: 52.h,
                      decoration: BoxDecoration(
                        gradient: const LinearGradient(
                          colors: [Color(0xFFE8B87E), Color(0xFFD4A574)],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),
                        borderRadius: BorderRadius.circular(26.r),
                      ),
                      child: Center(
                        child: _isLoading
                            ? SizedBox(
                          width: 22.w,
                          height: 22.w,
                          child: const CircularProgressIndicator(
                            strokeWidth: 2.5,
                            valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                          ),
                        )
                            : Text(
                          'Start My 14 Day Free Trial',
                          style: sfProText500(16.sp, Colors.white),
                        ),
                      ),
                    ),
                  ),
                ),

                SizedBox(height: 8.h),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHeaderRow() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15.w),
      height: 46.h,
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.1),
        borderRadius: BorderRadius.circular(23.r),
        border: Border.all(color: Colors.white.withOpacity(0.2), width: 1),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "Feature's",
            style: sfProText500(15.sp, Colors.white),
          ),

          Text(
            'Free',
            style: sfProText500(15.sp, Colors.white),
          ),
        ],
      ),
    );
  }

  Widget _buildFeatureRow(String feature, bool isFree, bool showInfo) {
    return Container(
      margin: EdgeInsets.only(bottom: 16.h),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 3,
            child: Text(
              feature,
              style: sfProText400(15.sp, Colors.white),
            ),
          ),
          Expanded(
            flex: 1,
            child: Center(
              child: Container(
                width: 28.w,
                height: 28.w,
                decoration: BoxDecoration(
                  color: isFree
                      ? Colors.white.withOpacity(0.2)
                      : Colors.white.withOpacity(0.15),
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  isFree ? Icons.check : Icons.close,
                  color: isFree ? Colors.white : Colors.white.withOpacity(0.5),
                  size: 16.sp,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPremiumBadge() {
    return Container(
      width: 40.w, // comfortable width in 30% space
      padding: EdgeInsets.symmetric(vertical: 16.h),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Color(0xFFE8B87E), Color(0xFFD4A574)],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
        borderRadius: BorderRadius.circular(30.r),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFFE8B87E).withOpacity(0.4),
            blurRadius: 16,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Crown
          Container(
            width: 40.w,
            height: 40.w,
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.3),
              shape: BoxShape.circle,
            ),
            child: Icon(
              Icons.workspace_premium,
              color: Colors.white,
              size: 24.sp,
            ),
          ),

          SizedBox(height: 24.h),

          // Icons
          _buildBadgeIcon(Icons.close, false),
          SizedBox(height: 18.h),
          _buildBadgeIcon(Icons.info_outline, true),
          SizedBox(height: 18.h),
          _buildBadgeIcon(Icons.check, false),
          SizedBox(height: 18.h),
          _buildBadgeIcon(Icons.add, true),
          SizedBox(height: 18.h),
          _buildBadgeIcon(Icons.check, false),

        ],
      ),
    );
  }

  Widget _buildBadgeIcon(IconData icon, bool isInfo) {
    return Container(
      width: 32.w,
      height: 32.w,
      decoration: BoxDecoration(
        color: isInfo ? Colors.white.withOpacity(0.3) : const Color(0xFFFF8C42),
        shape: BoxShape.circle,
      ),
      child: Icon(
        icon,
        color: Colors.white,
        size: 18.sp,
      ),
    );
  }
}