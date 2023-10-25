import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:plant/take_picture.dart';



class SecondPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Second Page'),
      ),
      body: Center(
  child:  Column( children: <Widget>[ Text('This is the second page!'),
    // In the First Page
    ElevatedButton(
      onPressed: () {
        Navigator.pushNamed(context, '/second'); // Navigate to the second page
      },
      child: Text('Go to Second Page'),
    )
  ])

      ),
    );
  }}
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Obtain a list of the available cameras on the device.
  final cameras = await availableCameras();

  // Get a specific camera from the list of available cameras.
  final firstCamera = cameras.first;
  runApp(MyApp(firstCamera));
}

class MyApp extends StatelessWidget {
  var firstCamera1= null;
  MyApp(CameraDescription firstCamera) {
    firstCamera1 = firstCamera;
  }



  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/', // Define the initial route
      routes: {
        '/': (context) => SecondPage(), // Define the first page as the initial route
        '/second': (context) => TakePictureScreen(camera: firstCamera1), // Define the second page route
      },
    );
  }
}
