import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:shopeasy_getx/data/repositories/authentication/authentication_repository.dart';
import 'app.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

/// Entry point of Flutter App
Future<void> main() async {
  // Ensure that widgets are initialized
  final WidgetsBinding widgetsBinding =
      WidgetsFlutterBinding.ensureInitialized();

  // Initialize GetX Local Storage
  await GetStorage.init();

  // Await Splash until other items load
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  // Remove # sign from url
  // Main App Starts here...
  //Todo:Initialize Authentication
  //Todo:add Widget Binding
  //Todo:Init Local Storage
  //Todo:Await Native Splash
  //Todo:Initialize Firebase
  // Initialize Firebase & Authentication Repository
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform)
      .then(
    (FirebaseApp value) => Get.put(AuthenticationRepository()),
  );

  // load the material design /  themes  / localizations  / bindings
  runApp(App());
}
