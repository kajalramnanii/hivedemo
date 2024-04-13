import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:presentation/core/widgets/app_sizer.dart';
import 'package:presentation/src/home/controller/home_controller.dart';
import 'package:presentation/src/home/widgets/product_detail_Widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    HomeController controller = Get.put(HomeController());

    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
      ),
      body: GetBuilder<HomeController>(builder: (controller) {
        return ListView.separated(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          itemBuilder: (context, index) {
            final product = controller.products[index];
            return Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: Colors.grey),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (index % 2 == 0) ...[
                    ProductDetailWidget(product: product),
                  ],
                  Expanded(
                    child: CachedNetworkImage(
                      imageUrl: product.image ?? '',
                      placeholder: (context, url) =>
                          const Center(child: CircularProgressIndicator()),
                      errorWidget: (context, url, error) =>
                          const Icon(Icons.error),
                    ),
                  ),
                  if (index % 2 != 0) ...[
                    const WidthBox(12),
                    ProductDetailWidget(product: product),
                  ]
                ],
              ),
            );
          },
          separatorBuilder: (context, index) => const HeightBox(10),
          itemCount: controller.products.length,
        );
      }),
    );
  }
}
