// // NABEGHEHA.COM

import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

import 'package:plant_application/screens/qr_overlay.dart';
import 'package:plant_application/const/constants.dart';

class CameraPage extends StatefulWidget {
  const CameraPage({super.key});

  @override
  State<CameraPage> createState() => _CameraPageState();
}

class _CameraPageState extends State<CameraPage> {
  MobileScannerController cameraController = MobileScannerController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // MobileScanner(
          //   // inja bayad ezafe mishod
          //   controller: cameraController,
          //   allowDuplicates: false,
          //   onDetect: (barcode, args) {
          //     if (barcode.rawValue == null) {
          //       debugPrint('Failed to scan Barcode');
          //     } else {
          //       final String code = barcode.rawValue!;
          //       debugPrint('Barcode found! $code');
          //     }
          //   },
          // ),
          MobileScanner(
            controller: cameraController,
            onDetect: (barcode) {
              if (barcode.raw == null) {
                debugPrint('Failed to scan Barcode');
              } else {
                final Object? code = barcode.raw;
                debugPrint('Barcode found! $code');
              }
            },
          ),
          QRScannerOverlay(overlayColour: Colors.black.withOpacity(0.5)),
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
                    child: Icon(Icons.close, color: Colors.white),
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
                  child: Icon(Icons.flash_off, color: Colors.white),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

//           // AppBar
//           Positioned(
//             top: 50.0,
//             left: 20.0,
//             right: 20.0,
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 GestureDetector(
//                   onTap: () {
//                     Navigator.pop(context);
//                   },
//                   // X Button
//                   child: Container(
//                     height: 40.0,
//                     width: 40.0,
//                     decoration: BoxDecoration(
//                       borderRadius: BorderRadius.circular(50.0),
//                       color: Constants.primaryColor.withOpacity(0.2),
//                     ),
//                     child: const Icon(Icons.close, color: Colors.white),
//                   ),
//                 ),
//                 // Torch Button
//                 Container(
//                   height: 40.0,
//                   width: 40.0,
//                   decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(50.0),
//                     color: Constants.primaryColor.withOpacity(0.2),
//                   ),
//                   child: IconButton(
//                     color: Colors.white,
//                     icon: ValueListenableBuilder(
//                       valueListenable: cameraController.,
//                       builder: (context, state, child) {
//                         switch (state) {
//                           case TorchState.off:
//                             return const Icon(
//                               Icons.flash_off,
//                               color: Colors.white,
//                             );
//                           case TorchState.on:
//                             return const Icon(
//                               Icons.flash_on,
//                               color: Colors.yellow,
//                             );
//                         }
//                       },
//                     ),
//                     onPressed: () => cameraController.toggleTorch(),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
