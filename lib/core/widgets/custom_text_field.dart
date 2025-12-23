import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../constants/app_colors/app_colors.dart';
import '../themes/app_typography.dart';

/// CustomTextField
/// 
/// A highly reusable TextFormField widget with consistent styling,
/// validation, and icon support.
/// 
/// Features:
/// - Label and hint text support
/// - Prefix and suffix icons
/// - Error handling and display
/// - Password visibility toggle
/// - Input formatters
/// - Customizable styling
/// - Proper ScreenUtil sizing
class CustomTextField extends StatefulWidget {
  /// Controller for the text field
  final TextEditingController? controller;

  /// Label text displayed above the field
  final String? label;

  /// Hint text displayed inside the field
  final String? hint;

  /// Whether the field is required (shows asterisk)
  final bool isRequired;

  /// Whether the field is read-only
  final bool isReadOnly;

  /// Whether the field is enabled
  final bool isEnabled;

  /// Whether the field is a password field
  final bool isPassword;

  /// Whether to show password visibility toggle
  final bool showPasswordToggle;

  /// Icon displayed before the text
  final IconData? prefixIcon;

  /// Icon displayed after the text
  final IconData? suffixIcon;

  /// Maximum number of lines
  final int? maxLines;

  /// Minimum number of lines
  final int? minLines;

  /// Maximum length of input
  final int? maxLength;

  /// Text input type
  final TextInputType? keyboardType;

  /// Text input action
  final TextInputAction? textInputAction;

  /// Callback when field value changes
  final ValueChanged<String>? onChanged;

  /// Callback when field is submitted
  final ValueChanged<String>? onSubmitted;

  /// Validation function
  final String? Function(String?)? validator;

  /// Input formatters
  final List<TextInputFormatter>? inputFormatters;

  /// Focus node
  final FocusNode? focusNode;

  /// Autofill hints
  final Iterable<String>? autofillHints;

  /// Custom border color
  final Color? borderColor;

  /// Custom fill color
  final Color? fillColor;

  /// Custom error color
  final Color? errorColor;

  /// Border radius
  final double? borderRadius;

  /// Content padding
  final EdgeInsets? contentPadding;

  /// Whether to show counter
  final bool showCounter;

  const CustomTextField({
    super.key,
    this.controller,
    this.label,
    this.hint,
    this.isRequired = false,
    this.isReadOnly = false,
    this.isEnabled = true,
    this.isPassword = false,
    this.showPasswordToggle = true,
    this.prefixIcon,
    this.suffixIcon,
    this.maxLines = 1,
    this.minLines,
    this.maxLength,
    this.keyboardType,
    this.textInputAction,
    this.onChanged,
    this.onSubmitted,
    this.validator,
    this.inputFormatters,
    this.focusNode,
    this.autofillHints,
    this.borderColor,
    this.fillColor,
    this.errorColor,
    this.borderRadius,
    this.contentPadding,
    this.showCounter = false,
  });

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  late bool _obscureText;
  late TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _obscureText = widget.isPassword;
    _controller = widget.controller ?? TextEditingController();
  }

  @override
  void dispose() {
    if (widget.controller == null) {
      _controller.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Color finalBorderColor = widget.borderColor ?? AppColors.border;
    final Color finalFillColor = widget.fillColor ?? AppColors.greyScale50;
    final Color finalErrorColor = widget.errorColor ?? AppColors.error;
    final double finalBorderRadius = widget.borderRadius ?? 12.r;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        if (widget.label != null) ...[
          Row(
            children: [
              Text(
                widget.label!,
                style: AppTypography.labelLarge.copyWith(
                  color: widget.isEnabled
                      ? AppColors.textPrimary
                      : AppColors.textDisabled,
                ),
              ),
              if (widget.isRequired) ...[
                SizedBox(width: 4.w),
                Text(
                  '*',
                  style: AppTypography.labelLarge.copyWith(
                    color: finalErrorColor,
                  ),
                ),
              ],
            ],
          ),
          SizedBox(height: 8.h),
        ],
        TextFormField(
          controller: _controller,
          obscureText: widget.isPassword ? _obscureText : false,
          readOnly: widget.isReadOnly,
          enabled: widget.isEnabled,
          maxLines: widget.maxLines,
          minLines: widget.minLines,
          maxLength: widget.maxLength,
          keyboardType: widget.keyboardType,
          textInputAction: widget.textInputAction,
          onChanged: widget.onChanged,
          onFieldSubmitted: widget.onSubmitted,
          validator: widget.validator,
          inputFormatters: widget.inputFormatters,
          focusNode: widget.focusNode,
          autofillHints: widget.autofillHints,
          style: AppTypography.bodyMedium.copyWith(
            color: widget.isEnabled
                ? AppColors.textPrimary
                : AppColors.textDisabled,
          ),
          decoration: InputDecoration(
            hintText: widget.hint,
            hintStyle: AppTypography.bodyMedium.copyWith(
              color: AppColors.textTertiary,
            ),
            prefixIcon: widget.prefixIcon != null
                ? Icon(
                    widget.prefixIcon,
                    size: 20.sp,
                    color: AppColors.textSecondary,
                  )
                : null,
            suffixIcon: _buildSuffixIcon(),
            filled: true,
            fillColor: widget.isEnabled ? finalFillColor : AppColors.greyScale100,
            contentPadding: widget.contentPadding ??
                EdgeInsets.symmetric(
                  horizontal: 16.w,
                  vertical: 16.h,
                ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(finalBorderRadius),
              borderSide: BorderSide(color: finalBorderColor, width: 1.w),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(finalBorderRadius),
              borderSide: BorderSide(color: finalBorderColor, width: 1.w),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(finalBorderRadius),
              borderSide: BorderSide(color: AppColors.primary, width: 2.w),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(finalBorderRadius),
              borderSide: BorderSide(color: finalErrorColor, width: 1.w),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(finalBorderRadius),
              borderSide: BorderSide(color: finalErrorColor, width: 2.w),
            ),
            disabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(finalBorderRadius),
              borderSide: BorderSide(color: AppColors.border, width: 1.w),
            ),
            errorStyle: AppTypography.caption.copyWith(
              color: finalErrorColor,
            ),
            counterText: widget.showCounter ? null : '',
          ),
        ),
      ],
    );
  }

  Widget? _buildSuffixIcon() {
    if (widget.isPassword && widget.showPasswordToggle) {
      return IconButton(
        icon: Icon(
          _obscureText ? Icons.visibility_off : Icons.visibility,
          size: 20.sp,
          color: AppColors.textSecondary,
        ),
        onPressed: () {
          setState(() {
            _obscureText = !_obscureText;
          });
        },
      );
    } else if (widget.suffixIcon != null) {
      return Icon(
        widget.suffixIcon,
        size: 20.sp,
        color: AppColors.textSecondary,
      );
    }
    return null;
  }
}

