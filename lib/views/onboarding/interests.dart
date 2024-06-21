import 'package:flutter/material.dart';
import 'package:tiktokclone/constants/gaps.dart';
import 'package:tiktokclone/views/onboarding/shared/interest_button.dart';

const interests = [
  "Fation & Beauty",
  "Outdoors",
  "Arts & Culture",
  "Animation & Comics",
  "Business & Finance",
  "Food",
  "Travel",
  "Entertainment",
  "Music",
  "Gaming",
  "Drama",
  "Learning",
  "Talent",
  "Sports",
  "Auto",
  "Family",
  "Dance",
];

class Interests extends StatefulWidget {
  const Interests({super.key});

  @override
  State<Interests> createState() => _InterestsState();
}

class _InterestsState extends State<Interests> {
  final ScrollController _scrollController = ScrollController();

  double _appbarOpacity = 0;

  void _onScrollOpacity() {
    setState(() {
      if (_scrollController.offset > 100) {
        if (_appbarOpacity == 1) {
          return;
        }
        _appbarOpacity = 1;
      } else {
        _appbarOpacity = 0;
      }
    });
  }

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScrollOpacity);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double width = (MediaQuery.of(context).size.width - 60) / 2;
    print(width);
    return Scaffold(
      appBar: AppBar(
        title: AnimatedOpacity(
          opacity: _appbarOpacity,
          duration: const Duration(
            milliseconds: 300,
          ),
          child: const Text(
            '관심분야',
          ),
        ),
        centerTitle: true,
      ),
      body: Scrollbar(
        controller: _scrollController,
        child: SingleChildScrollView(
          controller: _scrollController,
          child: Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 30,
              horizontal: 30,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Gaps.ver24,
                const Text(
                  'What do you want to see on Flutter?',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Gaps.ver10,
                const Text(
                  'Select at least 3 interests to personalize your Flutter experience. They will be sisible on your profile.',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: Colors.black54,
                  ),
                ),
                Gaps.ver20,
                Container(
                  height: 0.5,
                  color: Colors.black54,
                ),
                Gaps.ver32,
                Wrap(
                  children: [
                    for (var interest in interests)
                      InterestButton(
                        interest: interest,
                        width: width,
                      ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
