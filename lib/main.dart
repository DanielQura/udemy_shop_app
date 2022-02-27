import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:udemy_shop_app/language/localiztion.dart';
import 'package:udemy_shop_app/logic/controllers/theme_controller.dart';
import 'package:udemy_shop_app/routes/routes.dart';
import 'package:udemy_shop_app/utils/my_string.dart';
import 'package:udemy_shop_app/utils/theme.dart';

const AndroidNotificationChannel channel = AndroidNotificationChannel(
  'high_importance_channel', // id
  'High Importance Notifications', // title
  importance: Importance.high,
  playSound: true,
);

final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();
Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp();
  print('A bg message just showed up :  ${message.messageId}');
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  await GetStorage.init();
  await Firebase.initializeApp();
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

  await flutterLocalNotificationsPlugin
      .resolvePlatformSpecificImplementation<
          AndroidFlutterLocalNotificationsPlugin>()
      ?.createNotificationChannel(channel);

  await FirebaseMessaging.instance.setForegroundNotificationPresentationOptions(
    alert: true,
    badge: true,
    sound: true,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'DQ Shop',
      debugShowCheckedModeBanner: false,
      
      locale: Locale(GetStorage().read<String>('lang').toString()),
      translations: LocaliztionApp(),
      fallbackLocale: Locale(ene),
      theme: ThemesApp.light,
      darkTheme: ThemesApp.dark,
      themeMode: ThemeController(
       
      ).themeDataGet,
      initialRoute: FirebaseAuth.instance.currentUser != null ||
              GetStorage().read<bool>('auth') == true
          ? AppRoutes.mainSreen
          : AppRoutes.welcome,
      getPages: AppRoutes.routes,
    );
  }
}
