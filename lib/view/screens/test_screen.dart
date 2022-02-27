// import 'package:badges/badges.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:udemy_shop_app/logic/controllers/cart_controller.dart';
// import 'package:udemy_shop_app/logic/controllers/product_controller.dart';
// import 'package:udemy_shop_app/routes/routes.dart';
// import 'package:udemy_shop_app/utils/theme.dart';
// import 'package:udemy_shop_app/view/widgets/home/card_items.dart';

// class TestScreen extends StatelessWidget {
//   TestScreen({Key? key}) : super(key: key);

//   // final controller = Get.find<ProductController>();

//   // final cartController = Get.find<CartController>();

//   final cartControllerPut = Get.put(ProductController());

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: CustomScrollView(
//         slivers: [
//           SliverAppBar(
//             backgroundColor: mainColor,
//             expandedHeight: 200,
//             floating: true,
//             pinned: true,
//             centerTitle: true,
//             flexibleSpace: FlexibleSpaceBar(
//               centerTitle: true,
//               background: Image.network(
//                 "https://images.pexels.com/photos/221538/pexels-photo-221538.jpeg?auto=compress&cs=tinysrgb&h=750&w=1260",
//                 fit: BoxFit.cover,
//               ),
//               collapseMode: CollapseMode.pin,
//               title: const Text(
//                 "Categories",
//                 style: TextStyle(color: Colors.white),
//               ),
              
//             ),
//             // title: const Text("My App"),
//             leading: IconButton(
//               onPressed: () {},
//               icon: const Icon(Icons.arrow_back),
//             ),
//             // actions: [
//             //   Obx(
//             //     () => Badge(
//             //       position: BadgePosition.topEnd(top: 0, end: 3),
//             //       animationDuration: const Duration(milliseconds: 300),
//             //       animationType: BadgeAnimationType.slide,
//             //       badgeContent: Text(
//             //         cartController.quantity().toString(),
//             //         style: const TextStyle(color: Colors.white),
//             //       ),
//             //       child: IconButton(
//             //         onPressed: () {
//             //           Get.toNamed(Routes.cartScreen);
//             //         },
//             //         icon: Image.asset('assets/images/shop.png'),
//             //       ),
//             //     ),
//             //   ),
//             // ]
//           ),
//           // cardItemsWidget()
//         ],
//       ),
//     );
//   }
// }

// Widget cardItemsWidget() => SliverToBoxAdapter(child: CardItems());
