import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:shopp_app/app/pages/welcome_page/widgets/animationColor.dart';

class ColorizeAnimationWidget extends StatelessWidget {
  ColorizeAnimationWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedTextKit(
      repeatForever: true,
      animatedTexts: [
        ColorizeAnimatedText(
          'WELCOME',
          textStyle: TextStyle(
            fontSize: 45,
            fontWeight: FontWeight.bold,
            fontFamily: 'Acme',
          ),
          colors: AnimationColorListUtil.textColor,
        ),
        ColorizeAnimatedText(
          '',
          textStyle: TextStyle(
            fontSize: 45,
            fontWeight: FontWeight.bold,
            fontFamily: 'Acme',
          ),
          colors: AnimationColorListUtil.textColor,
        ),
      ],
      isRepeatingAnimation: true,
    );
  }
}
