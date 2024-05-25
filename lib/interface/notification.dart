import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/data/latest.dart' as tz;
import 'package:timezone/timezone.dart' as tz;

class NotificationService {
  final FlutterLocalNotificationsPlugin _notification = FlutterLocalNotificationsPlugin();

  Future<NotificationDetails> notificationDetails() async {
    return const NotificationDetails(
      android: AndroidNotificationDetails(
        'channelId',
        'channelName',
        importance: Importance.max,
        icon: 'ic_launcher', 
      ),
    );
  }

  Future<void> init() async {
  print("Initializing notifications...");
  const DarwinInitializationSettings ios = DarwinInitializationSettings();
  const AndroidInitializationSettings android = AndroidInitializationSettings('ic_launcher');
  const InitializationSettings settings = InitializationSettings(android: android, iOS: ios);

  try {
    await _notification.initialize(settings, onDidReceiveNotificationResponse: (details) {
    });
    print("Notifications initialized successfully!");
  } catch (e) {
    print("Error initializing notifications: $e");
  }

  tz.initializeTimeZones();
}

Future<void> scheduleDailyNotification({required int id, required String title, required String body}) async {
  print("Scheduling daily notification...");
  final now = tz.TZDateTime.now(tz.local);
  final scheduledTime = tz.TZDateTime(tz.local, now.year, now.month, now.day, 12, 25); // 12:08 PM

  try {
    await _notification.zonedSchedule(
      id,
      title,
      body,
      scheduledTime.isBefore(now)
          ? scheduledTime.add(Duration(days: 1))
          : scheduledTime,
      const NotificationDetails(
        android: AndroidNotificationDetails(
          'your channel id',
          'your channel name',
          importance: Importance.max,
          priority: Priority.high,
          showWhen: false,
        ),
      ),
      androidAllowWhileIdle: true,
      uiLocalNotificationDateInterpretation: UILocalNotificationDateInterpretation.absoluteTime,
      matchDateTimeComponents: DateTimeComponents.time,
    );
    print("Notification scheduled successfully!");
  } catch (e) {
    print("Error scheduling notification: $e");
  }
}

}
