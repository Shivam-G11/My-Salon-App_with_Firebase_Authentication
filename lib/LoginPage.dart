// @dart=2.9

import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import 'SignupPage.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'auth.dart';
import 'main.dart';
import 'package:email_validator/email_validator.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final Email = TextEditingController();
  final pass = TextEditingController();
  bool isLoading = false;
  get auth => null;


  String _email, _password;

  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();

  bool _isVisible = false;


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: Form(
          autovalidate: true,
          key: _formkey,
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 20, left: 20),
                      child: Container(
                        height: 60,
                        width: 60,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: Colors.black),
                        child: Card(
                          color: Colors.black,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15),
                              side: BorderSide(color: Colors.grey)),
                          child: Padding(
                            padding: const EdgeInsets.only(left: 8),
                            child: Icon(
                              Icons.arrow_back_ios,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 20, left: 25),
                      child: Shimmer.fromColors(
                        baseColor: Colors.white,
                        highlightColor: Colors.black,
                        child: Text(
                          "Log in",
                          style: TextStyle(
                              fontSize: 50,
                              fontWeight: FontWeight.bold,
                              fontFamily: "Times New Roman"),
                        ),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 30, left: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        "Hello Again!\nWelcome Back",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 30,
                            color: Colors.white,
                            fontFamily: "Cursive"),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 30, left: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        "Email",
                        style: TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20, top: 10),
                  child: TextFormField(
                    controller: Email,
                    style: TextStyle(fontSize: 20, color: Colors.white),
                    decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: BorderSide(color: Colors.pinkAccent),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: const BorderSide(
                          color: Colors.grey,
                        ),
                      ),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15)),
                      hintText: "Enter Your Email",
                      hintStyle: TextStyle(fontSize: 20, color: Colors.grey),
                    ),
                    autofillHints: [AutofillHints.email],
                    keyboardType: TextInputType.emailAddress,

                    validator: (value) => EmailValidator.validate(value) ? null : "Enter a valid email",
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 30, left: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        "Password",
                        style: TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20, top: 10),
                  child: TextFormField(
                    controller: pass,
                    style: TextStyle(fontSize: 20, color: Colors.white),
                    obscureText: !_isVisible,
                    decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: BorderSide(color: Colors.pinkAccent),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: const BorderSide(
                          color: Colors.grey,
                        ),
                      ),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15)),
                      hintText: "Enter Password",
                      hintStyle: TextStyle(fontSize: 20, color: Colors.grey),
                      suffixIcon: IconButton(
                        onPressed: (){
                          setState(() {
                            _isVisible = !_isVisible;
                          });
                        },
                        icon: _isVisible ? Icon(Icons.visibility, color: Colors.white,) : Icon(Icons.visibility_off, color: Colors.grey,),
                      ),
                    ),
                    validator: (String value){
                      if (value.isEmpty){
                        return "Enter Password";
                      }
                      return null;
                    },
                    onSaved: (String password){
                      _password = password;
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 40, left: 20, right: 20),
                  child: InkWell(
                      onTap: () {
                        setState(() {
                          isLoading = true;
                        });
                        AuthClass()
                            .signIN(
                                email: Email.text.trim(),
                                password: pass.text.trim())
                            .then((value) {
                          if (value == "Welcome") {
                            setState(() {
                              isLoading = false;
                            });
                            Navigator.pushAndRemoveUntil(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => HomePage()),
                                (route) => false);
                          } else {
                            setState(() {
                              isLoading = false;
                            });
                            ScaffoldMessenger.of(context)
                                .showSnackBar(SnackBar(content: Text(value)));
                          }
                        });
                      },
                      child: Container(
                        height: 65,
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: Colors.pinkAccent),
                        child: Center(
                            child: Text(
                          "Log in",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 25,
                              fontWeight: FontWeight.bold),
                        )),
                      )),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20, top: 25),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Don,t have an Account? ",
                        style: TextStyle(fontSize: 18, color: Colors.white),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => SignupPage()));
                        },
                        child: Text(
                          " Sign up",
                          style: TextStyle(
                              fontSize: 20,
                              color: Colors.pinkAccent,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
