import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:plant_application/const/constants.dart';
import 'package:plant_application/screens/camera_page.dart';

class ScanPage extends StatefulWidget {
  const ScanPage({super.key});

  @override
  State<ScanPage> createState() => _ScanPageState();
}

class _ScanPageState extends State<ScanPage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Positioned(
            top: 50.0,
            left: 20.0,
            right: 20.0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  // X Button
                  child: Container(
                    height: 40.0,
                    width: 40.0,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50.0),
                      color: Constants.primaryColor.withOpacity(0.15),
                    ),
                    child: Icon(Icons.close, color: Constants.primaryColor),
                  ),
                ),
                // Share Button
                Container(
                  height: 40.0,
                  width: 40.0,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50.0),
                    color: Constants.primaryColor.withOpacity(0.15),
                  ),
                  child: Icon(Icons.share, color: Constants.primaryColor),
                ),
              ],
            ),
          ),
          Positioned(
            top: size.height * 0.35,
            left: size.width * 0.2,
            right: size.width * 0.2,
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: 150,
                  child: GestureDetector(
                    onTap: () {
                      // MobileScanner(
                      //   controller: mobileController,
                      //   onDetect: (barcodes) {
                      //     debugPrint('LOADING');
                      //   },
                      // );
                      Navigator.push(
                        context,
                        PageTransition(
                          type: PageTransitionType.bottomToTop,
                          child: CameraPage(),
                        ),
                      );
                    },
                    child: Image.asset('assets/images/code-scan.png'),
                  ),
                ),
                SizedBox(height: 20),
                Text(
                  'برای اسکن کلیک کنید',
                  textAlign: TextAlign.justify,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontFamily: 'lalezar',
                    fontSize: 20,
                    color: Constants.primaryColor.withOpacity(0.8),
                  ),
                ),
              ],
            ),
          ),
          // Positioned(child: );
        ],
      ),
    );
  }
}
