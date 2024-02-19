import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:naraakom/features/accept_requests/presentation/manager/accept_requests_cubit.dart';
import 'package:naraakom/features/new_reservation/presentation/manager/new_reservation_cubit.dart';
import 'config/theme/theme_helper.dart';
import 'core/helper/save_data.dart';
import 'features/chat/presentation/manager/chat_cubit.dart';
import 'features/chat/presentation/pages/chat_screen.dart';
import 'features/chat/presentation/pages/widgets/class_notifaction_api.dart';
import 'features/doctor_request/presentation/manager/doctor_request_cubit.dart';
import 'features/splash/presentation/pages/splash.dart';

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  // If you're going to use other Firebase services in the background, such as Firestore,
  // make sure you call initializeApp before using other Firebase services.

  print("Handling a background message: ${message.messageId}");
//عملت كومنت هنااااااااااااااااا
  // navigatorGlobalKey?.currentState?.pushAndRemoveUntil(
  //     MaterialPageRoute(
  //       builder: (context) =>
  //           NotificationsChatScreen(userId: message.data["id"] ?? ""),
  //     ),
  //         (route) => false);
}

GlobalKey<NavigatorState>? navigatorGlobalKey = GlobalKey<NavigatorState>();

String? deviceToken;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await CacheHelper.initShared();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);
 await NotificationApi.init();

  FirebaseMessaging messaging = FirebaseMessaging.instance;

  NotificationSettings settings = await messaging.requestPermission(
    alert: true,
    announcement: false,
    badge: true,
    carPlay: false,
    criticalAlert: false,
    provisional: false,
    sound: true,
  );

  deviceToken = await messaging.getToken(
    vapidKey: "BGpdLRs......",
  );
  print("token///////$deviceToken");

  FirebaseMessaging.onMessage.listen((RemoteMessage message) {
    print('Got a message whilst in the foreground!');
    print('Message data: ${message.data}');

    if (message.notification != null) {



        NotificationApi.notificationsDetails(
            body: "${message.notification!.body}",
            title: "${message.notification!.title}",
            payload: message.data['id']);

    }
  });
  FirebaseMessaging.onMessageOpenedApp.listen((event) {

    // navigatorGlobalKey?.currentState?.push(MaterialPageRoute(
    //   builder: (context) => ChatScreen(userId: event.data["id"] ?? ""),
    // ));
  });

  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);


  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

adminSubscripe(){
  try {
    FirebaseMessaging.instance.subscribeToTopic("admin");
  }  catch (e) {
    print(e.toString());
  }
}
class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => ChatCubit(),
        ),
        BlocProvider(
          create: (context) => AcceptRequestsCubit()..acceptRequests(),
        ),
        BlocProvider(
          create: (context) => NewReservationCubit(),
        ),BlocProvider(
          create: (context) => DoctorRequestCubit(),
        ),
      ],
      child: MaterialApp(
        navigatorKey: navigatorGlobalKey,
        theme: theme,
        title: 'admin استشاري تخاطب',
        debugShowCheckedModeBanner: false,
        locale: const Locale('ar', ''),
        localizationsDelegates: const [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: const [Locale('ar', '')],
        home: SplashScreen(),
      ),
    );
  }
}
