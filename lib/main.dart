// import 'package:camera/camera.dart';
import 'package:englifyar/core/theme/pallete.dart';
import 'package:englifyar/features/wrapper.dart';
import 'package:flutter/material.dart';

// List<CameraDescription> cameras = [];
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // cameras = await availableCameras();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData.light()
          .copyWith(scaffoldBackgroundColor: AppPallete.primaryColor),
      home: const Wrapper(),
    );
  }
}
