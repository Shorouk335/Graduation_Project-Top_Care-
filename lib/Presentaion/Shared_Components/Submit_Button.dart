import 'package:flutter/material.dart';
import 'package:top_care_gp/Resource/Color_Manager/Color_Manager.dart';

Widget submitButton(
    String text, VoidCallback onTap, double? Width, double? Height) {
  return Padding(
    padding: const EdgeInsets.all(20.0),
    child: Center(
      child: SizedBox(
        width: Width,
        height: Height,
        child: ElevatedButton(
          onPressed: onTap,
          style: ButtonStyle(
            backgroundColor:
                MaterialStateProperty.all(ColorManager.BlueBasiColor),
            shape: MaterialStateProperty.all(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(18),
              ),
            ),
          ),
          child: Text(
            text,
            style: const TextStyle(
                color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    ),
  );
}

// Widget commonButton(String text, Future<void> Function() onTap , BuildContext context ) {
//   return Padding(
//     padding: const EdgeInsets.all(15.0),
//     child: SizedBox(
//       width: 120,
//       height: 40,
//       child: ElevatedButton(
//         onPressed: () async {
//           await onTap();
//         },
//         style: ButtonStyle(
//           backgroundColor: MaterialStateColor(
//           ),
//           shape: MaterialStateProperty.all(
//             RoundedRectangleBorder(
//               borderRadius: BorderRadius.circular(18),
//             ),
//           ),
//         ),
//         child: Text(
//           text,
//           style: const TextStyle(
//               color: Colors.white,
//               fontSize: 15,
//               fontWeight: FontWeight.bold),
//         ),
//       ),
//     ),
//   );
// }
