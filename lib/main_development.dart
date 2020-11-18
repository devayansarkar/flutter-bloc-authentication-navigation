import 'package:flutter_mobile_application/app/mobile_application.dart';
import 'package:flutter_mobile_application/common/constants/environment.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(
    MobileApplication(
      environment: EnvironmentValue.development,
    ),
  );
}
