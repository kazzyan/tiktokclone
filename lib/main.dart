import 'package:flutter/material.dart';
import 'package:tiktokclone/views/home/home.dart';

void main() {
  runApp(const TiktokClone());
}

class TiktokClone extends StatelessWidget {
  const TiktokClone({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'TiktokClone',
      home: Home(),
    );
  }
}
