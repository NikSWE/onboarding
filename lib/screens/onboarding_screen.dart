import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:onboarding/constants/gradient.dart';
import 'package:onboarding/constants/text_styles.dart';
import 'package:onboarding/screens/home_screen.dart';
import 'package:onboarding/widgets/indicator.dart';
import 'package:onboarding/widgets/onboarding_page_0.dart';
import 'package:onboarding/widgets/onboarding_page_1.dart';
import 'package:onboarding/widgets/onboarding_page_2.dart';

class Onboarding extends StatefulWidget {
  @override
  _OnboardingState createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding> {
  final PageController _pageController = PageController(initialPage: 0);
  int _currentPage = 0;
  final int _numPages = 3;

  List<Widget> _buildPageIndicators() {
    List<Widget> widgets = [];

    for (int i = 0; i < _numPages; i++) {
      widgets.add(i == _currentPage ? Indicator(true) : Indicator(false));
    }

    return widgets;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light,
        child: Container(
          decoration: BoxDecoration(
            gradient: kLinearGradient,
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 40.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Container(
                  alignment: Alignment.centerRight,
                  child: FlatButton(
                    onPressed: _currentPage == 0
                        ? () {
                            Navigator.of(context).pushReplacement(
                              MaterialPageRoute(
                                builder: (BuildContext context) => Home(),
                              ),
                            );
                          }
                        : null,
                    splashColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    child: AnimatedOpacity(
                      opacity: _currentPage == 0 ? 1.0 : 0.0,
                      duration: Duration(milliseconds: 200),
                      child: Text(
                        'Skip',
                        style: kButtonStyle,
                      ),
                    ),
                  ),
                ),
                Container(
                  height: 600.0,
                  child: PageView(
                    physics: ClampingScrollPhysics(),
                    controller: _pageController,
                    onPageChanged: (int page) {
                      setState(() {
                        _currentPage = page;
                      });
                    },
                    children: <Widget>[
                      OnboardingPage0(),
                      OnboardingPage1(),
                      OnboardingPage2(),
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: _buildPageIndicators(),
                ),
                Expanded(
                  child: Align(
                    alignment: Alignment.bottomRight,
                    child: AnimatedOpacity(
                      opacity: _currentPage != _numPages - 1 ? 1.0 : 0.0,
                      duration: Duration(milliseconds: 300),
                      child: FlatButton(
                        onPressed: _currentPage != _numPages - 1
                            ? () {
                                _pageController.nextPage(
                                  duration: Duration(milliseconds: 500),
                                  curve: Curves.ease,
                                );
                              }
                            : null,
                        splashColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            Text(
                              'Next',
                              style: kButtonStyle,
                            ),
                            SizedBox(width: 10.0),
                            Icon(
                              Icons.arrow_forward,
                              size: 30.0,
                              color: Colors.white,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
      bottomSheet: _currentPage == _numPages - 1
          ? GestureDetector(
              onTap: () {
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                    builder: (BuildContext context) => Home(),
                  ),
                );
              },
              child: Container(
                color: Colors.white,
                height: 100.0,
                width: double.infinity,
                child: Center(
                  child: Text(
                    'Get Started',
                    style: kBottomSheetTextStyle,
                  ),
                ),
              ),
            )
          : null,
    );
  }
}
