import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vinnovatetest/controllers/route.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vinnovatetest/screen/loginscreen.dart';
import 'package:vinnovatetest/screen/productlisting.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: FirebaseOptions(
      apiKey:
          "AIzaSyDI3t3-Fc9qH4adC3oeSIBFZJE9tl1cIQA", // paste your api key here
      appId:
          "1:212842594375:android:ae925e862d02b3fa147162", //paste your app id here
      messagingSenderId: "212842594375", //paste your messagingSenderId here
      projectId: "vinnovatetest", //paste your project id here
    ),
  );
  SystemChrome.setPreferredOrientations(
          [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown])
      .then((value) => runApp(
            ProviderScope(child: MyApp()), // Wrap your app
          ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(390, 840),
        minTextAdapt: true,
        builder: (context, child) {
          return MaterialApp(
            title: 'vinnovatest',
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              appBarTheme: AppBarTheme(
                color: Color(0xFFF9F4F0),
              ),
              textTheme: TextTheme(titleMedium: TextStyle(color: Colors.grey)),
              checkboxTheme: CheckboxThemeData(
                checkColor: MaterialStateProperty.all(Colors.white),
                fillColor: MaterialStateProperty.all(Colors.white),
              ),
              fontFamily: 'NotoSans',
              scaffoldBackgroundColor: Color(0xFFF9F4F0),
              useMaterial3: true,
            ),
            home: LoginScreen(),
            initialRoute: initialRoute,
            onGenerateRoute: Routers.generateRoute,
          );
        });
  }
}
