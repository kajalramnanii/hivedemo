import 'package:flutter/material.dart';
import 'package:presentation/core/widgets/app_sizer.dart';
import 'package:presentation/src/home/models/product_model.dart';

class ProductDetailWidget extends StatelessWidget {
  const ProductDetailWidget({
    super.key,
    required this.product,
  });

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          Text(
            product.title ?? '',
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
          ),
          const HeightBox(8),
          Text(
            product.description ?? '',
            maxLines: 3,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(fontSize: 14, color: Colors.grey),
          ),
          const HeightBox(12),
          Row(
            children: [
              Text(
                '\$ ${product.price}',
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const WidthBox(12),
              const Icon(Icons.star),
              const WidthBox(8),
              Text(
                '${product.rating!.rate ?? 0}',
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  fontSize: 16,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
