import 'package:dio/dio.dart';

class FireBasNotification {
  static const _serverKey =
      'AAAAivK-cQs:APA91bEPHVu--kMqseGy9M2iZpX0DJRHKo2KXZcJCaB8jVnuik4iNzTJUGQ4efalYXmaD5Ve5W2htUOFjeLRD-eo36O7joT-CFgHIxK8wGrlhDNmsHFy3BRH6ClqfZl5-MfL7Zr5MATR';

  static push({
    required String to,
    required String title,
    required String body,
  }) async {
    try {
      return await Dio().post('https://fcm.googleapis.com/fcm/send',
          data: {
            "to": to,
            "notification": {"title": title, "body": body, "sound": "default"},
            "android": {
              "Priority": "HIGH",
            },
            "data": {
              "type": "order",
              "id": "87",
              "click_action": "FLUTTER_NOTIFICATION_CLICK"
            }
          },
          options: Options(headers: {
            'Content-Type': 'application/json',
            'Authorization': 'key = $_serverKey'
          }));
    }  catch (e) {
      // TODO
    }
  }
}
