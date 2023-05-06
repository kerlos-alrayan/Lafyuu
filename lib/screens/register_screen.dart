import 'package:ecommerce_app_sat26/components/input_text.dart';
import 'package:ecommerce_app_sat26/screens/home_screen.dart';
import 'package:ecommerce_app_sat26/screens/login_screen.dart';
import 'package:flutter/material.dart';


class RegisterScreen extends StatefulWidget {
  RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  bool isPasswordObscure1 = true;
  bool isPasswordObscure2 = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Form(
          key: formKey,
          child: Container(
            width: MediaQuery.of(context).size.width,
            child: Center(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Image
                    Image.asset(
                      'assets/images/Vector.png',
                      width: 72,
                      height: 72,
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    // Text Welcome
                    Text(
                      'Let${"'"}s Get Started',
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    // Text Sign In
                    Text(
                      'create a new account',
                      style: TextStyle(
                        color: Colors.grey,
                        fontFamily: 'Poppins',
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    // User Name
                    InputText(
                      keyboardType: TextInputType.text,
                      textInputAction: TextInputAction.next,
                      text: 'Full-Name',
                      icon: Icon(Icons.person),
                      validator: (String? text) {
                        if (text!.isEmpty) {
                          return 'Your Name Cannot be Empty';
                        } else {
                          return null;
                        }
                      },
                      obscure: false,
                    ),
                    // Email
                    InputText(
                      keyboardType: TextInputType.emailAddress,
                      textInputAction: TextInputAction.next,
                      text: 'Your Email',
                      icon: Icon(Icons.email_outlined),
                      validator: (String? text) {
                        if (text!.isEmpty) {
                          return 'Your Email Cannot be Empty';
                        } else if (!text.contains('@') || !text.contains('.')) {
                          return 'Your email is incorrect!';
                        } else {
                          return null;
                        }
                      },
                      obscure: false,
                    ),
                    // Password
                    InputText(
                      keyboardType: TextInputType.text,
                      textInputAction: TextInputAction.next,
                      text: 'Password',
                      icon: Icon(Icons.lock_outline_sharp),
                      validator: (String? text) {
                        if (text!.isEmpty) {
                          return 'Your Password cannot br empty';
                        } else if (text.length <= 7) {
                          return 'Your Password is Low';
                        } else {
                          return null;
                        }
                      },
                      obscure: isPasswordObscure1,
                      iconButton: IconButton(
                        onPressed: () {
                          setState(
                            () {
                              if (isPasswordObscure1) {
                                isPasswordObscure1 = false;
                              } else {
                                isPasswordObscure1 = true;
                              }
                            },
                          );
                        },
                        icon: Icon(Icons.visibility_off),
                      ),
                    ),
                    // Password Again
                    InputText(
                      keyboardType: TextInputType.text,
                      textInputAction: TextInputAction.done,
                      text: 'Password Again',
                      icon: Icon(Icons.lock_outline_sharp),
                      validator: (String? text) {
                        if (text!.isEmpty) {
                          return 'Your Password cannot br empty';
                        } else if (text.length <= 7) {
                          return 'Your Password is Low';
                        } else {
                          return null;
                        }
                      },
                      obscure: isPasswordObscure2,
                      iconButton: IconButton(
                        onPressed: () {
                          setState(() {
                            if(isPasswordObscure2){
                              isPasswordObscure2 = false;
                            }else{
                              isPasswordObscure2 = true;
                            }
                          });
                        },
                        icon: Icon(Icons.visibility_off),
                      ),
                    ),
                    // Button Sign In
                    Container(
                      margin: EdgeInsets.all(16),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          fixedSize: Size(343, 57),
                          shadowColor: Colors.blue,
                        ),
                        onPressed: () {
                          if (formKey.currentState!.validate()) {
                            Navigator.pushAndRemoveUntil(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => HomeScreen()),
                                (route) => false);
                          }
                        },
                        child: Text(
                          'Sign Up',
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w700,
                            fontSize: 14,
                          ),
                        ),
                      ),
                    ),
                    // Register Button
                    Container(
                      margin: EdgeInsets.only(top: 8),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'have a account? ',
                            style: TextStyle(
                              color: Colors.grey,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w700,
                              fontSize: 12,
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.pushAndRemoveUntil(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => LoginScreen()),
                                  (route) => false);
                            },
                            child: Text(
                              'Sign In',
                              style: TextStyle(
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.w700,
                                  fontSize: 12,
                                  color: Colors.blue),
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
