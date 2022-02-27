import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';
import 'package:udemy_shop_app/main.dart';
import 'package:udemy_shop_app/routes/routes.dart';
import 'package:udemy_shop_app/utils/theme.dart';
import 'package:udemy_shop_app/view/widgets/text_utils.dart';

class WellcomeScreen extends StatefulWidget {
  final String? title;
  const WellcomeScreen({Key? key, this.title}) : super(key: key);

  @override
  State<WellcomeScreen> createState() => _WellcomeScreenState();
}

class _WellcomeScreenState extends State<WellcomeScreen> {
  @override
  void initState() {
    super.initState();
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      RemoteNotification? notification = message.notification;
      AndroidNotification? android = message.notification?.android;
      if (notification != null && android != null) {
        flutterLocalNotificationsPlugin.show(
            notification.hashCode,
            notification.title,
            notification.body,
            NotificationDetails(
              android: AndroidNotificationDetails(
                channel.id,
                channel.name,
                color: Colors.blue,
                playSound: true,
                icon: '@mipmap/ic_launcher',
              ),
            ));
      }
    });

    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      print('A new onMessageOpenedApp event was published!');
      RemoteNotification? notification = message.notification;
      AndroidNotification? android = message.notification?.android;
      if (notification != null && android != null) {
        showDialog(
            context: context,
            builder: (_) {
              return AlertDialog(
                title: Text(notification.title.toString()),
                content: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [Text(notification.body.toString())],
                  ),
                ),
              );
            });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: Stack(
        children: [
          SizedBox(
            width: double.infinity,
            height: double.infinity,
            child: Image.asset(
              'assets/images/nbg.jpg',
              fit: BoxFit.cover,
            ),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextUtils(
                  fontSize: 50,
                  fontWeight: FontWeight.bold,
                  text: "Hello",
                  color: Colors.white,
                  underLine: TextDecoration.none,
                ),
                TextUtils(
                  fontSize: 20,
                  fontWeight: FontWeight.normal,
                  text: "Hello",
                  color: Colors.white,
                  underLine: TextDecoration.none,
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: mainColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(90),
                    ),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 15,
                      vertical: 12,
                    ),
                  ),
                  onPressed: () {
                    // Get.to(LoginScreen());
                    Get.offNamed(Routes.loginScreen);
                  },
                  child: TextUtils(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    text: "Get Started",
                    color: Colors.white,
                    underLine: TextDecoration.none,
                  ),
                ),
              ],
            ),
          ),
        ],
      )),
    );
  }
}

class FirebaseControler extends GetxController {
  FirebaseMessaging firebaseMessaging = FirebaseMessaging.instance;

  @override
  void onInit() {
    super.onInit();
    getToken();
    InitializeNotification();
  }

  getToken() async {
    String? fcmToken = await firebaseMessaging.getToken();
    print(fcmToken);
  }

  InitializeNotification() async {
    firebaseMessaging.getInitialMessage().then((RemoteMessage? message) async {
      print(message!.data);
    });
    FirebaseMessaging.onMessage.listen((RemoteMessage? message) {
      print(message!.data);
    });
    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage? message) {
      print(message!.data);
    });
  }
}
