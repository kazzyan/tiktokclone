import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tiktokclone/constants/gaps.dart';
import 'package:tiktokclone/constants/svg_logo.dart';
import 'package:tiktokclone/views/sign_up/shared/form_button.dart';
import 'package:tiktokclone/views/sign_up/make_password.dart';

class SentCode extends StatefulWidget {
  const SentCode({super.key});

  @override
  State<SentCode> createState() => _SentCodeState();
}

class _SentCodeState extends State<SentCode> {
  List<String> codes = ["", "", "", "", "", ""];
  List<FocusNode> focusNodes = List.generate(6, (index) => FocusNode());

  void _onChanged(String value, int index) {
    if (value.isNotEmpty && index < 5) {
      FocusScope.of(context).requestFocus(focusNodes[index + 1]);
    }
    setState(() {
      codes[index] = value;
    });
  }

  void _onBackspacePress(int index) {
    if (codes[index].isEmpty && index > 0) {
      FocusScope.of(context).requestFocus(focusNodes[index - 1]);
    }
  }

  void _onScaffoldTap() {
    FocusScope.of(context).unfocus();
  }

  void _onNextTap() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => const MakePassword(),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    // super initstate를 처음에
    for (int i = 0; i < 6; i++) {
      focusNodes[i].addListener(() {
        setState(() {});
      });
    }

    //_setTextFieldDate(_initialDate);
  }

  @override
  void dispose() {
    //super dispose를 제일 마지막에
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _onScaffoldTap,
      child: Scaffold(
        appBar: AppBar(
          leading: GestureDetector(
            onTap: () => Navigator.of(context).pop(),
            child: const Center(
              child: Text(
                'Cancel',
                style: TextStyle(
                  fontSize: 14,
                ),
              ),
            ),
          ),
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
                  'We sent you a code',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Gaps.ver10,
                const Text(
                  'Enter it below to verify\nkazzyan@hotmail.com',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: Colors.black54,
                  ),
                ),
                Gaps.ver32,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: List.generate(
                    6,
                    (index) {
                      return SizedBox(
                        width: 40,
                        child: TextField(
                          focusNode: focusNodes[index],
                          textAlign: TextAlign.center,
                          keyboardType: TextInputType.number,
                          maxLength: 1,
                          decoration: InputDecoration(
                            counterText: "",
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: focusNodes[index].hasFocus
                                    ? Colors.blue
                                    : Colors.grey,
                              ),
                            ),
                          ),
                          onChanged: (value) => _onChanged(value, index),
                          onSubmitted: (value) => _onChanged(value, index),
                          onTap: () {
                            if (index > 0 && codes[index - 1].isEmpty) {
                              FocusScope.of(context)
                                  .requestFocus(focusNodes[index - 1]);
                            }
                          },
                          onEditingComplete: () => _onBackspacePress(index),
                        ),
                      );
                    },
                  ),
                ),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    if (codes.every((code) => code.isNotEmpty))
                      const Icon(
                        Icons.check_circle,
                        color: Colors.green,
                        size: 50,
                      ),
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
              disabled: codes.last.isEmpty,
              buttonText: 'Next',
            ),
          ),
        ),
      ),
    );
  }
}
