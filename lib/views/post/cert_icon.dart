import 'package:flutter/material.dart';
import 'package:tiktokclone/constants/sizes.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CertIcon extends StatelessWidget {
  const CertIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      width: Sizes.size14,
      height: Sizes.size14,
      decoration: BoxDecoration(
        color: Colors.blue,
        borderRadius: BorderRadius.circular(
          Sizes.size20,
        ),
      ),
      child: const FaIcon(
        FontAwesomeIcons.check,
        size: Sizes.size8,
        color: Colors.white,
      ),
    );
  }
}
