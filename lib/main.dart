import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:kavachApp/app/controllers/page_index_controller.dart';
import 'package:kavachApp/app/controllers/presence_controller.dart';
import 'firebase_options.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

import 'app/routes/app_pages.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    name: 'kavachApp',
    options: DefaultFirebaseOptions.currentPlatform,
  );
  Get.put(PresenceController(), permanent: true);
  Get.put(PageIndexController(), permanent: true);

  runApp(
    StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const MaterialApp(
            home: Scaffold(
              body: Center(
                child: CircularProgressIndicator(),
              ),
            ),
          );
        }
        return GetMaterialApp(
          title: "Application",
          debugShowCheckedModeBanner: true,
          initialRoute: snapshot.data != null ? Routes.HOME : Routes.LOGIN,
          getPages: AppPages.routes,
          theme: ThemeData(
            scaffoldBackgroundColor: Colors.white,
            fontFamily: 'inter',
          ),
        );
      },
    ),
  );
}

// class splash extends StatelessWidget {
//   const splash({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return AnimatedSplashScreen(
//         splash: Lottie.asset('assets/610-indian-flag.json'),
//         nextScreen: );
//   }
// }
