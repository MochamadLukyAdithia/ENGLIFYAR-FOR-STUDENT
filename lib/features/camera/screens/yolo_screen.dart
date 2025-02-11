// import 'package:camera/camera.dart';
// import 'package:flutter/material.dart';
// import 'package:tflite/tflite.dart'; // Make sure to use the correct package

// // Menggunakan daftar cameras global yang diinisialisasi di main.dart
// import 'package:englifyar/main.dart';

// class ArScreen extends StatefulWidget {
//   const ArScreen({super.key});

//   @override
//   State<ArScreen> createState() => _ArScreenState();
// }

// class _ArScreenState extends State<ArScreen> with WidgetsBindingObserver {
//   CameraController? cameraController;
//   CameraImage? cameraImage;
//   bool isProcessing = false;
//   String result = '';

//   @override
//   void initState() {
//     super.initState();
//     WidgetsBinding.instance.addObserver(this);
//     _initializeCamera();
//     _loadModel();
//   }

//   @override
//   void dispose() {
//     WidgetsBinding.instance.removeObserver(this);
//     _cleanupResources();
//     super.dispose();
//   }

//   Future<void> _cleanupResources() async {
//     try {
//       _stopCamera();
//       await Tflite.close(); // Ensure the correct cleanup
//     } catch (e) {
//       debugPrint("Error during cleanup: $e");
//     }
//   }

//   @override
//   void didChangeAppLifecycleState(AppLifecycleState state) {
//     if (state == AppLifecycleState.paused ||
//         state == AppLifecycleState.inactive) {
//       _stopCamera();
//     } else if (state == AppLifecycleState.resumed) {
//       _initializeCamera();
//     }
//   }

//   Future<void> _initializeCamera() async {
//     if (cameras.isEmpty) {
//       debugPrint("No cameras available.");
//       return;
//     }

//     try {
//       await _stopCamera();

//       cameraController = CameraController(
//         cameras[0],
//         ResolutionPreset.medium, // Use medium for better performance
//         enableAudio: false,
//       );

//       await cameraController!.initialize();
//       if (!mounted) return;

//       setState(() {});

//       cameraController!.startImageStream((image) {
//         if (!isProcessing) {
//           isProcessing = true;
//           cameraImage = image;
//           _runModelOnFrame();
//         }
//       });
//     } catch (e) {
//       debugPrint("Error initializing camera: $e");
//     }
//   }

//   Future<void> _loadModel() async {
//     try {
//       String? res = await Tflite.loadModel(
//         model: 'assets/models/mobilenet_v1_1.0_224.tflite',
//         labels: 'assets/models/mobilenet_v1_1.0_224.txt',
//       );
//       debugPrint("Model loaded successfully: $res");
//     } catch (e) {
//       debugPrint("Error loading model: $e");
//     }
//   }

//   Future<void> _runModelOnFrame() async {
//     if (cameraImage == null) {
//       isProcessing = false;
//       return;
//     }

//     try {
//       final recognitions = await Tflite.runModelOnFrame(
//         bytesList: cameraImage!.planes.map((plane) => plane.bytes).toList(),
//         imageHeight: cameraImage!.height,
//         imageWidth: cameraImage!.width,
//         imageMean: 127.5,
//         imageStd: 127.5,
//         numResults: 1,
//         threshold: 0.1,
//         rotation: 90,
//       );

//       if (!mounted) return;

//       setState(() {
//         result = recognitions?.map((res) {
//               return "${res["label"]} ${(res["confidence"] as double).toStringAsFixed(2)}";
//             }).join("\n") ??
//             "No results";
//       });
//     } catch (e) {
//       debugPrint("Error running model on frame: $e");
//     } finally {
//       isProcessing = false;
//     }
//   }

//   Future<void> _stopCamera() async {
//     if (cameraController != null && cameraController!.value.isInitialized) {
//       await cameraController!.stopImageStream();
//       await cameraController!.dispose();
//       cameraController = null;
//       debugPrint("Camera stopped and disposed.");
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: cameraController == null || !cameraController!.value.isInitialized
//           ? const Center(child: CircularProgressIndicator())
//           : Stack(
//               children: [
//                 Positioned.fill(
//                   child: CameraPreview(cameraController!),
//                 ),
//                 Positioned(
//                   bottom: 20,
//                   left: 20,
//                   right: 20,
//                   child: Container(
//                     padding: const EdgeInsets.all(16),
//                     decoration: BoxDecoration(
//                       color: Colors.black.withOpacity(0.6),
//                       borderRadius: BorderRadius.circular(10),
//                     ),
//                     child: Text(
//                       result.isEmpty ? "Menunggu hasil..." : result,
//                       style: const TextStyle(
//                         color: Colors.white,
//                         fontSize: 18,
//                       ),
//                       textAlign: TextAlign.center,
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//     );
//   }
// }
