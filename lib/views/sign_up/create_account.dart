import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tiktokclone/constants/gaps.dart';
import 'package:tiktokclone/constants/svg_logo.dart';
import 'package:tiktokclone/views/sign_up/shared/form_button.dart';
import 'package:tiktokclone/views/sign_up/sent_code.dart';

class CreateAccount extends StatefulWidget {
  const CreateAccount({super.key});

  @override
  State<CreateAccount> createState() => _CreateAccountState();
}

class _CreateAccountState extends State<CreateAccount> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _birthdayController = TextEditingController();

  late final FocusNode _birthdayFocusNode;

  String _name = '';
  String _email = '';

  //final DateTime _maxDate = DateTime.now(); // 오늘 날짜까지 설정가능
  final DateTime _initialDate = DateTime.now().subtract(
    const Duration(
      days: 365 * 12,
    ),
  ); // 12년전 오늘 날짜를 기준일로 함.

  void _onScaffoldTap() {
    FocusScope.of(context).unfocus();
  }

  String? _checkRegExp() {
    final regExp = RegExp(
        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");

    if (!regExp.hasMatch(_email)) {
      return '이메일 형식이 아닙니다.';
    }
    return null;
  }

  bool _isEmailValid() {
    if (_email.isEmpty) {
      return false;
    }

    if (_checkRegExp() != null) {
      return false;
    }

    return true;
  }

  void _onNameClear() {
    _nameController.clear();
  }

  void _onEmailClear() {
    _emailController.clear();
  }

  void _onBirthdayTap() {
    FocusScope.of(context).requestFocus(_birthdayFocusNode);
  }

  void _setTextFieldDate(DateTime date) {
    var textDate = date.toString().split(' ').first;
    _birthdayController.value = TextEditingValue(text: textDate);
  }

  void _onNextTap() {
    print(_birthdayController.value);
    if (_name.isEmpty) return;

    if (!_isEmailValid()) return;

    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => const SentCode(),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    // super initstate를 처음에

    _nameController.addListener(() {
      setState(() {
        _name = _nameController.text;
      });
    });

    _emailController.addListener(() {
      setState(() {
        _email = _emailController.text;
      });
    });

    _birthdayFocusNode = FocusNode();

    //_setTextFieldDate(_initialDate);
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _birthdayController.dispose();
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
                  'Create your account',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Gaps.ver32,
                TextField(
                  controller: _nameController,
                  onEditingComplete: _onNextTap,
                  decoration: InputDecoration(
                    suffix: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        GestureDetector(
                          onTap: _onNameClear,
                          child: FaIcon(
                            FontAwesomeIcons.solidCircleXmark,
                            color: Colors.grey.shade400,
                            size: 20,
                          ),
                        ),
                        Gaps.hor10,
                        FaIcon(
                          FontAwesomeIcons.circleCheck,
                          color: _name.isNotEmpty
                              ? Colors.green
                              : Colors.grey.shade400,
                          size: 20,
                        ),
                      ],
                    ),
                    hintText: 'name',
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
                Gaps.ver32,
                TextField(
                  controller: _emailController,
                  keyboardType: TextInputType.emailAddress,
                  onEditingComplete: _onNextTap,
                  decoration: InputDecoration(
                    hintText: 'email',
                    labelText: 'email',
                    errorText: _checkRegExp(),
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
                    suffix: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        GestureDetector(
                          onTap: _onEmailClear,
                          child: FaIcon(
                            FontAwesomeIcons.solidCircleXmark,
                            color: Colors.grey.shade400,
                            size: 20,
                          ),
                        ),
                        Gaps.hor10,
                        FaIcon(
                          FontAwesomeIcons.circleCheck,
                          color: _isEmailValid()
                              ? Colors.green
                              : Colors.grey.shade400,
                          size: 20,
                        ),
                      ],
                    ),
                  ),
                  cursorColor: Theme.of(context).primaryColor,
                ),
                Gaps.ver32,
                TextField(
                  onTap: _onBirthdayTap,
                  readOnly: true,
                  controller: _birthdayController,
                  focusNode: _birthdayFocusNode,
                  decoration: InputDecoration(
                    hintText: 'Date of birth',
                    labelText: 'Date of birth',
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
                Gaps.ver28,
                GestureDetector(
                  onTap: _onNextTap, //context를 넘겨주지 않을 때, 간략하게 표현.
                  child: FormButton(
                    disabled: _name.isEmpty || !_isEmailValid(),
                    buttonText: 'Next',
                  ),
                ),
              ],
            ),
          ),
        ),
        bottomNavigationBar: BottomAppBar(
          height: _birthdayFocusNode.hasFocus ? 300 : 0,
          child: Visibility(
            visible: _birthdayFocusNode.hasFocus,
            child: CupertinoDatePicker(
              maximumDate: _initialDate,
              initialDateTime: _initialDate,
              mode: CupertinoDatePickerMode.date,
              dateOrder: DatePickerDateOrder.ymd,
              onDateTimeChanged: _setTextFieldDate,
            ),
          ),
        ),
      ),
    );
  }
}
