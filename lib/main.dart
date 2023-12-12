import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:signing_mass/authentication/login_page.dart';
import 'package:signing_mass/firebase_options.dart';
import 'package:signing_mass/models/objects.dart';
import 'package:signing_mass/provider/HandleMusic.dart';
import 'package:signing_mass/provider/auth_Provider.dart';
import 'package:signing_mass/pages/Root/root_widget.dart';
import 'package:signing_mass/provider/Maestro.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  final auth = FirebaseAuth.instanceFor(app: Firebase.app());
  auth.authStateChanges().listen((User? user) {
    if (user != null) {
      runApp(MultiProvider(
        providers: [
          ChangeNotifierProvider<Maestro>(create: (_) => Maestro()),
          ChangeNotifierProvider<HandleMusic>(create: (_) => HandleMusic()),
        ],
        child: const MyApp(),
      ));
    } else {
      runApp(
        ChangeNotifierProvider(
            create: (context) => AuthProvider(), child: const LoginPage()),
      );
    }
  });
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    Maestro maestro = Provider.of<Maestro>(context, listen: false);
    maestro.randomContent();
    maestro.startSheetStatus();
    maestro.setImgHomeUserPreference();
    var db = FirebaseFirestore.instance;
    var auth = FirebaseAuth.instance;

    return StreamBuilder(
        stream: db.collection('users').doc(auth.currentUser!.uid).snapshots(),
        builder: (context, snapshot) {
          maestro.setUserName(snapshot.data!.get('name'));
          if (snapshot.hasData) {
            return MaterialApp(
              title: 'Cantando a Missa',
              home: const Root(),
              theme: ThemeData(
                colorScheme: ColorScheme.fromSeed(seedColor: primaryColor),
                useMaterial3: true,
              ),
              debugShowCheckedModeBanner: false,
            );
          }
          return const Center(
            child: CircularProgressIndicator(color: redApp),
          );
        });
  }
}
