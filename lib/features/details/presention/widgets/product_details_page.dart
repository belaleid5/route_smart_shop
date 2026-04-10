// lib/features/product_details/presentation/pages/product_details_page.dart

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:route_smart/core/common/data/model/product_data_model.dart';
import 'package:route_smart/features/wishlist/presention/manger/wishlist_bloc.dart';
import 'package:route_smart/features/wishlist/presention/manger/wishlist_event.dart';
import '../widgets/product_image.dart';
import '../widgets/product_title.dart';
import '../widgets/product_price.dart';
import '../widgets/product_rating.dart';
import '../widgets/product_description.dart';
import '../widgets/product_wishlist_status.dart';
import '../widgets/product_details_app_bar.dart';

class ProductDetailsPage extends StatefulWidget {
  const ProductDetailsPage({
    super.key,
    required this.product,
  });

  final ProductDataModel product;

  @override
  State<ProductDetailsPage> createState() => _ProductDetailsPageState();
}

class _ProductDetailsPageState extends State<ProductDetailsPage> {
  @override
  void initState() {
    super.initState();
    context.read<WishlistBloc>().add(
          WishlistEvent.addToWishlist(widget.product.id ?? ''),
        );
  }

  @override
  Widget build(BuildContext context) {
    final product = widget.product;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: ProductDetailsAppBar(),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ProductImage(imageUrl: product.imageCover ?? ''),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ProductTitle(title: product.title ?? ''),
                  const SizedBox(height: 8),
                  ProductPrice(
                    price: product.price?.toDouble() ?? 0,
                    priceAfterDiscount: product.priceAfterDiscount?.toDouble(),
                  ),
                  const SizedBox(height: 12),
                  ProductRating(
                    rating: product.ratingsAverage?.toDouble() ?? 0,
                    count: product.ratingsQuantity ?? 0,
                  ),
                  const SizedBox(height: 16),
                  ProductDescription(description: product.description ?? ''),
                  const SizedBox(height: 24),
                  const ProductWishlistStatus(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
