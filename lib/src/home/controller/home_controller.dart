import 'dart:developer';

import 'package:get/get.dart';
import 'package:presentation/core/api_factory/api.dart';
import 'package:presentation/src/home/models/product_model.dart';

class HomeController extends GetxController {
  List<ProductModel> _products = [];

  List<ProductModel> get products => _products;

  set products(List<ProductModel> value) {
    _products = value;
    update();
  }

  ///This override method will auto
  ///when HomeController will Initialise
  @override
  void onInit() {
    super.onInit();
    _getProductData();
  }

  _getProductData() {
    Api.request(
      path: 'https://fakestoreapi.com/products',
      params: {},
      onResponse: (response) {
        log('message : $response');

        products = List<ProductModel>.from(
          response.map(
            (e) => ProductModel.fromJson(e),
          ),
        );

        print('Products : ${products.length}');
      },
    );
  }
}
