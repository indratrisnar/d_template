library d_template;

import 'package:flutter/material.dart';

/// Template Login 1\
/// `Not Page`\
/// \
/// Basic Login Input\
/// Email & Password
class DTLogin extends StatelessWidget {
  /// Template Login 1\
  /// `Not Page`\
  /// \
  /// Basic Login Input\
  /// Email & Password
  const DTLogin({
    super.key,
    required this.edtEmail,
    required this.edtPassword,
    required this.colorInputBackground,
    this.inputHintEmail = 'Email',
    this.inputHintPassword = 'Password',
    this.btnLoginName = 'Login',
    this.btnLoginColor = Colors.blue,
    this.inputColorEmailIcon = Colors.black54,
    this.inputColorPasswordIcon = Colors.black54,
    this.inputColorVisibilityIcon = Colors.black54,
    required this.btnLoginOnTap,
    this.btnLoginAlign = 'expand',
    this.btnLoginWidth,
    this.inputBorderRadius,
    this.btnLoginBorderRadius,
    this.inputStyleEmail = const TextStyle(height: 1),
    this.inputStylePassword = const TextStyle(height: 1),
  });

  /// `TextEditingController` for Email
  final TextEditingController edtEmail;

  /// `hint` for Email\
  /// Default: Email
  final String inputHintEmail;

  /// `color` for Email Icon\
  /// Default: Colors.black54
  final Color inputColorEmailIcon;

  /// `style` for Input Email Text\
  /// Default: `TextStyle(height: 1)`
  final TextStyle inputStyleEmail;

  /// `TextEditingController` for Password
  final TextEditingController edtPassword;

  /// `hint` for Password\
  /// Default: Password
  final String inputHintPassword;

  /// `color` for Password Icon\
  /// Default: Colors.black54
  final Color inputColorPasswordIcon;

  /// `style` for Input Email Text\
  /// Default: `TextStyle(height: 1)`
  final TextStyle inputStylePassword;

  /// `color` for Visibility Icon\
  /// Default: Colors.black54
  final Color inputColorVisibilityIcon;

  /// `color` for background input
  final Color colorInputBackground;

  /// `text` for button login\
  /// Default: Login
  final String btnLoginName;

  /// `color` for Email Icon\
  /// Default: Colors.blue
  final Color btnLoginColor;

  /// `void function` for login\
  final Function btnLoginOnTap;

  /// `position in row` for button login\
  /// Default: expand\
  /// \
  /// Option: start, center, end, expand
  final String btnLoginAlign;

  /// `width` for button login\
  /// work if [btnLoginAlign] not 'expand'
  final double? btnLoginWidth;

  /// input radius\
  /// Default: BorderRadius.circular(10)
  final BorderRadiusGeometry? inputBorderRadius;

  /// button login radius\
  /// Default: BorderRadius.circular(10)
  final BorderRadiusGeometry? btnLoginBorderRadius;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: inputBorderRadius ?? BorderRadius.circular(10),
            color: colorInputBackground,
          ),
          padding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 8,
          ),
          child: Row(
            children: [
              Icon(
                Icons.email,
                color: inputColorEmailIcon,
              ),
              const SizedBox(width: 16),
              Expanded(
                child: TextField(
                  controller: edtEmail,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    isDense: true,
                    hintText: inputHintEmail,
                  ),
                  style: inputStyleEmail,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 16),
        _InputPassword(
          edtPassword: edtPassword,
          hintPassword: inputHintPassword,
          colorInputBackground: colorInputBackground,
          inputColorPasswordIcon: inputColorPasswordIcon,
          inputColorVisibilityIcon: inputColorVisibilityIcon,
          borderRadius: inputBorderRadius ?? BorderRadius.circular(10),
          inputStylePassword: inputStylePassword,
        ),
        const SizedBox(height: 16),
        Align(
          alignment: getAlign(btnLoginAlign),
          child: SizedBox(
            width: btnLoginAlign == 'expand' ? double.infinity : btnLoginWidth,
            child: ElevatedButton(
              onPressed: () => btnLoginOnTap(),
              style: ButtonStyle(
                backgroundColor: MaterialStatePropertyAll(btnLoginColor),
                shape: MaterialStatePropertyAll(
                  RoundedRectangleBorder(
                    borderRadius:
                        btnLoginBorderRadius ?? BorderRadius.circular(10),
                  ),
                ),
                padding: const MaterialStatePropertyAll(
                  EdgeInsets.symmetric(
                    vertical: 18,
                  ),
                ),
              ),
              child: Text(
                btnLoginName,
                style: const TextStyle(height: 1),
              ),
            ),
          ),
        ),
      ],
    );
  }

  AlignmentGeometry getAlign(String alignText) {
    switch (alignText) {
      case 'start':
        return Alignment.centerLeft;
      case 'center':
        return Alignment.center;
      case 'end':
        return Alignment.centerRight;
      default:
        return Alignment.center;
    }
  }
}

class _InputPassword extends StatefulWidget {
  const _InputPassword({
    required this.edtPassword,
    required this.hintPassword,
    required this.colorInputBackground,
    required this.inputColorPasswordIcon,
    required this.inputColorVisibilityIcon,
    required this.borderRadius,
    required this.inputStylePassword,
  });
  final TextEditingController edtPassword;
  final String hintPassword;
  final Color colorInputBackground;
  final Color inputColorPasswordIcon;
  final TextStyle inputStylePassword;
  final Color inputColorVisibilityIcon;
  final BorderRadiusGeometry borderRadius;

  @override
  State<_InputPassword> createState() => __InputPasswordState();
}

class __InputPasswordState extends State<_InputPassword> {
  bool hidePassword = true;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: widget.borderRadius,
        color: widget.colorInputBackground,
      ),
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 8,
      ),
      child: Row(
        children: [
          Icon(
            Icons.key,
            color: widget.inputColorPasswordIcon,
          ),
          const SizedBox(width: 16),
          Expanded(
            child: TextField(
              controller: widget.edtPassword,
              obscureText: hidePassword,
              decoration: InputDecoration(
                border: InputBorder.none,
                isDense: true,
                hintText: widget.hintPassword,
              ),
              style: const TextStyle(height: 1),
            ),
          ),
          const SizedBox(width: 16),
          InkWell(
            borderRadius: BorderRadius.circular(30),
            onTap: () {
              hidePassword = !hidePassword;
              setState(() {});
            },
            child: Icon(
              hidePassword ? Icons.visibility_off : Icons.visibility,
              color: widget.inputColorVisibilityIcon,
            ),
          ),
        ],
      ),
    );
  }
}
