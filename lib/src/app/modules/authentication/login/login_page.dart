import 'package:flutter/material.dart';
import 'package:flutter_getx_pattern/src/app/modules/authentication/login/login_controller.dart';
import 'package:flutter_getx_pattern/src/app/modules/authentication/login/widgets/icon_login.dart';
import 'package:flutter_getx_pattern/src/routes/app_pages.dart';
import 'package:get/get.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool visiblePass = true;

  final _formKey = GlobalKey<FormState>();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  FocusNode _emailFocus = FocusNode();
  FocusNode _passFocus = FocusNode();
  String _email = '';
  String _password = '';
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _emailFocus.dispose();
    _passFocus.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LogInPageController>(
      init: LogInPageController(),
      builder: (_) => GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(32),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Welcome back',
                  style: TextStyle(
                    fontSize: 24,
                    color: Theme.of(context).textTheme.headline1!.color,
                  ),
                ),
                const SizedBox(height: 12),
                Text(
                  'Sign in with your account',
                  style: TextStyle(
                    fontSize: 14,
                    color: Theme.of(context).textTheme.bodyText1!.color,
                  ),
                ),
                const SizedBox(height: 25),
                Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      TextFormField(
                        key: ValueKey('Email'),
                        focusNode: _emailFocus,
                        controller: _emailController,
                        style: TextStyle(
                          color: Theme.of(context).textTheme.headline1!.color,
                          fontSize: 16,
                        ),
                        validator: (value) => _.validateEmail(value),
                        keyboardType: TextInputType.emailAddress,
                        textInputAction: TextInputAction.next,
                        onEditingComplete: () {
                          FocusScope.of(context).requestFocus(_passFocus);
                        },
                        decoration: InputDecoration(
                          labelText: 'Email',
                          labelStyle: TextStyle(
                            fontSize: 14,
                            color: Theme.of(context).textTheme.bodyText1!.color,
                          ),
                        ),
                        onSaved: (value) {
                          _email = '$value';
                        },
                        onChanged: (value) {
                          _email = '$value';
                        },
                      ),
                      const SizedBox(height: 10),
                      TextFormField(
                        key: ValueKey('Password'),
                        focusNode: _passFocus,
                        controller: _passwordController,
                        style: TextStyle(
                          color: Theme.of(context).textTheme.headline1!.color,
                          fontSize: 16,
                          letterSpacing: visiblePass ? 2 : 0,
                        ),
                        validator: (value) => _.validatePassword(value!),
                        textInputAction: TextInputAction.done,
                        onEditingComplete: () async {
                          final isValid = _formKey.currentState!.validate();
                          if (isValid) {
                            var check = await _.login(_email, _password);
                            if (check) {
                              _emailController.clear();
                              _passwordController.clear();
                              Get.offAndToNamed(Routes.NAVIGATION);
                            }
                          }
                        },
                        obscureText: visiblePass,
                        decoration: InputDecoration(
                          labelText: 'Password',
                          labelStyle: TextStyle(
                            fontSize: 14,
                            color: Theme.of(context).textTheme.bodyText1!.color,
                          ),
                          suffix: Material(
                            color: Colors.transparent,
                            child: InkWell(
                              onTap: () {
                                setState(() {
                                  visiblePass = !visiblePass;
                                });
                              },
                              splashColor: Colors.grey.shade300,
                              child: Text(
                                'Show',
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Theme.of(context)
                                      .textTheme
                                      .bodyText2!
                                      .color,
                                ),
                              ),
                            ),
                          ),
                        ),
                        onChanged: (value) {
                          _password = '$value';
                        },
                        onSaved: (value) {
                          _password = '$value';
                        },
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 30),
                Container(
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height * 0.095,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    onPressed: () async {
                      final isValid = _formKey.currentState!.validate();
                      if (isValid) {
                        _formKey.currentState!.save();
                        var check = await _.login(_email, _password);
                        if (check) {
                          _emailController.clear();
                          _passwordController.clear();
                          Get.offAndToNamed(Routes.NAVIGATION);
                        }
                      }
                    },
                    child: Obx(
                      () => _.isLoading.value
                          ? CircularProgressIndicator(
                              backgroundColor: Colors.transparent,
                              color: Colors.white)
                          : Text(
                              'LOGIN',
                              style:
                                  TextStyle(fontSize: 16, color: Colors.white),
                            ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Forgot your password? ',
                      style: TextStyle(
                        color: Theme.of(context).textTheme.bodyText1!.color,
                        fontSize: 14,
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        print('reset');
                      },
                      child: Text(
                        'Reset here',
                        style: TextStyle(
                          color: Theme.of(context).textTheme.bodyText2!.color,
                          fontSize: 14,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Container(
                  alignment: Alignment.center,
                  child: Text(
                    'OR SIGN IN WITH',
                    style: TextStyle(
                      fontSize: 12,
                      color: Theme.of(context).textTheme.bodyText1!.color,
                    ),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      buildIcon(
                        context: context,
                        iconSvg: 'assets/svg/google_icon.svg',
                        fct: () {
                          _.loginWithGoogle();
                        },
                      ),
                      buildIcon(
                        context: context,
                        iconSvg: 'assets/svg/facebook_icon.svg',
                        fct: () {
                          _.logInWithFacebook();
                        },
                      ),
                      buildIcon(
                        context: context,
                        iconSvg: 'assets/svg/twitter_icon.svg',
                        fct: () {
                          print('twitter');
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
