import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:route_smart/core/app/theme/my_colors.dart';
import 'package:route_smart/core/common/widgets/adabtive_text_form_field.dart';
import 'package:route_smart/core/styles/app_images.dart';

class CustomTextFormPassword extends StatefulWidget {

  const CustomTextFormPassword({
    required this.controller, super.key,
    this.title,
    this.hintText,
    this.validate,
    this.isConfirmPassword = false,
    this.heightAfterIt = 0,
    this.autofocus = false,
    this.focusNode,
   
  });
  final TextEditingController controller;
  final String? title;
  final String? hintText;
  final String? Function(String?)? validate;
  final bool isConfirmPassword;
  final double heightAfterIt;
  final bool autofocus;
  final FocusNode? focusNode;
 

  @override
  State<CustomTextFormPassword> createState() => _CustomTextFormPasswordState();
}

class _CustomTextFormPasswordState extends State<CustomTextFormPassword> {
  bool _isPasswordVisible = false;

  void _togglePasswordVisibility() {
    setState(() {
      _isPasswordVisible = !_isPasswordVisible;
    });
  }

  @override
  Widget build(BuildContext context) {
    return AdaptiveInputField(
      context: context,
      controller: widget.controller,
      title: widget.title,
      hintText: widget.hintText ?? (widget.isConfirmPassword ? 'Confirm Password' : 'Password'),
    
      validate: widget.validate,
      keyboardType: TextInputType.visiblePassword,
      textCapitalization: TextCapitalization.none,   
      isPassword: !_isPasswordVisible,
      heightAfterIt: widget.heightAfterIt,
      autofocus: widget.autofocus,
      focusNode: widget.focusNode, 
       maxLines: 1,
      suffix: SvgPicture.asset(
        _isPasswordVisible
            ?  AppImages.logoSmartShop
            : AppImages.logoSmartShop,

        color: context.colors.icon,
      ),
      suffixColor: context.colors.icon,
      suffixPressed: _togglePasswordVisibility,
    );
  }
}
