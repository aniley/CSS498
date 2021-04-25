import 'package:flutter/material.dart';
import 'package:recipeapplication/utils/screen_size.dart';
import 'package:recipeapplication/utils/styles.dart';

class RegisterScreen extends StatefulWidget {
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final TextEditingController _email = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool hidden = true;
  final TextEditingController _pass = TextEditingController();
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Container(
        height: height,
        width: width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 9.85 * SizeConfig.heightMultiplier,
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
                    'Sign Up',
                    style: Heading,
                  ),
                  // SizedBox(
                  //   height: 1.84 * SizeConfig.heightMultiplier,
                  // ),
                  // Text(
                  //   'Hi there! Nice to see you again',
                  //   style: MedHeading,
                  // ),
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
                              if (!_formKey.currentState.validate()) {
                                return false;
                              }
                            },
                            child: Text(
                              'Continue',
                              style: GreyHeading.copyWith(color: Colors.white),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 4.84 * SizeConfig.heightMultiplier,
                  ),
                  Center(
                    child: InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Have an acccount?',
                            style: GreyHeading.copyWith(
                              fontSize: 2 * SizeConfig.textMultiplier,
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            'Sign In',
                            style: GreyHeading.copyWith(
                              color: primaryColor,
                              fontSize: 2 * SizeConfig.textMultiplier,
                            ),
                          ),
                        ],
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
}
