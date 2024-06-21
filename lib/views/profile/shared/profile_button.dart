import 'package:flutter/material.dart';
import 'package:tiktokclone/constants/sizes.dart';

class ProfileButton extends StatelessWidget {
  const ProfileButton({
    super.key,
    required this.text,
  });

  final String text;

  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      widthFactor: 1,
      child: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.symmetric(
          vertical: Sizes.size6,
        ),
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.grey.withOpacity(0.6),
          ),
          borderRadius: BorderRadius.circular(
            Sizes.size10,
          ),
        ),
        child: Text(
          text,
          style: const TextStyle(
            fontSize: Sizes.size16,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}
