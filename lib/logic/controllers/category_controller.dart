import 'package:get/get.dart';
import 'package:udemy_shop_app/models/product_models.dart';
import 'package:udemy_shop_app/services/category_services.dart';

class CategoryController extends GetxController {
  var categoryNameList = <String>[].obs;
  var categoryList = <ProductModels>[].obs;

  var isCatgeoryLoading = false.obs;
  var isAllCategory = false.obs;

  List<String> imageCategory = [
    "https://images.pexels.com/photos/1841841/pexels-photo-1841841.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940",
    "https://images.pexels.com/photos/6563393/pexels-photo-6563393.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940",
    "https://images.pexels.com/photos/298863/pexels-photo-298863.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940",
    "https://images.pexels.com/photos/994523/pexels-photo-994523.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940",
  ].obs;

  @override
  void onInit() {
    super.onInit();
    getCategorys();
  }

  void getCategorys() async {
    var categoryName = await CategoryServices.getCategory();

    try {
      isCatgeoryLoading(true);
      if (categoryName.isNotEmpty) {
        categoryNameList.addAll(categoryName);
      }
    } finally {
      isCatgeoryLoading(false);
    }
  }

  getAllCategorys(String namecategory) async {
    isAllCategory(true);
    categoryList.value =
        await AllCategorySercvises.getAllCatehory(namecategory);

    isAllCategory(false);
  }

  getCategoryIndex(int index) async {
    var categoryAllName = await getAllCategorys(categoryNameList[index]);

    if (categoryAllName != null) {
      categoryList.value = categoryAllName;
    }
  }
}
