import 'dart:io';

import 'package:bit_connect/presentation/location/model/search_result.dart';
import 'package:bit_connect/presentation/news/data/news_adaptor.dart';
import 'package:bit_connect/presentation/news/model/news_model.dart';
import 'package:bit_connect/presentation/sims/provider/sims_provider.dart';
import 'package:bit_connect/presentation/splash_screen.dart';
import 'package:bit_connect/utils/load_env.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  await dotenv.load(fileName: ".env");
  WidgetsFlutterBinding.ensureInitialized();
  Platform.isAndroid
      ? await Firebase.initializeApp(
          options: FirebaseOptions(
            apiKey: loadFromEnv("FIREBASE_API_KEY"),
            appId: loadFromEnv("FIREBASE_APP_ID"),
            messagingSenderId: loadFromEnv("FIREBASE_MESSAGING_SENDER_ID"),
            projectId: loadFromEnv("FIREBASE_PROJECT_ID"),
          ),
        )
      : await Firebase.initializeApp();
  await Hive.initFlutter();
  Hive.registerAdapter(NewsAdaptor());
  await Hive.openBox<NewsModel>('newsBox');

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => Search(),
        ),
        ChangeNotifierProvider(
          create: (context) => SIMSProvider(),
        ),
      ],
      child: const BitConnect(),
    ),
  );
}

class BitConnect extends StatelessWidget {
  const BitConnect({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        textTheme: const TextTheme(
          bodyLarge: TextStyle(fontFamily: 'Poppins'),
          bodyMedium: TextStyle(fontFamily: 'Poppins'),
        ),
      ),
      title: "Bit-Connect",
      home: const SplashScreen(),
    );
  }
}
