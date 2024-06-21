import 'package:flutter/material.dart';

class NavigatonTabButton extends StatelessWidget {
  final IconData icon;
  final bool isSelected;
  final Function onTap;

  const NavigatonTabButton({
    super.key,
    required this.icon,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: () => onTap(),
        child: Container(
          color: Colors.transparent,
          child: AnimatedOpacity(
            opacity: isSelected ? 1 : 0.4,
            duration: const Duration(
              milliseconds: 500,
            ),
            child: Icon(
              icon,
              size: isSelected ? 25 : 20,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
