import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'core/constants/app_colors/app_colors.dart';
import 'core/constants/app_images/app_images.dart';
import 'core/themes/textstyles.dart';
import 'features/main_section/main/HomeScreen.dart';

class Livestreaming extends StatelessWidget {
  const Livestreaming({super.key});

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
              padding: EdgeInsets.only(left: 16.w, right: 16.w, top: 28.h),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Offline Button
                  _buildImageButton(
                    'assets/images/streak_icon.png',
                    width: 72.w,
                    height: 36.w,
                  ),

                  // Right Buttons
                  Row(
                    children: [
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
          Center(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(height: 122.h),

                  Container(
                    height: 236.h,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(24.r),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(24.r),
                      child: Opacity(
                        opacity: 1,
                        child: Image.asset(
                          'assets/images/streaming.png', // replace with your placeholder image path
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 12.h),
                  Container(
                    width: 297.w, // 270 + 10%
                    height: 59.4.h, // 54 + 10%
                    decoration: BoxDecoration(
                      color: Color.fromRGBO(30, 29, 32, 1),
                      borderRadius: BorderRadius.circular(33.r), // 30 + 10%
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        // Twitch Container
                        Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 15.w,
                          ), // 8 + 10%
                          height: 38.5.h, // 35 + 10%
                          decoration: BoxDecoration(
                            color: Color.fromRGBO(185, 80, 239, 0.25),
                            borderRadius: BorderRadius.circular(
                              70.4.r,
                            ), // 64 + 10%
                          ),
                          child: Center(
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Image.asset(
                                  'assets/images/twitch.png',
                                  color: Color.fromRGBO(185, 80, 239, 1),
                                  width: 12.1.w, // 11 + 10%
                                  height: 12.1.h, // 11 + 10%
                                ),
                                SizedBox(width: 4.4.w), // 4 + 10%
                                Text(
                                  '11202',
                                  style: sfProText400(
                                    14.3.sp, // 13 + 10%
                                    Color.fromRGBO(185, 80, 239, 1),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),

                        SizedBox(width: 13.2.w), // 12 + 10%
                        // Kick Container
                        Container(
                          padding: EdgeInsets.all(8.8),
                          height: 38.5.h,
                          decoration: BoxDecoration(
                            color: Color.fromRGBO(83, 252, 24, 0.25),
                            borderRadius: BorderRadius.circular(70.4.r),
                          ),
                          child: Center(
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Image.asset(
                                  'assets/images/kick.png',
                                  color: Color.fromRGBO(83, 252, 24, 1),
                                  width: 12.1.w,
                                  height: 12.1.h,
                                ),
                                SizedBox(width: 4.4.w),
                                Text(
                                  '1256',
                                  style: sfProText400(
                                    14.3.sp,
                                    Color.fromRGBO(83, 252, 24, 1),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),

                        SizedBox(width: 13.2.w),

                        // YouTube Container
                        Container(
                          padding: EdgeInsets.all(8.8),
                          height: 38.5.h,
                          decoration: BoxDecoration(
                            color: Color.fromRGBO(221, 44, 40, 0.25),
                            borderRadius: BorderRadius.circular(70.4.r),
                          ),
                          child: Center(
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Image.asset(
                                  'assets/images/youtube.png',
                                  color: Color.fromRGBO(221, 44, 40, 1),
                                  width: 12.1.w,
                                  height: 12.1.h,
                                ),
                                SizedBox(width: 4.4.w),
                                Text(
                                  '256',
                                  style: sfProText400(
                                    14.3.sp,
                                    Color.fromRGBO(221, 44, 40, 1),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  SizedBox(height: 12.h),
                  const Expanded(child: _ChatBottomSection()),
                ],
              ),
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

class _ChatBottomSection extends StatelessWidget {
  const _ChatBottomSection();

  static const List<String> platforms = [
    'assets/images/twitch1.png',
    'assets/images/kick.png',
    'assets/images/youtube1.png',
  ];

  // Name colors to randomize
  static const List<Color> nameColors = [
    Colors.green,
    Colors.blue,
    Colors.purple,
    Colors.orange,
    Colors.red,
    Colors.teal,
    Colors.yellow,
    Colors.pink,
  ];

  @override
  Widget build(BuildContext context) {
    final random = Random();

    // Predefined 6 comments per platform
    final List<Map<String, dynamic>> comments = [
      // Twitch comments
      {
        'platform': 'assets/images/twitch1.png',
        'name': 'TwitchFan1',
        'message': 'Amazing play!',
      },
      {
        'platform': 'assets/images/twitch1.png',
        'name': 'TwitchFan2',
        'message': 'Wow, insane!',
      },
      {
        'platform': 'assets/images/twitch1.png',
        'name': 'TwitchFan3',
        'message': 'Cant believe this!',
      },
      {
        'platform': 'assets/images/twitch1.png',
        'name': 'TwitchFan4',
        'message': 'Go go go!',
      },
      {
        'platform': 'assets/images/twitch1.png',
        'name': 'TwitchFan5',
        'message': 'Lol that was funny!',
      },
      {
        'platform': 'assets/images/twitch1.png',
        'name': 'TwitchFan6',
        'message': 'Best stream ever!',
      },

      // Kick comments
      {
        'platform': 'assets/images/kick.png',
        'name': 'KickFan1',
        'message': 'Lets goooo!',
      },
      {
        'platform': 'assets/images/kick.png',
        'name': 'KickFan2',
        'message': 'Hyped for this!',
      },
      {
        'platform': 'assets/images/kick.png',
        'name': 'KickFan3',
        'message': 'No way!',
      },
      {
        'platform': 'assets/images/kick.png',
        'name': 'KickFan4',
        'message': 'This is epic!',
      },
      {
        'platform': 'assets/images/kick.png',
        'name': 'KickFan5',
        'message': 'Lol amazing!',
      },
      {
        'platform': 'assets/images/kick.png',
        'name': 'KickFan6',
        'message': 'Cant stop watching!',
      },

      // YouTube comments
      {
        'platform': 'assets/images/youtube1.png',
        'name': 'YTViewer1',
        'message': 'Nice content!',
      },
      {
        'platform': 'assets/images/youtube1.png',
        'name': 'YTViewer2',
        'message': 'Love this!',
      },
      {
        'platform': 'assets/images/youtube1.png',
        'name': 'YTViewer3',
        'message': 'Subscribed!',
      },
      {
        'platform': 'assets/images/youtube1.png',
        'name': 'YTViewer4',
        'message': 'This is lit!',
      },
      {
        'platform': 'assets/images/youtube1.png',
        'name': 'YTViewer5',
        'message': 'Great job!',
      },
      {
        'platform': 'assets/images/youtube1.png',
        'name': 'YTViewer6',
        'message': 'Keep it up!',
      },
    ];

    // Shuffle comments to mix them up
    comments.shuffle(random);

    return Container(
      decoration: BoxDecoration(
        color: Colors.grey.shade900, // onBottomSheetGrey
        borderRadius: BorderRadius.vertical(top: Radius.circular(30.r)),
      ),
      child: Column(
        children: [
          SizedBox(height: 10.h),
          // Handle Bar
          Container(
            width: 40.w,
            height: 4.h,
            decoration: BoxDecoration(
              color: Colors.grey.shade700,
              borderRadius: BorderRadius.circular(2.r),
            ),
          ),
          SizedBox(height: 16.h),
          // Tabs
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w),
            child: Row(
              children: [
                _pillButton(
                  "Activity",
                  isActive: false,
                  assetPath: 'assets/images/line.png',
                ),
                SizedBox(width: 12.w),
                _pillButton(
                  "Title",
                  isActive: false,
                  assetPath: 'assets/images/magic.png',
                ),
                const Spacer(),
                SizedBox(width: 12.w),
                SizedBox(
                  height: 36.h,
                  width: 36.w,
                  child: Image.asset('assets/images/expand.png'),
                ),
              ],
            ),
          ),
          SizedBox(height: 16.h),
          // Chat List with Floating Button
          Expanded(
            child: Stack(
              children: [
                // Chat List
                ListView.builder(
                  padding: EdgeInsets.only(
                    left: 16.w,
                    right: 16.w,
                    bottom: 80
                        .h, // Add padding to prevent content hiding behind button
                  ),
                  itemCount: comments.length,
                  itemBuilder: (context, index) {
                    final item = comments[index];
                    // Pick a random color for the name
                    final nameColor =
                        nameColors[random.nextInt(nameColors.length)];
                    return _chatItem(
                      item['platform'],
                      item['name'],
                      item['message'],
                      nameColor,
                    );
                  },
                ),
                // Floating Input Button
                Positioned(
                  bottom: 16.h,
                  left: 10.w,
                  right: 10.w,
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 16.w),
                    height: 55.h,
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(25.r),
                      border: Border.all(color: Colors.white10,width: 1.w),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.3),
                          blurRadius: 10,
                          offset: const Offset(0, 4),
                        ),
                      ],
                    ),
                    child: Row(
                      children: [
                        Text(
                          "Text",
                          style: sfProText400(17.sp, Color.fromRGBO(235, 235, 245, 0.3))
                        ),
                        const Spacer(),
                        Icon(
                          Icons.emoji_emotions_outlined,
                          color: Colors.white,
                          size: 20.sp,
                        ),
                        SizedBox(width: 10.w),
                        Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 8.w,
                            vertical: 4.h,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.grey.shade900,
                            borderRadius: BorderRadius.circular(12.r),
                          ),
                          child: Row(
                            children: [
                              Text(
                                "All",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 12.sp,
                                ),
                              ),
                              Icon(
                                Icons.unfold_more,
                                color: Colors.grey,
                                size: 14.sp,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _pillButton(String text, {required bool isActive, String? assetPath}) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 8.h),
      decoration: BoxDecoration(
        color: isActive ? const Color(0xFF1E1E1E) : Colors.transparent,
        borderRadius: BorderRadius.circular(20.r),
        border: Border.all(
          color: isActive ? Colors.transparent : Colors.grey.shade800,
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (assetPath != null) ...[
            Image.asset(assetPath, width: 16.w, height: 16.h),
            SizedBox(width: 6.w),
          ],
          Text(
            text,
            style: TextStyle(
              color: isActive ? Colors.white : Colors.grey.shade600,
              fontSize: 12.sp,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }

  Widget _chatItem(
    String platform,
    String name,
    String message,
    Color nameColor,
  ) {
    return Padding(
      padding: EdgeInsets.only(bottom: 12.h),
      child: RichText(
        text: TextSpan(
          children: [
            WidgetSpan(
              alignment: PlaceholderAlignment.middle,
              child: Padding(
                padding: EdgeInsets.only(right: 6.w),
                child: Image.asset(
                  platform,
                  width: 14.sp,
                  height: 14.sp,
                  fit: BoxFit.contain,
                ),
              ),
            ),
            TextSpan(text: "$name: ", style: sfProText500(12.sp, nameColor)),
            TextSpan(text: message, style: sfProText400(12.sp, Colors.white)),
          ],
        ),
      ),
    );
  }
}
