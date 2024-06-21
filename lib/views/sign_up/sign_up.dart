import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tiktokclone/constants/gaps.dart';
import 'package:tiktokclone/constants/sizes.dart';
import 'package:tiktokclone/constants/svg_logo.dart';
import 'package:tiktokclone/views/sign_up/shared/auth_button.dart';
import 'package:tiktokclone/views/sign_up/create_account.dart';

class SignUp extends StatelessWidget {
  const SignUp({super.key});

  void _onSignInTap(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => const CreateAccount(),
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
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: Sizes.size40,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Gaps.ver80,
            const Text(
              'See what\'s happening\nin the world right now',
              style: TextStyle(
                fontSize: Sizes.size24,
                fontWeight: FontWeight.w700,
              ),
              textAlign: TextAlign.center,
            ),
            Gaps.ver80,
            GestureDetector(
              child: const AuthButton(
                icon: FontAwesomeIcons.google,
                text: 'Continue with Google',
              ),
            ),
            Gaps.ver10,
            const AuthButton(
              icon: FontAwesomeIcons.apple,
              text: 'Continue with Apple',
            ),
            Gaps.ver10,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  width: 100,
                  height: 1,
                  color: Colors.black38,
                ),
                const Text('or'),
                Container(
                  width: 100,
                  height: 1,
                  color: Colors.black38,
                ),
              ],
            ),
            GestureDetector(
              onTap: () => _onSignInTap(context),
              child: FractionallySizedBox(
                widthFactor: 1,
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    vertical: Sizes.size20,
                    horizontal: Sizes.size32,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: const Text(
                    'Create account',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
            Gaps.ver20,
            Text.rich(
              textAlign: TextAlign.start,
              TextSpan(
                text: 'By signing up, you agree to our ',
                style: const TextStyle(
                  fontSize: Sizes.size16,
                  color: Colors.black54,
                ),
                children: [
                  const TextSpan(
                    text: 'Terms',
                    style: TextStyle(
                      fontSize: Sizes.size16,
                      color: Colors.lightBlue,
                    ),
                  ),
                  const TextSpan(
                    text: ',\n',
                    style: TextStyle(
                      fontSize: Sizes.size16,
                      color: Colors.black54,
                    ),
                  ),
                  TextSpan(
                    text: 'Privacy Policy',
                    style: const TextStyle(
                      fontSize: Sizes.size16,
                      color: Colors.lightBlue,
                    ),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        // RichText() 나 Text.rich() 에서 TextSpan 에 onTap 사용가능
                      },
                  ),
                  const TextSpan(
                    text: ', and ',
                    style: TextStyle(
                      fontSize: Sizes.size16,
                      color: Colors.black54,
                    ),
                  ),
                  const TextSpan(
                    text: 'Cookie use',
                    style: TextStyle(
                      fontSize: Sizes.size16,
                      color: Colors.lightBlue,
                    ),
                  ),
                  const TextSpan(
                    text: '.',
                    style: TextStyle(
                      fontSize: Sizes.size16,
                      color: Colors.black54,
                    ),
                  ),
                ],
              ),
            ),
            Gaps.ver40,
            const FractionallySizedBox(
              widthFactor: 1,
              child: Text.rich(
                textAlign: TextAlign.start,
                TextSpan(
                  text: 'Have an account already? ',
                  style: TextStyle(
                    fontSize: Sizes.size16,
                    color: Colors.black54,
                  ),
                  children: [
                    TextSpan(
                      text: 'Log in',
                      style: TextStyle(
                        fontSize: Sizes.size16,
                        color: Colors.lightBlue,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
