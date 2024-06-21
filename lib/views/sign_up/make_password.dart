import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tiktokclone/constants/gaps.dart';
import 'package:tiktokclone/views/sign_up/shared/form_button.dart';
import 'package:tiktokclone/views/onboarding/interests.dart';

class MakePassword extends StatefulWidget {
  const MakePassword({super.key});

  @override
  State<MakePassword> createState() => _MakePasswordState();
}

class _MakePasswordState extends State<MakePassword> {
  final TextEditingController _passwordController = TextEditingController();

  String _password = '';

  bool _isObscureText = true;

  bool _isPasswordValid() {
    return _password.isNotEmpty && _password.length > 8;
  }

  void _onNextTap() {
    //stateful 위젯일때는 context를 넘겨받지 않아도 쓸 수 있음
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => const Interests(),
      ),
    );
  }

  void _onScaffoldTap() {
    FocusScope.of(context).unfocus();
  }

  void _onClearTap() {
    _passwordController.clear();
  }

  void _onViewToggleTap() {
    setState(() {
      _isObscureText = !_isObscureText;
    });
  }

  @override
  void initState() {
    super.initState();
    // super initstate를 처음에
    _passwordController.addListener(() {
      setState(() {
        _password = _passwordController.text;
      });
    });
  }

  @override
  void dispose() {
    _passwordController.dispose();
    //super dispose를 제일 마지막에
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _onScaffoldTap,
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Sign Up',
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 30,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Gaps.ver24,
              const Text(
                'You\'ll need a password',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                ),
              ),
              Gaps.ver10,
              const Text(
                'Make sure it\'s 8 characters or more',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: Colors.black54,
                ),
              ),
              Gaps.ver32,
              TextField(
                controller: _passwordController,
                onEditingComplete: _onNextTap,
                obscureText: _isObscureText,
                decoration: InputDecoration(
                  suffix: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      GestureDetector(
                        onTap: _onClearTap,
                        child: FaIcon(
                          FontAwesomeIcons.solidCircleXmark,
                          color: Colors.grey.shade400,
                          size: 20,
                        ),
                      ),
                      Gaps.hor10,
                      GestureDetector(
                        onTap: _onViewToggleTap,
                        child: FaIcon(
                          _isObscureText
                              ? FontAwesomeIcons.solidEye
                              : FontAwesomeIcons.solidEyeSlash,
                          color: _isObscureText
                              ? Theme.of(context).primaryColor
                              : Colors.grey.shade400,
                          size: 20,
                        ),
                      ),
                    ],
                  ),
                  hintText: 'password',
//                  errorText: _isPasswordValid(),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.grey.shade400,
                    ),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.grey.shade400,
                    ),
                  ),
                ),
                cursorColor: Theme.of(context).primaryColor,
              ),
              Gaps.ver10,
              const Text(
                'Your password must have:',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Gaps.ver10,
              Row(
                children: [
                  FaIcon(
                    FontAwesomeIcons.circleCheck,
                    size: 20,
                    color: _isPasswordValid()
                        ? Colors.green
                        : Colors.grey.shade400,
                  ),
                  Gaps.hor10,
                  const Text(
                    'over 8 characters',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.black54,
                    ),
                  ),
                ],
              ),
              Gaps.ver28,
              GestureDetector(
                onTap: _onNextTap, //context를 넘겨주지 않을 때, 간략하게 표현.
                child: FormButton(
                  disabled: !_isPasswordValid(),
                  buttonText: 'Next',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
