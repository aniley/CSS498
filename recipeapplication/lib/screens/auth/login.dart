import 'package:flutter/material.dart';
import 'package:recipeapplication/flutterServices/authenticate.dart';
import 'package:recipeapplication/screens/auth/sign_up.dart';
import 'package:recipeapplication/utils/screen_size.dart';
import 'package:recipeapplication/utils/styles.dart';
import 'package:recipeapplication/homePage.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final AuthentificationFuncs _auth = AuthentificationFuncs();
  final TextEditingController _email = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool hidden = true;
  final TextEditingController _pass = TextEditingController();
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        height: height,
        width: width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 9.85 * SizeConfig.heightMultiplier,
            ),
            Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Recipe Applications',
                    style: GreyHeading,
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    height: 2.46 * SizeConfig.heightMultiplier,
                  ),
                  Image.asset(
                    'images/logo.png',
                    height: 18.47 * SizeConfig.heightMultiplier,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 3.69 * SizeConfig.heightMultiplier,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 50),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Sign In',
                    style: Heading,
                  ),
                  SizedBox(
                    height: 1.84 * SizeConfig.heightMultiplier,
                  ),
                  Text(
                    'Hi there! Nice to see you again',
                    style: MedHeading,
                  ),
                  SizedBox(
                    height: 2.46 * SizeConfig.heightMultiplier,
                  ),
                  Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Email',
                          style: FieldHeading.copyWith(
                            color: primaryColor,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        TextFormField(
                          controller: _email,
                          keyboardType: TextInputType.emailAddress,
                          autofillHints: [
                            AutofillHints.email,
                          ],
                          decoration: InputDecoration(
                            // prefixIcon: Icon(Icons.email),
                            hintText: 'example@email.com',
                            hintStyle: MedHeading.copyWith(
                              fontWeight: FontWeight.w600,
                              // color: Colors.grey.withOpacity(0.5),
                            ),
                          ),
                          validator: (String value) {
                            if (value == '') {
                              return 'Field required';
                            }
                            if (!RegExp(
                              r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+",
                            ).hasMatch(value)) {
                              return 'Wrong email format!';
                            }
                            return null;
                          },
                        ),
                        SizedBox(
                          height: 40,
                        ),
                        Text(
                          'Password',
                          style: FieldHeading.copyWith(
                            color: primaryColor,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        TextFormField(
                          controller: _pass,
                          obscureText: hidden,
                          obscuringCharacter: "*",
                          decoration: InputDecoration(
                            // prefixIcon: Icon(Icons.lock),
                            hintStyle: MedHeading,
                            hintText: '*******',
                            suffixIcon: IconButton(
                              onPressed: () {
                                setState(() {
                                  hidden = !hidden;
                                });
                              },
                              icon: Icon(
                                hidden
                                    ? Icons.visibility_off
                                    : Icons.visibility,
                              ),
                            ),
                          ),
                          validator: (value) {
                            if (value == '') {
                              return 'Field required';
                            }
                            if (value.length < 8) {
                              return 'Password should be at least 8 characters';
                            }
                            return null;
                          },
                        ),
                        SizedBox(
                          height: 40,
                        ),
                        Material(
                          color: primaryColor,
                          elevation: 1,
                          borderRadius: BorderRadius.circular(
                            5,
                          ),
                          child: MaterialButton(
                            onPressed: () async {
                              if (_formKey.currentState.validate()) {
                                // signIn();
                                // _auth.createMember()
                                 User user = await _auth.logIn(_email.text, _pass.text);
                                  if (user == null) {
                                    print("Either email or password is incorrect");
                                  } else {
                                    print(user.toString());
                                    _email.clear();
                                    _pass.clear();
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(builder: (context) => Recipe()),
                                    );
                                  }
                                return true;
                              } else
                                return false;
                            },
                            child: Text(
                              'Sign In',
                              style: GreyHeading.copyWith(color: Colors.white),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 1.84 * SizeConfig.heightMultiplier,
                  ),
                  Center(
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => RegisterScreen(),
                          ),
                        );
                      },
                      child: Text(
                        'Sign Up',
                        style: GreyHeading.copyWith(
                          color: primaryColor,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  // void signIn() async {
  //   dynamic user = await auth.logIn(_email.text, _pass.text);
  //   if (user == null) {
  //     print("Either email or password is incorrect");
  //   } else {
  //     print(user.toString());
  //     _email.clear();
  //     _pass.clear();
  //     Navigator.push(
  //       context,
  //       MaterialPageRoute(builder: (context) => Recipe()),
  //     );
  //   }
  // }
}
