import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tiktokclone/constants/gaps.dart';
import 'package:tiktokclone/constants/svg_logo.dart';
import 'package:tiktokclone/views/sign_up/shared/form_button.dart';
import 'package:tiktokclone/views/sign_up/sign_up.dart';

class AgreeTerms extends StatefulWidget {
  const AgreeTerms({super.key});

  @override
  State<AgreeTerms> createState() => _AgreeTermsState();
}

class _AgreeTermsState extends State<AgreeTerms> {
  bool _toggleValue = false;

  void _onToggle(bool? newValue) {
    if (newValue == null) return;

    setState(() {
      _toggleValue = newValue;
    });
  }

  void _onNextTap() {
    //stateful 위젯일때는 context를 넘겨받지 않아도 쓸 수 있음
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => const SignUp(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: SvgPicture.string(
            SvgLogo.svgString,
            height: 30,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 30,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Gaps.ver24,
              const Text(
                'Customize your experience',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                ),
              ),
              Gaps.ver24,
              const Text(
                'Track where you see Twitter\ncontetn across the web',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Gaps.ver14,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Expanded(
                    child: Text(
                      'Twitter uses data to personalize your experienct. This web browsing history will never be stored with your name, email, or phone number.',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Switch.adaptive(value: _toggleValue, onChanged: _onToggle),
                ],
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        surfaceTintColor: Colors.white,
        child: GestureDetector(
          onTap: _onNextTap, //context를 넘겨주지 않을 때, 간략하게 표현.
          child: FormButton(
            disabled: !_toggleValue,
            buttonText: 'Next',
          ),
        ),
      ),
    );
  }
}
