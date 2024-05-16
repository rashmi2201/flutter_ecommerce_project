import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_project/app.dart';
import 'package:flutter_ecommerce_project/data/repositories/authentication/authentication_repository.dart';
import 'package:flutter_ecommerce_project/firebase_options.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';

import 'package:get_storage/get_storage.dart';

Future<void> main() async {
  // Widgets Binding
  // ignore: unused_local_variable
  final WidgetsBinding widgetsBinding=WidgetsFlutterBinding.ensureInitialized();

  // -- GetX Local Storage
  await GetStorage.init();


  //Todo: Init Payment Methods
  
  //-- Await  Splash until other items load
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  
  
  
  //Todo: Initalize firebase
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform).then(
    (FirebaseApp value) => Get.put(AuthenticationRepository())
    );

  // Todo: Initalize Authication

  runApp(const App());
}
