import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../core/themes/textstyles.dart';


class IntroScreen5 extends StatelessWidget {
  const IntroScreen5({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Put controller in GetX scope
    final IntroScreen5Controller controller = Get.put(IntroScreen5Controller());

    return Scaffold(
      body: Stack(
        children: [
          // Background Image
          Positioned.fill(
            child: Image.asset(
              'assets/images/Background.png',
              fit: BoxFit.cover,
            ),
          ),

          SafeArea(
            child: Column(
              children: [
                // Top Close Button
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
                  child: Align(
                    alignment: Alignment.topRight,
                    child: GestureDetector(
                      onTap: () => Get.back(),
                      child: Container(
                        width: 44.w,
                        height: 44.w,
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.2),
                          shape: BoxShape.circle,
                        ),
                        child: Icon(Icons.close, color: Colors.white, size: 24.sp),
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
                        'Get started with a',
                        style: sfProDisplay600(34.sp, Colors.white),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: 4.h),
                      ShaderMask(
                        shaderCallback: (bounds) => LinearGradient(
                          colors: const [Color(0xFFE8B87E), Color(0xFFE89B7E)],
                        ).createShader(bounds),
                        child: Text(
                          '14 day free trial',
                          style: sfProDisplay600(34.sp, Colors.white),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                  ),
                ),

                SizedBox(height: 40.h),

                // Swipeable Content
                Expanded(
                  child: Column(
                    children: [
                      // PageView Images
                      SizedBox(
                        height: 280.h,
                        child: PageView(
                          controller: controller.pageController,
                          onPageChanged: controller.onPageChanged,
                          children: [
                            Center(
                              child: Image.asset(
                                'assets/images/logo.png',
                                width: 280.w,
                                height: 200.h,
                                fit: BoxFit.contain,
                                errorBuilder: (_, __, ___) => SizedBox(width: 280.w, height: 200.h),
                              ),
                            ),
                            Center(
                              child: Image.asset(
                                'assets/images/character.png',
                                width: 280.w,
                                height: 280.h,
                                fit: BoxFit.contain,
                                errorBuilder: (_, __, ___) => Container(
                                  width: 280.w,
                                  height: 280.h,
                                  decoration: BoxDecoration(
                                    color: Colors.orange.withOpacity(0.2),
                                    borderRadius: BorderRadius.circular(20.r),
                                  ),
                                  child: Icon(Icons.pets, size: 100.sp, color: Colors.orange.withOpacity(0.5)),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),

                      SizedBox(height: 30.h),

                      // Page Indicators
                      Obx(() => Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          _buildDot(controller.currentPage.value == 0),
                          SizedBox(width: 8.w),
                          _buildDot(controller.currentPage.value == 1),
                        ],
                      )),

                      const Spacer(),

                      // Animated Content Switcher
                      Obx(() => AnimatedSwitcher(
                        duration: const Duration(milliseconds: 300),
                        child: controller.currentPage.value == 0
                            ? _buildSubscriptionContent(controller)
                            : _buildReferralContent(controller),
                      )),
                    ],
                  ),
                ),

                SizedBox(height: 20.h),

                // Terms & Restore
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () => print('Terms of Service tapped'),
                      child: Text(
                        'Terms of Service',
                        style: sfProText400(13.sp, Colors.white.withOpacity(0.6)),
                      ),
                    ),
                    SizedBox(width: 20.w),
                    GestureDetector(
                      onTap: () => print('Restore Purchase tapped'),
                      child: Text(
                        'Restore Purchase',
                        style: sfProText400(13.sp, Colors.white.withOpacity(0.6)),
                      ),
                    ),
                  ],
                ),

                SizedBox(height: 30.h),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDot(bool isActive) {
    return Container(
      width: 32.w,
      height: 4.h,
      decoration: BoxDecoration(
        color: isActive ? Colors.white : Colors.white.withOpacity(0.3),
        borderRadius: BorderRadius.circular(2.r),
      ),
    );
  }

  Widget _buildSubscriptionContent(IntroScreen5Controller c) {
    return Padding(
      key: const ValueKey('subscription'),
      padding: EdgeInsets.symmetric(horizontal: 30.w),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Monthly Plan
          GestureDetector(
            onTap: () => c.selectPlan(0),
            child: Obx(() => _planCard(
              isSelected: c.selectedPlan.value == 0,
              title: 'Monthly',
              price: '£4.99/month',
              showCheck: c.selectedPlan.value == 0,
            )),
          ),

          SizedBox(height: 16.h),

          // Yearly Plan (Most Popular)
          Stack(
            clipBehavior: Clip.none,
            children: [
              GestureDetector(
                onTap: () => c.selectPlan(1),
                child: Obx(() => _planCard(
                  isSelected: c.selectedPlan.value == 1,
                  title: 'Year',
                  price: '£2.99/month',
                  showCheck: true,
                  isYearly: true,
                )),
              ),
              Positioned(
                top: -10.h,
                left: 16.w,
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 6.h),
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(colors: [Color(0xFFE8B87E), Color(0xFFD4A574)]),
                    borderRadius: BorderRadius.circular(12.r),
                  ),
                  child: Text(
                    'MOST POPULAR',
                    style: sfProText500(11.sp, Colors.white),
                  ),
                ),
              ),
            ],
          ),

          SizedBox(height: 4.h),

          // Start Trial Button
          Obx(() => GestureDetector(
            onTap: c.isLoading.value ? null : c.startTrial,
            child: Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(vertical: 18.h),
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [Color(0xFFE8B87E), Color(0xFFD4A574)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(28.r),
              ),
              child: c.isLoading.value
                  ? const Center(
                child: SizedBox(
                  width: 24,
                  height: 24,
                  child: CircularProgressIndicator(
                    strokeWidth: 2.5,
                    valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                  ),
                ),
              )
                  : Column(
                children: [
                  Text('Start Free Trial', style: sfProText600(12.sp, Colors.white)),
                  SizedBox(height: 2.h),
                  Text('then £52.99/year', style: sfProText400(13.sp, Colors.white.withOpacity(0.8))),
                ],
              ),
            ),
          )),
        ],
      ),
    );
  }

  Widget _planCard({
    required bool isSelected,
    required String title,
    required String price,
    required bool showCheck,
    bool isYearly = false,
  }) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 10.h),
      decoration: BoxDecoration(
        color: isSelected ? Colors.white.withOpacity(0.15) : Colors.white.withOpacity(0.08),
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(
          color: isSelected ? Colors.white.withOpacity(0.3) : Colors.white.withOpacity(0.1),
          width: 1.5,
        ),
      ),
      child: Row(
        children: [
          Container(
            width: 28.w,
            height: 28.w,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: isYearly ? Colors.white : null,
              border: Border.all(color: Colors.white.withOpacity(0.5), width: 2),
            ),
            child: showCheck
                ? Center(
              child: isYearly
                  ? Icon(Icons.check, color: const Color(0xFF2D2D2D), size: 18.sp)
                  : Container(
                width: 14.w,
                height: 14.w,
                decoration: const BoxDecoration(color: Colors.white, shape: BoxShape.circle),
              ),
            )
                : null,
          ),
          SizedBox(width: 16.w),
          Text(title, style: sfProText500(18.sp, Colors.white)),
          const Spacer(),
          Text(price, style: sfProText500(18.sp, Colors.white)),
        ],
      ),
    );
  }

  Widget _buildReferralContent(IntroScreen5Controller c) {
    return Padding(
      key: const ValueKey('referral'),
      padding: EdgeInsets.symmetric(horizontal: 30.w),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'Invite a friend and receive',
            style: sfProDisplay600(22.sp, Colors.white),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 30.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('👏', style: TextStyle(fontSize: 32.sp)),
              SizedBox(width: 12.w),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text('Get ', style: sfProText500(18.sp, Colors.white)),
                      ShaderMask(
                        shaderCallback: (bounds) => const LinearGradient(
                          colors: [Color(0xFFE8B87E), Color(0xFFE89B7E)],
                        ).createShader(bounds),
                        child: Text('1 month Free', style: sfProText600(18.sp, Colors.white)),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(width: 12.w),
              Text('1 time', style: sfProText400(16.sp, Colors.grey.shade500)),
            ],
          ),
          SizedBox(height: 20.h),
          GestureDetector(
            onTap: c.copyLink,
            child: Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(vertical: 18.h),
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [Color(0xFFE8B87E), Color(0xFFD4A574)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(28.r),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.copy, color: Colors.white, size: 17.sp),
                  SizedBox(width: 8.w),
                  Text('Copy link', style: sfProText600(17.sp, Colors.white)),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}


class IntroScreen5Controller extends GetxController {
  // Observable variables
  var isLoading = false.obs;
  var selectedPlan = 1.obs; // 0 = Monthly, 1 = Yearly
  var currentPage = 0.obs;

  final PageController pageController = PageController(initialPage: 0);

  void startTrial() async {
    isLoading(true);
    await Future.delayed(const Duration(seconds: 3));
    isLoading(false);

    String plan = selectedPlan.value == 0 ? "Monthly" : "Yearly";
    print('Trial started with plan: $plan');
  }

  void copyLink() {
    print('Link copied to clipboard');
    Get.snackbar(
      'Success',
      'Link copied to clipboard!',
      snackPosition: SnackPosition.BOTTOM,
      duration: const Duration(seconds: 2),
      margin: const EdgeInsets.all(20),
      backgroundColor: Colors.black.withOpacity(0.7),
      colorText: Colors.white,
    );
  }

  void selectPlan(int plan) {
    selectedPlan.value = plan;
  }

  void onPageChanged(int index) {
    currentPage.value = index;
  }

  @override
  void onClose() {
    pageController.dispose();
    super.onClose();
  }
}