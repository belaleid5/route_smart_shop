import 'package:route_smart/core/extensions/context_extensions.dart';
import 'package:flutter/material.dart';
import 'package:route_smart/core/app/theme/my_colors.dart';
import 'package:route_smart/core/helper/spacing.dart';
import 'package:route_smart/core/language/lang_keys.dart';

class ProductInfoItem extends StatelessWidget {
  final String? categoryName;
  final String? title;
  final num? price;
  final num? priceAfterDiscount;
  final num? rating;

  // ✅ Constants
  static const double _paddingAll = 12.0;
  static const double _spacing = 4.0;
  static const double _priceGap = 8.0;
  static const double _starSize = 14.0;
  static const double _starGap = 4.0;
  
  static const double _categoryFontSize = 11.0;
  static const double _titleFontSize = 13.0;
  static const double _priceFontSize = 14.0;
  static const double _strikesFontSize = 11.0;
  static const double _ratingFontSize = 11.0;

  const ProductInfoItem({
    super.key,
    this.categoryName,
    this.title,
    this.price,
    this.priceAfterDiscount,
    this.rating,
  });

  /// تنسيق السعر بصيغة مفهومة
  String _formatPrice(num? value) {
    if (value == null) return '0';
    return value is double 
        ? value.toStringAsFixed(2)
        : value.toString();
  }

  /// الحصول على السعر النهائي (بعد الخصم إن وجد)
  num _getFinalPrice() => priceAfterDiscount ?? price ?? 0;

  /// التحقق من وجود خصم
  bool _hasDiscount() => priceAfterDiscount != null && price != null;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(_paddingAll),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          // ✅ Category Name
          _buildCategory(context),
          verticalSpace(_spacing),

          // ✅ Product Title
          _buildTitle(context),
          verticalSpace(_spacing),

          // ✅ Price Section
          _buildPrice(context),
          verticalSpace(_spacing),

          // ✅ Rating Section
          _buildRating(context),
        ],
      ),
    );
  }

  Widget _buildCategory(BuildContext context) {
    return Text(
      categoryName?.isNotEmpty == true 
          ? categoryName! 
          : context.translate(LangKeys.uncategorized),
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
      style: context.textStyle.copyWith(
        color: context.colors.textSecondary,
        fontSize: _categoryFontSize,
        fontWeight: FontWeight.w500,
      ),
    );
  }

  Widget _buildTitle(BuildContext context) {
    return Text(
      title?.isNotEmpty == true 
          ? title! 
          : context.translate(LangKeys.noTitle),
      maxLines: 2,
      overflow: TextOverflow.ellipsis,
      style: context.textStyle.copyWith(
        fontWeight: FontWeight.bold,
        fontSize: _titleFontSize,
        color: context.colors.textPrimary,
      ),
    );
  }

  Widget _buildPrice(BuildContext context) {
    final finalPrice = _getFinalPrice();
    final hasDiscount = _hasDiscount();

    return Row(
      children: [
        Text(
          '${_formatPrice(finalPrice)} ${context.translate(LangKeys.currency)}',
          style: context.textStyle.copyWith(
            fontWeight: FontWeight.w800,
            color: context.colors.textPrimary,
            fontSize: _priceFontSize,
          ),
        ),

        if (hasDiscount) ...[
          const SizedBox(width: _priceGap),
          Text(
            _formatPrice(price),
            style: context.textStyle.copyWith(
              fontSize: _strikesFontSize,
              color: context.colors.textSecondary,
              decoration: TextDecoration.lineThrough,
              decorationColor: context.colors.textSecondary,
            ),
          ),
        ],
      ],
    );
  }

  Widget _buildRating(BuildContext context) {
    final ratingValue = rating ?? 0;
    
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(
          Icons.star_rounded,
          color: Colors.amber,
          size: _starSize,
        ),

        const SizedBox(width: _starGap),

       
        Text(
          ratingValue is double 
              ? ratingValue.toStringAsFixed(1)
              : ratingValue.toString(),
          style: context.textStyle.copyWith(
            fontSize: _ratingFontSize,
            color: context.colors.textSecondary,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }
}