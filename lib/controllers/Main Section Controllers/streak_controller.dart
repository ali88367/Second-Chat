import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:second_chat/core/constants/app_colors/app_colors.dart';
import 'package:second_chat/core/themes/textstyles.dart';
import 'package:second_chat/core/widgets/custom_switch.dart';

class StreamStreaksController extends GetxController {
  var selectedDays = <String, bool>{
    'Mon': false,
    'Tue': false,
    'Wed': false,
    'Thur': false,
    'Fri': false,
    'Sat': false,
    'Sun': false,
  }.obs;

  var threeTimesWeek = false.obs;
  var isSelectingThreeDays = false.obs;

  /// Interactive menu numbers
  var selectedMenuNumbers = <int>[].obs;

  int get selectedCount => selectedMenuNumbers.length;

  List<int> get availableMenuNumbers =>
      List.generate(7, (i) => i + 1)
          .where((n) => !selectedMenuNumbers.contains(n))
          .toList();

  bool get areDaysDisabled => threeTimesWeek.value;

  void toggleMenuNumber(int number) {
    if (selectedMenuNumbers.contains(number)) {
      selectedMenuNumbers.remove(number);
    } else {
      if (selectedMenuNumbers.length < 3) {
        selectedMenuNumbers.add(number);
      }
    }

    if (selectedMenuNumbers.length == 3) {
      isSelectingThreeDays.value = false;
      threeTimesWeek.value = true;
      syncMenuToDays();
    }
  }

  void toggleDay(String day) {
    if (areDaysDisabled) return;
    selectedDays[day] = !selectedDays[day]!;
    selectedDays.refresh();
  }

  void toggleThreeTimesWeek(bool value) {
    threeTimesWeek.value = value;

    if (value) {
      isSelectingThreeDays.value = true;
      selectedMenuNumbers.clear();
      selectedDays.updateAll((key, value) => false);
    } else {
      isSelectingThreeDays.value = false;
      selectedMenuNumbers.clear();
    }
  }

  void syncMenuToDays() {
    if (!threeTimesWeek.value) return;

    final days = selectedDays.keys.toList();
    selectedDays.updateAll((key, value) => false);

    for (final n in selectedMenuNumbers) {
      selectedDays[days[n - 1]] = true;
    }

    selectedDays.refresh();
  }
}
