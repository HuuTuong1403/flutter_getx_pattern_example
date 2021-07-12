import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_getx_pattern/src/app/modules/authentication/signup/signup_controller.dart';
import 'package:get/get.dart';

class SignUpPage extends StatefulWidget {
  SignUpPage({Key? key}) : super(key: key);

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final _formKey = GlobalKey<FormState>();

  FocusNode _usernameFocus = FocusNode();
  FocusNode _passwordFocus = FocusNode();
  FocusNode _emailFocus = FocusNode();
  FocusNode _phoneFocus = FocusNode();

  TextEditingController _usernameController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _phoneController = TextEditingController();

  bool visiblePass = true;
  String _username = '';
  String _password = '';
  String _email = '';
  String _phone = '';

  @override
  void dispose() {
    _usernameFocus.dispose();
    _passwordFocus.dispose();
    _emailFocus.dispose();
    _phoneFocus.dispose();

    _usernameController.dispose();
    _passwordController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SignUpController>(
      init: SignUpController(),
      builder: (_) => GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(32.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Welcome to Blog Club',
                  style: TextStyle(
                    fontSize: 24,
                    color: Theme.of(context).textTheme.headline1!.color,
                  ),
                ),
                const SizedBox(height: 12),
                Text(
                  'Sign up with information',
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
                        key: ValueKey('Username'),
                        focusNode: _usernameFocus,
                        controller: _usernameController,
                        validator: (value) {
                          if ('$value'.isEmpty) {
                            return 'Please enter your username';
                          }
                          return null;
                        },
                        textInputAction: TextInputAction.next,
                        onEditingComplete: () {
                          FocusScope.of(context).requestFocus(_passwordFocus);
                        },
                        style: TextStyle(
                          color: Theme.of(context).textTheme.headline1!.color,
                          fontSize: 16,
                        ),
                        decoration: InputDecoration(
                          labelText: 'Username',
                          labelStyle: TextStyle(
                            fontSize: 14,
                            color: Theme.of(context).textTheme.bodyText1!.color,
                          ),
                        ),
                        onSaved: (value) {
                          _username = '$value';
                        },
                      ),
                      const SizedBox(height: 10),
                      TextFormField(
                        key: ValueKey('Password'),
                        focusNode: _passwordFocus,
                        controller: _passwordController,
                        validator: (value) {
                          if ('$value'.isEmpty || '$value'.length < 6) {
                            return 'Password required and password has length > 6';
                          }
                          return null;
                        },
                        textInputAction: TextInputAction.next,
                        onEditingComplete: () {
                          FocusScope.of(context).requestFocus(_emailFocus);
                        },
                        obscureText: visiblePass,
                        style: TextStyle(
                          color: Theme.of(context).textTheme.headline1!.color,
                          fontSize: 16,
                          letterSpacing: visiblePass ? 2 : 0,
                        ),
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
                        onSaved: (value) {
                          _password = '$value';
                        },
                      ),
                      const SizedBox(height: 10),
                      TextFormField(
                        key: ValueKey('Email'),
                        focusNode: _emailFocus,
                        controller: _emailController,
                        validator: (value) {
                          if ('$value'.isEmpty || !'$value'.contains('@')) {
                            return 'Email not empty and email not correct format';
                          }
                          return null;
                        },
                        textInputAction: TextInputAction.next,
                        keyboardType: TextInputType.emailAddress,
                        onEditingComplete: () {
                          FocusScope.of(context).requestFocus(_phoneFocus);
                        },
                        style: TextStyle(
                          color: Theme.of(context).textTheme.headline1!.color,
                          fontSize: 16,
                        ),
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
                      ),
                      TextFormField(
                        key: ValueKey('Phone'),
                        focusNode: _phoneFocus,
                        controller: _phoneController,
                        validator: (value) {
                          if ('$value'.isEmpty || '$value'.length < 10) {
                            return 'Please enter valid phone';
                          }
                          return null;
                        },
                        textInputAction: TextInputAction.done,
                        keyboardType: TextInputType.emailAddress,
                        onEditingComplete: () {
                          final isValid = _formKey.currentState!.validate();
                          if (isValid) {
                            _formKey.currentState!.save();
                            _.signup(_email, _password, _username, _phone);
                          }
                        },
                        style: TextStyle(
                          color: Theme.of(context).textTheme.headline1!.color,
                          fontSize: 16,
                        ),
                        decoration: InputDecoration(
                          labelText: 'Phone number',
                          labelStyle: TextStyle(
                            fontSize: 14,
                            color: Theme.of(context).textTheme.bodyText1!.color,
                          ),
                        ),
                        onSaved: (value) {
                          _phone = '$value';
                        },
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
                                var check = await _.signup(
                                    _email, _password, _username, _phone);
                                if (check) {
                                  _usernameController.clear();
                                  _passwordController.clear();
                                  _phoneController.clear();
                                  _emailController.clear();
                                  FocusScope.of(context).unfocus();
                                }
                              }
                            },
                            child: Obx(
                              () => _.isLoading.value
                                  ? CircularProgressIndicator(
                                      backgroundColor: Colors.transparent,
                                      color: Colors.white,
                                    )
                                  : Text(
                                      'SIGNUP',
                                      style: TextStyle(
                                          fontSize: 16, color: Colors.white),
                                    ),
                            )),
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
