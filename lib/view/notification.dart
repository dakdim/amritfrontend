// import 'package:flutter/material.dart';
// // import 'package:flutter_local_notifications/flutter_local_notifications.dart';
// import 'package:flutter_local_notifications/flutter_local_notifications.dart';

// class NotificationPage extends StatefulWidget {
//   @override
//   _NotificationPageState createState() => _NotificationPageState();
// }

// class _NotificationPageState extends State<NotificationPage> {
//   late FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin;

//   @override
//   void initState() {
//     super.initState();
//     initializeNotifications();
//   }

//   void initializeNotifications() {
//     flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

//     const AndroidInitializationSettings initializationSettingsAndroid =
//         AndroidInitializationSettings('@mipmap/ic_launcher');

//     const InitializationSettings initializationSettings = InitializationSettings(
//       android: initializationSettingsAndroid,
//     );

//     flutterLocalNotificationsPlugin.initialize(initializationSettings);
//   }

//   Future<void> scheduleNotification(DateTime scheduledTime) async {
//     const AndroidNotificationDetails androidNotificationDetails =
//         AndroidNotificationDetails(
//       'notification_channel_id',
//       'Scheduled Notifications',
//       channelDescription: 'This channel is for scheduled notifications',
//       importance: Importance.high,
//       priority: Priority.high,
//     );

//     const NotificationDetails notificationDetails = NotificationDetails(
//       android: androidNotificationDetails,
//     );

//     await flutterLocalNotificationsPlugin.zonedSchedule(
//       0, // Notification ID
//       'Reminder', // Notification Title
//       'This is your scheduled notification!', // Notification Body
//       scheduledTime,
//       notificationDetails,
//       androidAllowWhileIdle: true,
//       uiLocalNotificationDateInterpretation:
//           UILocalNotificationDateInterpretation.absoluteTime,
//       matchDateTimeComponents: DateTimeComponents.time, // Ensures it triggers at the exact time
//     );
//   }

//   void scheduleExampleNotification() {
//     final now = DateTime.now();
//     final scheduledTime = DateTime(
//       now.year,
//       now.month,
//       now.day,
//       now.hour,
//       now.minute + 1, // Set it for 1 minute from now
//     );

//     scheduleNotification(scheduledTime);
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("Notification Page"),
//       ),
//       body: Center(
//         child: ElevatedButton(
//           onPressed: scheduleExampleNotification,
//           child: const Text("Schedule Notification"),
//         ),
//       ),
//     );
//   }
// }
