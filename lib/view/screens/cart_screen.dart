import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:udemy_shop_app/logic/controllers/cart_controller.dart';
import 'package:udemy_shop_app/utils/theme.dart';
import 'package:udemy_shop_app/view/widgets/cart/cart_product_card.dart';
import 'package:udemy_shop_app/view/widgets/cart/cart_total.dart';
import 'package:udemy_shop_app/view/widgets/cart/empty_cart.dart';

class CartScreen extends StatelessWidget {
  CartScreen({Key? key}) : super(key: key);

  final controller = Get.find<CartController>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: context.theme.backgroundColor,
        appBar: AppBar(
          title: const Text("Cart Items"),
          elevation: 0,
          backgroundColor: Get.isDarkMode ? darkGreyClr : mainColor,
          centerTitle: true,
          actions: [
            IconButton(
              onPressed: () {
                controller.clearAllProducts();
              },
              icon: const Icon(Icons.backspace_outlined),
            ),
          ],
        ),
        body: Obx(
          () {
            if (controller.productsMap.isEmpty) {
              return const EmptyCart();
            } else {
              return SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  // crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    SizedBox(
                      height: 650,
                      child: ListView.separated(
                        itemBuilder: (context, index) {
                          return CartProductCard(
                            index: index,
                            productModels:
                                controller.productsMap.keys.toList()[index],
                            quantity:
                                controller.productsMap.values.toList()[index],
                          );
                        },
                        separatorBuilder: (context, index) => const SizedBox(
                          height: 10,
                        ),
                        itemCount: controller.productsMap.length,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 90),
                      child: CartTotal(),
                    ),
                  ],
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
