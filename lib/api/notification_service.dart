import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/timezone.dart' as tz;
import 'package:timezone/data/latest_10y.dart' as tz;
import 'package:flutter_native_timezone/flutter_native_timezone.dart';
//ignore_for_file: prefer_const_constructors

class NotificationService{
  static final _notifications = FlutterLocalNotificationsPlugin();
  //static final onNotifications = BehaviorSubject<String?>();

  static Future _notificationDetails() async {
    return NotificationDetails(
      android: AndroidNotificationDetails(
          'channel id',
          'channel name',
          importance: Importance.max,
          playSound: true,
          enableVibration: true,
      ),
      iOS: IOSNotificationDetails(),
    );
  }

  static Future init({bool initReminder = false}) async {
    final android = AndroidInitializationSettings('@mipmap/ic_launcher'); //reminder
    final iOS = IOSInitializationSettings();
    final settings = InitializationSettings(android: android, iOS: iOS);

    await _notifications.initialize(settings);

    if (initReminder) {
      tz.initializeTimeZones(); //latest_10y
      final locationName = await FlutterNativeTimezone.getLocalTimezone();
      tz.setLocalLocation(tz.getLocation(locationName));
    }
  }

  static Future showReminder({
    required int id,
    String? title,
    String? body,
    required DateTime scheduledDate,
  }) async =>
    _notifications.zonedSchedule(
      id,
      title,
      body,
      tz.TZDateTime.from(scheduledDate, tz.local),
      await _notificationDetails(),
      uiLocalNotificationDateInterpretation: UILocalNotificationDateInterpretation.absoluteTime,
      androidAllowWhileIdle: true,
      );

}


