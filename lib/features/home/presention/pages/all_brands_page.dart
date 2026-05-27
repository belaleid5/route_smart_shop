import 'package:flutter/material.dart';
import 'package:route_smart/core/app/theme/my_colors.dart';
import 'package:route_smart/core/extensions/context_extensions.dart';
import 'package:route_smart/core/language/lang_keys.dart';
import 'package:route_smart/features/home/presention/refacors/all_brands_body.dart';

class AllBrandsPage extends StatelessWidget {
  const AllBrandsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.colors.background,
      appBar: AppBar(
        backgroundColor: context.colors.background,
        elevation: 0,
        centerTitle: true,
        title: Text(
          context.translate(LangKeys.allBrands),
          style: TextStyle(
            color: context.colors.textPrimary,
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios_rounded,
            color: context.colors.textPrimary,
          ),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: const AllBrandsBody(),
    );
  }
}
