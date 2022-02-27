import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:get/state_manager.dart';

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
