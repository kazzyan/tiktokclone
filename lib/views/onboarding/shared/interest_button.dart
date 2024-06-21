import 'package:flutter/material.dart';

class InterestButton extends StatefulWidget {
  const InterestButton({
    super.key,
    required this.interest,
    required this.width,
  });

  final String interest;
  final double width;

  @override
  State<InterestButton> createState() => _InterestButtonState();
}

class _InterestButtonState extends State<InterestButton> {
  bool _isSelected = false;

  void _onSelectToggle() {
    setState(() {
      _isSelected = !_isSelected;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _onSelectToggle,
      child: AnimatedContainer(
        duration: const Duration(
          milliseconds: 300,
        ),
        padding: const EdgeInsets.all(
          20,
        ),
        width: widget.width,
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.black12.withOpacity(0.05),
          ),
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.black12.withOpacity(0.05),
              blurRadius: 5,
              spreadRadius: 5,
              offset: const Offset(
                5,
                5,
              ),
            ),
          ],
          color: _isSelected ? Theme.of(context).primaryColor : Colors.white,
        ),
        child: Text(
          widget.interest,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: _isSelected ? Colors.white : Colors.black87,
          ),
        ),
      ),
    );
  }
}
