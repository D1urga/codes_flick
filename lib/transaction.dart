import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';
import 'package:sizer/sizer.dart';

class Transaction extends StatelessWidget {
  const Transaction({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 208, 181, 233),
      // body: Center(
      //   child: QrImageView(
      //     data: 'https://www.cricbuzz.com/cricket-match/live-scores',
      //     version: QrVersions.auto,
      //     size: 200.0,
      //   ),
      // ),
    );
  }
}
