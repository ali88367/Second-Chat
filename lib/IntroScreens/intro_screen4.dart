import 'dart:ui';

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
          Image.asset(
            'assets/topbarshade.png',
            fit: BoxFit.cover,
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
             Column(
                    children: [
                      RichText(
                        textAlign: TextAlign.center,
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: 'Unlock the full experience with  ',
                              style: sfProDisplay600(34.sp, Colors.white),
                            ),
                            TextSpan(
                              text: 'Premium',
                              style: sfProDisplay600(
                                34.sp,
                                Colors.white, // base color won't matter, overridden by foreground
                              ).copyWith(
                                foreground: Paint()
                                  ..shader = LinearGradient(
                                    begin: Alignment.topLeft,
                                    end: Alignment.bottomRight,
                                    colors: [
                                      Color(0xFFF2B269),   // yellow-orange
                                      Color(0xFFF17A7A),   // fully opaque red
                                      Color(0xFFFFE6A7),   // light yellow
                                    ],
                                    stops: [0.2, 0.5, 0.8], // shift stops to give more space to red
                                    transform: GradientRotation(135.5 * 3.1415927 / 180),
                                  ).createShader(
                                    Rect.fromLTWH(0, 0, 200, 50),
                                  ),
                              ),
                            ),

                          ],
                        ),
                      ),
                    ],
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
                              _buildGlassButton(),
                              SizedBox(height: 24.h),
                              _buildFeatureRow('Multi-Platform Chat', true, false),
                              _buildFeatureRow('Multi-Stream Monitor', false, true),
                              _buildFeatureRow('Activity Feed', true, false),
                              _buildFeatureRow('Title/Category Manage', false, true),
                              _buildFeatureRow('Edge LED Notification', false, true),
                             // SizedBox(height: 100.h), // extra space for button
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


  Widget _buildGlassButton() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(37), // Rounded corners
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10), // Glass blur effect
        child: Container(
        //  width: 250.w, // Fixed width
          height: 58.h, // Fixed height
          padding:  EdgeInsets.symmetric(horizontal: 16.w
          ),
          decoration: BoxDecoration(
            color: const Color.fromRGBO(48, 48, 48, 0.5), // rgba(48,48,48,0.5)
            borderRadius: BorderRadius.circular(37),
            border: Border.all(
              color: Colors.white.withOpacity(0.2), // subtle border for glass effect
              width: 1.5,
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Feature's",
                style: sfProText600(17.sp, Colors.white),
              ),
              Text(
                'Free',
                style: sfProText600(17.sp, Colors.white),
              ),

            ],
          ),
        ),
      ),
    );
  }

  Widget _buildFeatureRow(String feature, bool isFree, bool showInfo) {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.only(left: 17.w),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                flex: 3,
                child: Text(
                  feature,
                  style: sfProText400(17.sp, Colors.white),
                ),
              ),
              Expanded(
                flex: 1,
                child: Center(
                  child: Container(
                    width: 24.w,
                    height: 24.w,
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
        ),
        SizedBox(height: 12.h), // Vertical spacing
        Divider(
          color: Colors.grey.withOpacity(0.3), // Grey divider
          thickness: 1,
          indent: 17.w, // Align with left margin
          endIndent: 17.w, // Optional: align right
        ),
        SizedBox(height: 12.h), // Space after divider
      ],
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