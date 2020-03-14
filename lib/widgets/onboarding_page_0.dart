import 'package:flutter/material.dart';
import 'package:onboarding/constants/text_styles.dart';

class OnboardingPage0 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(40.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Center(
            child: Image(
              image: AssetImage('assets/images/onboarding_0.png'),
              height: 300.0,
              width: 300.0,
            ),
          ),
          SizedBox(height: 30.0),
          Text(
            'Connect People\naround the world',
            style: kTitleStyle,
          ),
          SizedBox(height: 15.0),
          Text(
            'Anim labore pariatur deserunt culpa veniam. Ex ipsum sunt occaecat aliquip irure enim ut aliqua qui incididunt non adipisicing aute.',
            style: kSubtitleStyle,
          ),
        ],
      ),
    );
  }
}
