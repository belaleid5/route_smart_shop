import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:route_smart/core/app/app_cubit/app_cubit_cubit.dart';
import 'package:route_smart/core/app/theme/my_colors.dart';
import 'package:route_smart/core/extensions/animation_extensions.dart';
import 'package:route_smart/core/extensions/context_extensions.dart';
import 'package:route_smart/core/language/lang_keys.dart';

void showLanguageDialog(BuildContext context, String currentLangCode) {
  final appCubit = context.read<AppCubit>();

  showDialog<void>(
    context: context,
    builder: (ctx) {
      return AlertDialog(
        backgroundColor: context.colors.secondary,
        title: Text(
          context.translate(LangKeys.language),
          style: context.textStyle.copyWith(
            fontWeight: FontWeight.w700,
            color: context.colors.textPrimary,
          ),
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            RadioListTile<String>(
              value: 'ar',
              groupValue: currentLangCode,
              onChanged: (v) {
                if (v == null) return;
                appCubit.changeLanguage(v);
                Navigator.of(ctx).pop();
              },
              title: Text(
                context.translate(LangKeys.arabic),
                style: TextStyle(color: context.colors.textPrimary),
              ),
            ),
            RadioListTile<String>(
              value: 'en',
              groupValue: currentLangCode,
              onChanged: (v) {
                if (v == null) return;
                appCubit.changeLanguage(v);
                Navigator.of(ctx).pop();
              },
              title: Text(
                context.translate(LangKeys.english),
                style: TextStyle(color: context.colors.textPrimary),
              ),
            ),
          ],
        ),
      ).animateFlipVertical();
    },
  );
}
