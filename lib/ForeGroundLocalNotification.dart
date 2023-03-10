import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

class LocalNotification {
  static final FlutterLocalNotificationsPlugin _notifPlugin =
      FlutterLocalNotificationsPlugin();

  static void initialize() {
    final InitializationSettings initialSettings = InitializationSettings(
      android: AndroidInitializationSettings(
        '@mipmap/ic_launcher',
      ),
    );
    _notifPlugin.initialize(
      initialSettings,
      onDidReceiveNotificationResponse: (NotificationResponse details) {
        print('onDidReceiveNotificationResponse Function');
        print(details.payload);
        print(details.payload != null);
      },
    );
  }

  //fungsi menampilkan pesan nootifikasi foregroound
  static void showNotification(RemoteMessage message) {
    final NotificationDetails notifDetails = NotificationDetails(
        android: AndroidNotificationDetails(
            "com.example.fcm_foreground", "fcm_foreground",
            importance: Importance.max, priority: Priority.high));

    //atribuut field isi pesan yang muncul
    _notifPlugin.show(DateTime.now().microsecond, message.notification!.title,
        message.notification!.body, notifDetails);
  }
}
