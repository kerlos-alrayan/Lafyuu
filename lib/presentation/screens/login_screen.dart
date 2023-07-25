import 'package:ecommerce_app_sat26/presentation/screens/home_screen.dart';
import 'package:ecommerce_app_sat26/presentation/screens/register_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({Key? key}) : super(key: key);
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool isPasswordObscure = true;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

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
                      height: 72,
                      width: 72,
                    ),
                    //--SizeBox
                    SizedBox(
                      height: 16,
                    ),
                    // Welcome Text
                    Text(
                      'Welcome to Lafyuu',
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    //--SizeBox
                    SizedBox(
                      height: 8,
                    ),
                    // Sign In Text
                    Text(
                      'Sign in to continue',
                      style: TextStyle(
                        color: Colors.grey,
                        fontFamily: 'Poppins',
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    // Email Box
                    _email_box(context),
                    // Password Box
                    Container(
                      margin: EdgeInsets.fromLTRB(25, 8, 25, 0),
                      child: TextFormField(
                        obscureText: isPasswordObscure,
                        textInputAction: TextInputAction.done,
                        decoration: InputDecoration(
                          hintText: 'Password',
                          hintStyle: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                              fontFamily: 'Poppins',
                              color: Colors.grey),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                            borderSide: BorderSide(
                              color: Colors.grey,
                              width: 0,
                            ),
                          ),
                          prefixIcon: Icon(
                            Icons.lock_outline_sharp,
                            color: Colors.grey,
                          ),
                          border: OutlineInputBorder(),
                          // suffixIcon: Icon(
                          //   Icons.visibility_off,
                          //   color: Colors.grey,
                          // ),
                          suffixIcon: IconButton(
                            icon: isPasswordObscure
                                ? Icon(
                                    Icons.visibility_off,
                                    color: Colors.grey,
                                  )
                                : Icon(
                                    Icons.visibility,
                                    color: Colors.blue,
                                  ),
                            onPressed: () {
                              setState(
                                () {
                                  // version 1
                                  if (isPasswordObscure) {
                                    isPasswordObscure = false;
                                  } else {
                                    isPasswordObscure = true;
                                  }
                                  // version 2
                                  // isPasswordObscure = !isPasswordObscure;
                                },
                              );
                            },
                          ),
                        ),
                        validator: (String? pass) {
                          if (pass!.isEmpty) {
                            return 'Your Password cannot br empty';
                          } else if (pass.length <= 7) {
                            return 'Your Password is Low';
                          } else {
                            return null;
                          }
                        },
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
                          'Sign In',
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w700,
                            fontSize: 14,
                          ),
                        ),
                      ),
                    ),
                    // Text OR
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          height: 0.5,
                          width: MediaQuery.of(context).size.width * 0.34,
                          color: Colors.grey,
                        ),
                        Text(
                          'OR',
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 14,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        Container(
                          height: 0.5,
                          width: MediaQuery.of(context).size.width * 0.34,
                          color: Colors.grey,
                        ),
                      ],
                    ),
                    // Google Button
                    Container(
                      margin: EdgeInsets.fromLTRB(16, 16, 16, 0),
                      child: OutlinedButton(
                        style: OutlinedButton.styleFrom(
                          fixedSize: Size(343, 57),
                        ),
                        onPressed: () async{
                          await signInWithGoogle();
                        },
                        child: Row(
                          children: [
                            Image.asset('assets/images/Group 121.png'),
                            SizedBox(
                              width: 80,
                            ),
                            Text(
                              'Login with Google',
                              style: TextStyle(
                                fontFamily: 'Poppins',
                                color: Colors.grey,
                                fontWeight: FontWeight.w700,
                                fontSize: 14,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    // FaceBook Button
                    Container(
                      margin: EdgeInsets.only(left: 16, top: 8, right: 16),
                      child: OutlinedButton(
                        style: OutlinedButton.styleFrom(
                          fixedSize: Size(343, 57),
                        ),
                        onPressed: () {},
                        child: Row(
                          children: [
                            Image.asset('assets/images/Facebook.png'),
                            SizedBox(
                              width: 65,
                            ),
                            Text(
                              'Login with Facebook',
                              style: TextStyle(
                                fontFamily: 'Poppins',
                                color: Colors.grey,
                                fontWeight: FontWeight.w700,
                                fontSize: 14,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    // Forget Button
                    Container(
                      margin: EdgeInsets.only(top: 16),
                      child: GestureDetector(
                        onTap: () {},
                        child: Text(
                          'Forget Password?',
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 12,
                            fontWeight: FontWeight.w700,
                            color: Colors.blue,
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
                            'Don${"'"}t have a account? ',
                            style: TextStyle(
                              color: Colors.grey,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w700,
                              fontSize: 12,
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => RegisterScreen()));
                            },
                            child: Text(
                              'Register',
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

  Future<UserCredential> signInWithGoogle() async {
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser =
        await GoogleSignIn(scopes: ['email']).signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    // Once signed in, return the UserCredential
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }

  // Future<UserCredential> signInWithFacebook() async {
  //   // Trigger the sign-in flow
  //   final LoginResult loginResult = await FacebookAuth.instance.login();
  //
  //   // Create a credential from the access token
  //   final OAuthCredential facebookAuthCredential = FacebookAuthProvider.credential(loginResult.accessToken!.token);
  //
  //   // Once signed in, return the UserCredential
  //   return FirebaseAuth.instance.signInWithCredential(facebookAuthCredential);
  // }
}

Widget _email_box(context) {
  return Container(
    margin: EdgeInsets.fromLTRB(25, 28, 25, 0),
    child: TextFormField(
      keyboardType: TextInputType.emailAddress,
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        hintText: 'Your Email',
        hintStyle: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w400,
            fontFamily: 'Poppins',
            color: Colors.grey),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.grey,
            width: 0,
          ),
          borderRadius: BorderRadius.circular(5),
        ),
        prefixIcon: Icon(
          Icons.email_outlined,
          color: Colors.grey,
        ),
        border: OutlineInputBorder(),
      ),
      validator: (String? text) {
        if (text!.isEmpty) {
          return 'Your Email cannot be empty!';
        } else if (!text.contains('@') || !text.contains('.')) {
          return 'Your email is incorrect!';
        } else {
          return null;
        }
      },
    ),
  );
}
