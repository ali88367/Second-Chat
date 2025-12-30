import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:second_chat/controllers/Main%20Section%20Controllers/settings_controller.dart';
import 'package:second_chat/core/constants/app_images/app_images.dart';
import 'package:second_chat/core/themes/textstyles.dart';

import '../../../core/constants/app_colors/app_colors.dart';
import '../../../core/widgets/custom_switch.dart';


class SettingsBottomsheetColumn extends StatelessWidget {
   SettingsBottomsheetColumn({super.key});

  // Updated Map with flexible suffix support
  final Map<String, List<Map<String, dynamic>>> settingsData = {
    "Notifications": [
      {
        "prefixImageAsset": bell_icon,
        "title": "Notifications",
        "isSwitch": true,
        "switchKey": "notifications",
      },
      {
        "prefixImageAsset": light_bulb_icon,
        "title": "LED Notifications",
        "isSwitch": true,
        "switchKey": "ledNotifications",
      },
      {
        "prefixImageAsset": linking_icon,
        "title": "Connect Other Platforms",
        "isSwitch": true,
        "switchKey": "connectOtherPlatforms",
      },
    ],
    "Chat": [
      {
        "prefixImageAsset": font_size_icon,
        "title": "Font Size",
        "suffixImageAsset1": "assets/icons/circle_k.png", // Brown K circle
        "suffixText": "D",
        "isForward": true,
        "nextPage": "/font-size",
      },
      {
        "prefixImageAsset": subscribers_icon,
        "title": "Show Subscribers Only",
        "isSwitch": true,
        "switchKey": "showSubscribersOnly",
        "suffixImageAsset": key_icon_2, // Small key icon
      },
      {
        "prefixImageAsset": verified_icon,
        "title": "Show VIP/Mods Only",
        "isSwitch": true,
        "switchKey": "showVipsOnly",
        "suffixImageAsset": key_icon_2, // Small key icon
      },
      {
        "prefixImageAsset": view_count_icon,
        "title": "Viewer Count",
        "isSwitch": true,
        "switchKey": "viewerCount",
      },
      {
        "prefixImageAsset": privacy_icon,
        "title": "Hide Viewer Names",
        "isSwitch": true,
        "switchKey": "hideViewerNames",
      },
      {
        "prefixImageAsset": multi_chat_icon,
        "title": "Multi-Chat Merged Mode",
        "isSwitch": true,
        "switchKey": "multiChatMergedMode",
        "suffixImageAsset": key_icon_2,
      },
      {
        "prefixImageAsset": color_brush_icon,
        "title": "Platform Colour",
        "isForward": true,
        "nextPage": "/platform-color",
      },
    ],
    "Language": [
      {
        "prefixImageAsset": language_icon,
        "title": "App Language",
        // "suffixImageAsset1": "assets/icons/flag_en.png", // En circle
        "suffixText": "D",
        "isForward": true,
        "nextPage": "/language",
      },
      {
        "prefixImageAsset": time_zone_icon,
        "title": "Time Zone Detection",
        "suffixImageAsset1": language_icon,
        "suffixText": "D",
        "isForward": true,
        "nextPage": "/timezone",
      },
    ],
    "Other": [
      {
        "prefixImageAsset": screen_icon,
        "title": "Multi-Screen Preview",
        "suffixImageAsset": key_icon_2, // Green key icon
        "isForward": true,
        "nextPage": "/multi-screen",
      },
      {
        "prefixImageAsset": animation_icon,
        "title": "Animations",
        "suffixImageAsset": key_icon_2,
        "isForward": true,
        "nextPage": "/animations",
      },
      {
        "prefixImageAsset": low_battery_icon,
        "title": "Low Power Mode",
        "isSwitch": true,
        "switchKey": "lowPowerMode",
      },
      {
        "prefixImageAsset": filter_icon,
        "title": "Full Activity Filters",
        "suffixImageAsset": key_icon_2,
        "isForward": true,
        "nextPage": "/activity-filters",
      },
      {
        "prefixImageAsset": speaker_icon,
        "title": "TTS Advanced settings",
        "suffixImageAsset": key_icon_2,
        "isForward": true,
        "nextPage": "/tts-settings",
      },
    ],
  };

