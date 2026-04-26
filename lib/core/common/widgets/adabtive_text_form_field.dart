import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:route_smart/core/app/theme/my_colors.dart';
import 'package:route_smart/core/extensions/context_extensions.dart';
import 'package:route_smart/core/helper/spacing.dart';

class AdaptiveInputField extends StatelessWidget {
  const AdaptiveInputField({
    required this.context,
    required this.controller,
    this.validate,
    super.key,
    this.title,
    this.counterText,
    this.maxLength,
    this.heightAfterIt = 0,
    this.doOnTapOutside = true,
    this.focusNode,
    this.textDirection,
    this.crossAxisAlignment = CrossAxisAlignment.start,
    this.errorText,
    this.keyboardType = TextInputType.text,
    this.suffixColor,
    this.radius = 10.67,
    this.textFormFieldIcon,
    this.autofocus = false,
    this.readOnly = false,
    this.prefix,
    this.contextMenuBuilder,
    this.initialValue,
    this.onSubmit,
    this.onChange,
    this.onTap,
    this.enabled,
    this.suffix,
    this.suffixPressed,
    this.constraints,
    this.textAlign = TextAlign.start,
    this.maxLines,
    this.hintText,
    this.isPassword = false,
    this.inputFormatters,
    this.textCapitalization = TextCapitalization.words,
    this.borderColor, // إضافة المتغير هنا
  });

  final BuildContext context;
  final TextEditingController controller;
  final String? title;
  final double heightAfterIt;
  final bool readOnly;
  final String? hintText;
  final CrossAxisAlignment? crossAxisAlignment;
  final String? errorText;
  final TextDirection? textDirection;
  final Widget? prefix;
  final Widget? textFormFieldIcon;
  final String? initialValue;
  final Color? suffixColor;
  final TextInputType? keyboardType;
  final dynamic Function(String)? onSubmit;
  final dynamic Function(String)? onChange;
  final dynamic Function()? onTap;
  final String? Function(String?)? validate;
  final bool isPassword;
  final bool? enabled;
  final Widget? suffix;
  final dynamic Function()? suffixPressed;
  final BoxConstraints? constraints;
  final EditableTextContextMenuBuilder? contextMenuBuilder;
  final TextAlign? textAlign;
  final int? maxLines;
  final String? counterText;
  final int? maxLength;
  final FocusNode? focusNode;
  final bool autofocus;
  final List<TextInputFormatter>? inputFormatters;
  final TextCapitalization textCapitalization;
  final double radius;
  final bool doOnTapOutside;
  final Color? borderColor; // تعريف المتغير

  @override
  Widget build(BuildContext context) {
    // تحديد لون الحواف الافتراضي إذا لم يتم تمريره
    final Color effectiveBorderColor = borderColor ?? MyColors.light.stroke;

    return Column(
      crossAxisAlignment: crossAxisAlignment!,
      children: [
        if (title != null)
          Text(title!, style: Theme.of(context).textTheme.labelLarge),
        if (title != null) verticalSpace(10),
        TextFormField(
          readOnly: readOnly,
          controller: controller,
          keyboardType: keyboardType,
          onTapOutside: doOnTapOutside
              ? (PointerDownEvent event) {
                  FocusManager.instance.primaryFocus?.unfocus();
                }
              : null,
          obscureText: isPassword,
          textDirection: textDirection,
          textAlign: textAlign!,
          onFieldSubmitted: onSubmit,
          enabled: enabled,
          autofocus: autofocus,
          onChanged: onChange,
          focusNode: focusNode,
          onTap: onTap,
          contextMenuBuilder: contextMenuBuilder,
          maxLines: maxLines,
          validator: validate,
          maxLength: maxLength,
          inputFormatters: inputFormatters,
          textCapitalization: textCapitalization,
          textAlignVertical: TextAlignVertical.center,
          style: context.textStyle.copyWith(
            color: context.color.textSecondary,
            fontWeight: FontWeight.w400,
            fontSize: 14,
          ),
          initialValue: initialValue,
          decoration: InputDecoration(
            icon: textFormFieldIcon,
            errorText: errorText,
            fillColor: MyColors.light.white,
            filled: true,
            hintText: hintText,
            contentPadding: const EdgeInsets.all(15),
            constraints: constraints,
            counterText: counterText,
            hintStyle: context.textStyle.copyWith(
              color: context.color.textSecondary,
              fontWeight: FontWeight.w400,
              fontSize: 14,
            ),
            errorStyle: Theme.of(context).textTheme.labelLarge,

            // الحالة العادية
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: effectiveBorderColor),
              borderRadius: BorderRadius.circular(radius),
            ),

            // حالة التركيز (Focus)
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color:
                    borderColor ?? MyColors.light.black.withValues(alpha: 0.2),
              ),
              borderRadius: BorderRadius.circular(radius),
            ),

            // حالة الخطأ
            errorBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color:
                    borderColor ?? MyColors.light.black.withValues(alpha: 0.2),
              ),
              borderRadius: BorderRadius.circular(radius),
            ),

            // حالة التركيز مع وجود خطأ
            focusedErrorBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color:
                    borderColor ?? MyColors.light.black.withValues(alpha: 0.2),
              ),
              borderRadius: BorderRadius.circular(radius),
            ),

            // حالة التعطيل (Disabled)
            disabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color:
                    borderColor ?? MyColors.light.black.withValues(alpha: 0.2),
              ),
              borderRadius: BorderRadius.circular(radius),
            ),

            prefixIcon: prefix,
            suffixIcon: suffix != null
                ? IconButton(
                    onPressed: suffixPressed,
                    icon: suffix!,
                    color: suffixColor,
                  )
                : null,
          ),
        ),
        SizedBox(height: heightAfterIt),
      ],
    );
  }
}
