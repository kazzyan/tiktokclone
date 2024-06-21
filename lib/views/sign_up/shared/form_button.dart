import 'package:flutter/material.dart';
import 'package:tiktokclone/constants/sizes.dart';

class FormButton extends StatelessWidget {
  final bool disabled;
  final String buttonText;
  const FormButton({
    super.key,
    required this.disabled,
    required this.buttonText,
  });

  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      widthFactor: 1,
      child: AnimatedContainer(
        duration: const Duration(
          milliseconds: 500,
        ),
        padding: const EdgeInsets.symmetric(
          vertical: Sizes.size20,
          horizontal: Sizes.size20,
        ),
        decoration: BoxDecoration(
          color:
              disabled ? Colors.grey.shade200 : Theme.of(context).primaryColor,
          border: Border.all(
            color: Colors.grey.shade300,
            width: 0,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        child: AnimatedDefaultTextStyle(
          duration: const Duration(
            milliseconds: 500,
          ),
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w600,
            color: disabled ? Colors.grey.shade600 : Colors.white,
          ),
          child: Text(
            buttonText,
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