  @override
  Widget build(BuildContext context) {
    final SettingsController controller = Get.find<SettingsController>();

    return Column(
      children: [
        // Drag handle
        Align(
          alignment: Alignment.center,
          child: Container(
            margin: EdgeInsets.only(top: 12.h, bottom: 8.h),
            width: 36.w,
            height: 4.h,
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.3),
              borderRadius: BorderRadius.circular(2.r),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0.w, ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(x_icon, height: 44.h,),
              Text("Settings", style: sfProText600(17.sp, onDark),),
              SizedBox(width: 44.w,)
            ],
          ),
        ),
        SizedBox(height: 22.h,),
        Expanded(
          child: ListView.builder(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            itemCount: settingsData.length,
            itemBuilder: (context, sectionIndex) {
              String sectionTitle = settingsData.keys.elementAt(sectionIndex);
              List<Map<String, dynamic>> tiles = settingsData[sectionTitle]!;

              return Container(
                margin: EdgeInsets.only(bottom: 16.h),
                decoration: BoxDecoration(
                  color: onBottomSheetGrey,
                  borderRadius: BorderRadius.circular(12.r),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Section header
                    Padding(
                      padding: EdgeInsets.fromLTRB(16.w, 16.h, 16.w, 12.h),
                      child: Text(
                        sectionTitle,
                        style: sfProDisplay400(
                          14.sp,
                          Color.fromRGBO(235, 235, 245, 0.6),
                        ),
                      ),
                    ),

                    // Tiles
                    ...tiles.map((tile) {
                      final bool isSwitch = tile["isSwitch"] ?? false;
                      final bool isForward = tile["isForward"] ?? false;
                      final String? switchKey = tile["switchKey"];

                      // Get switch value from controller
                      RxBool? switchObs;
                      if (isSwitch && switchKey != null) {
                        switch (switchKey) {
                          case "notifications":
                            switchObs = controller.notifications;
                            break;
                          case "ledNotifications":
                            switchObs = controller.ledNotifications;
                            break;
                          case "connectOtherPlatforms":
                            switchObs = controller.connectOtherPlatforms;
                            break;
                          case "showSubscribersOnly":
                            switchObs = controller.showSubscribersOnly;
                            break;
                          case "showVipsOnly":
                            switchObs = controller.showVipsOnly;
                            break;
                          case "viewerCount":
                            switchObs = controller.viewerCount;
                            break;
                          case "hideViewerNames":
                            switchObs = controller.hideViewerNames;
                            break;
                          case "multiChatMergedMode":
                            switchObs = controller.multiChatMergedMode;
                            break;
                          case "lowPowerMode":
                            switchObs = controller.lowPowerMode;
                            break;
                        }
                      }

                      return Stack(
                        children: [
                          Container(
                            height: 56.h,
                            padding: EdgeInsets.symmetric(
                              horizontal: 16.w,
                            ),
                            decoration: BoxDecoration(
                                border: Border(
                                    top: BorderSide(
                                        width: 0.5.w,
                                        color: Color.fromRGBO(120, 120, 128, 0.36)
                                    )
                                )
                            ),
                            alignment: Alignment.center,
                            child: InkWell(
                              borderRadius: BorderRadius.circular(12.r),
                              onTap: isForward && tile["nextPage"] != null
                                  ? () => Get.toNamed(tile["nextPage"]!)
                                  : (isSwitch && switchKey != null)
                                  ? () => switchObs?.toggle()
                                  : null,
                              child: Row(
                                children: [
                                  // Prefix icon
                                  Image.asset(
                                    tile["prefixImageAsset"],
                                    width: 24.w,
                                    height: 24.h,
                                    color: beige,
                                    errorBuilder: (context, error, stackTrace) =>
                                        Icon(Icons.error, color: Colors.red),
                                  ),
                                  SizedBox(width: 12.w),

                                  // Title & Subtitle
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Text(
                                          tile["title"],
                                          style: sfProText400(
                                            14.sp,
                                            Colors.white,
                                          ),
                                        ),
                                        if (tile["subtitle"] != null)
                                          Padding(
                                            padding: EdgeInsets.only(top: 2.h),
                                            child: Text(
                                              tile["subtitle"],
                                              style: sfProText400(
                                                13.sp,
                                                Colors.white60,
                                              ),
                                            ),
                                          ),
                                      ],
                                    ),
                                  ),

                                  // Flexible Suffix Section
                                  Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      // Switch (highest priority)
                                      if (isSwitch && switchObs != null)
                                        Obx(
                                              () => CustomSwitch(
                                            value: switchObs!.value,
                                            onChanged: null, // Row handles tap
                                          ),
                                        )
                                      else ...[
                                        // suffixImageAsset1 (circle K, En flag, etc.)
                                        if (tile["suffixImageAsset1"] != null)
                                          Padding(
                                            padding: EdgeInsets.only(right: 6.w),
                                            child: Image.asset(
                                              tile["suffixImageAsset1"],
                                              height: tile["suffixImageAsset1"] == key_icon_2 ? 38.h : 20.h,
                                              errorBuilder: (context, error, stackTrace) =>
                                                  Container(width: 20.w, height: 20.h),
                                            ),
                                          ),

                                        // suffixText (D, 12h, etc.)
                                        if (tile["suffixText"] != null)
                                          Padding(
                                            padding: EdgeInsets.only(right: 6.w),
                                            child: Text(
                                              tile["suffixText"],
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 13.sp,
                                                fontWeight: FontWeight.w600,
                                              ),
                                            ),
                                          ),

                                        // Legacy suffixImageAsset (key icons)
                                        if (tile["suffixImageAsset"] != null)
                                          Padding(
                                            padding: EdgeInsets.only(right: 8.w),
                                            child: Image.asset(
                                              tile["suffixImageAsset"],
                                              height: tile["suffixImageAsset"] == key_icon_2 ? 38.h : 16.h,
                                            ),
                                          ),

                                        // Forward chevron
                                        if (isForward)
                                          Image.asset(
                                            forward_arrow_icon,
                                            height: 28.w,
                                          ),
                                      ],
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                          if (tile["suffixImageAsset"] == key_icon_2) ... [
                          Positioned(
                            top: 0,
                            left: 0,
                            right: 0,
                            child: Container(
                              height: 56.h,
                            decoration: BoxDecoration(
                              color: Colors.black.withOpacity(.3)
                            ),
                          )),
                      ],
                        ],
                      );
                    }).toList(),
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}