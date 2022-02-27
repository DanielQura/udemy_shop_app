import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:udemy_shop_app/logic/controllers/category_controller.dart';
import 'package:udemy_shop_app/utils/theme.dart';
import 'package:udemy_shop_app/view/widgets/category/category_items.dart';

class CategoryWidget extends StatelessWidget {
  CategoryWidget({Key? key}) : super(key: key);

  final controller = Get.find<CategoryController>();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () {
        if (controller.isCatgeoryLoading.value) {
          return Center(
            child: CircularProgressIndicator(
              color: Get.isDarkMode ? pinkClr : mainColor,
            ),
          );
        } else {
          return Expanded(
            child: ListView.separated(
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    controller.getCategoryIndex(index);
                    Get.to(() => CategoryItems(
                      catehoryTitle: controller.categoryNameList[index],
                    ));
                  },
                  
                  child: Container(
                    alignment: Alignment.center,
                    height: 130,
                    
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      image: DecorationImage(
                        image: NetworkImage(
                          controller.imageCategory[index],
                        ),
                        fit: BoxFit.cover,
                      ),
                    ),
                    // child: Padding(
                    //   padding: const EdgeInsets.only(left: 20, bottom: 85),
                    //   child: Align(
                    //     alignment: Alignment.bottomLeft,
                        
                    //     ),
                    //   ),
                    // ),
                  ),
                );
              },
              separatorBuilder: (context, index) {
                return const SizedBox(
                  height: 20,
                );
              },
              itemCount: controller.categoryNameList.length,
            ),
          );
        }
      },
    );
  }
}
