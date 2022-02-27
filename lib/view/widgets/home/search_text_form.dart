import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:udemy_shop_app/logic/controllers/product_controller.dart';

class SearchFormText extends StatelessWidget {
  SearchFormText({Key? key}) : super(key: key);

  final controller = Get.find<ProductController>();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProductController>(
      builder: (_) => TextField(
        controller: controller.searchTextController,
        cursorColor: Colors.black,
        keyboardType: TextInputType.text,
        onChanged: (searchName) {
          controller.addSearchToList(searchName);
        },
        decoration: InputDecoration(
          fillColor: Colors.white,
          focusColor: Colors.red,
          prefixIcon: const Icon(
            Icons.search,
            color: Colors.grey,
          ),
          suffixIcon: controller.searchTextController.text.isNotEmpty
              ? IconButton(
                  onPressed: () {
                    controller.clearSearch();
                  },
                  icon: const Icon(
                    Icons.close,
                    color: Colors.black,
                  ),
                )
              : null,
          hintText: "Search",
          hintStyle: const TextStyle(
            color: Colors.black45,
            fontSize: 14,
            fontWeight: FontWeight.normal,
          ),
          filled: true,
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.white),
            borderRadius: BorderRadius.circular(8),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.white),
            borderRadius: BorderRadius.circular(8),
          ),
          errorBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.white),
            borderRadius: BorderRadius.circular(8),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.white),
            borderRadius: BorderRadius.circular(8),
          ),
        ),
      ),
    );
  }
}
