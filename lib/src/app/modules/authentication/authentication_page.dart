import 'package:flutter/material.dart';
import 'package:flutter_getx_pattern/src/app/modules/authentication/login/login_page.dart';
import 'package:flutter_getx_pattern/src/app/modules/authentication/signup/signup_page.dart';
import 'package:flutter_getx_pattern/src/core/values/colors.dart';

class AuthenticationPaeg extends StatefulWidget {
  AuthenticationPaeg({Key? key}) : super(key: key);

  @override
  _AuthenticationPaegState createState() => _AuthenticationPaegState();
}

class _AuthenticationPaegState extends State<AuthenticationPaeg> {
  int _formIndex = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: Container(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 80),
            Container(
              child: Image.asset('assets/images/logo.png'),
            ),
            SizedBox(
              height: 20,
            ),
            Expanded(
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(40),
                    topRight: Radius.circular(40),
                  ),
                ),
                child: Column(children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 8,
                      horizontal: 40,
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        TextButton(
                          child: Text(
                            'LOGIN',
                            style: TextStyle(
                              color:
                                  _formIndex == 1 ? Colors.white : inactiveTab,
                              fontSize: 18,
                            ),
                          ),
                          onPressed: () {
                            setState(() {
                              _formIndex = 1;
                            });
                          },
                        ),
                        TextButton(
                          child: Text(
                            'SIGNUP',
                            style: TextStyle(
                              color:
                                  _formIndex == 1 ? inactiveTab : Colors.white,
                              fontSize: 18,
                            ),
                          ),
                          onPressed: () {
                            setState(() {
                              _formIndex = 2;
                            });
                          },
                        )
                      ],
                    ),
                  ),
                  Expanded(
                    child: Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(40),
                          topRight: Radius.circular(40),
                        ),
                      ),
                      child: _formIndex == 1 ? LoginPage() : SignUpPage(),
                    ),
                  ),
                ]),
              ),
            ),
          ],
        ),
      ),
    );
  }
}