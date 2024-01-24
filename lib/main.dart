import 'package:contakt/pages/splashscreen.dart';
import 'package:contakt/services/auth_service.dart';
import 'package:contakt/wigets/authcheck.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';

import 'firebase_options.dart';

// ignore: unused_import
import 'pages/home_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => AuthService()),
      ],
      child: const MaterialApp(
        home: AuthCheck(),
      ),
    ),
  );

  // await Firebase.Firestore.instance.settings = Settings(
  //   persistenceEnabled: true,
  // );
}

//