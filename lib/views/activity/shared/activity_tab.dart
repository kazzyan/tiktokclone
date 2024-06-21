import 'package:flutter/material.dart';
import 'package:tiktokclone/constants/sizes.dart';

class ActivityTab extends StatelessWidget {
  const ActivityTab({
    super.key,
    required this.text,
    required this.isSelected,
  });

  final String text;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 250),
      alignment: Alignment.center,
      width: 110,
      decoration: BoxDecoration(
        color: isSelected ? Colors.black : Colors.white,
        border: !isSelected
            ? Border.all(
                color: Colors.grey,
              )
            : null,
        borderRadius: BorderRadius.circular(
          Sizes.size10,
        ),
      ),
      child: Text(
        text,
        style: TextStyle(
          color: isSelected ? Colors.white : Colors.black,
          fontWeight: FontWeight.w600,
          fontSize: Sizes.size16,
        ),
      ),
    );
  }
}
