//login
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);


  @override
  State<LoginPage>createState() => _LoginPageState();
}
class _LoginPageState extends State<LoginPage> {

  // controller for text
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final GlobalKey<FormState> _key = GlobalKey<FormState>();
  String errorMessage = '';


  // Future signIn() async {
  //   await FirebaseAuth.instance.signInWithEmailAndPassword(
  //       email: _emailController.text.trim(),
  //       password: _passwordController.text.trim()
  //   );
  //   if(_emailController.text!='')
  //   {
  //     if(_passwordController.text!=''){
  //       Navigator.pushNamed(context, '/moni');
  //     }
  //   }
  // }

  //@override

  // void dispose(){
  //   _emailController.dispose();
  //   _passwordController.dispose();
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body:SafeArea(
            child: Form(
              key: _key,
              child: Center(
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 98.0),
                        child: Row(
                          children: [
                            Text(
                              'AUTO',
                              style: GoogleFonts.poppins(
                                textStyle: TextStyle(
                                  fontSize: 32,
                                  fontWeight: FontWeight.w600,
                                  letterSpacing: 4.0,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                            Text(
                              ' GAZ',
                              style: GoogleFonts.poppins(
                                textStyle: TextStyle(
                                  fontSize: 32,
                                  fontWeight: FontWeight.w600,
                                  letterSpacing: 4.0,
                                  color: Color(0xFFFF3D00),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 50),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 25.0 ),
                        child: Container(
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey),
                            borderRadius: BorderRadius.circular(12.0),
                            color: Colors.white,
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(left: 20.0),
                            child: TextFormField(
                              controller: _emailController,
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: "Email",
                              ),
                              validator: validateEmail,
                            ),
                          ),

                        ),
                      ),
                      SizedBox(height: 16),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 25.0),
                        child: Container(
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey),
                            borderRadius: BorderRadius.circular(12.0),
                            color: Colors.white,
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(left: 20.0),
                            child: TextFormField(
                              controller: _passwordController,
                              obscureText: false,
                              decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: "Password"
                              ),
                              validator: validatePassword,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 24),
                      Center(
                        child: Text(
                            errorMessage
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 25.0),
                        child: SizedBox(
                          height: 55,
                          width: 310,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              primary: Colors.red,
                              onPrimary: Colors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                            ),
                            onPressed: () async {
                              if(_key.currentState!.validate()) {
                                try {
                                  await FirebaseAuth.instance.signInWithEmailAndPassword(
                                      email: _emailController.text,
                                      password: _passwordController.text);
                                  Navigator.pushNamed(context, "/home");
                                  errorMessage='';
                                } on FirebaseAuthException catch(error){
                                  errorMessage=error.message!;
                                }
                              }
                            },
                            child: Text("Log in",
                              style: TextStyle(color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                              ),),
                          ),
                        ),
                      ),
                      SizedBox(height: 10,),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Dont have an Account?",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),),
                          Text("  ",style: TextStyle(color: Colors.white)),
                          FloatingActionButton.extended(
                            backgroundColor: Colors.white,
                            onPressed: (){
                              Navigator.pushNamed(context, 'signup');
                            },
                            label: Text("Sign Up!!",
                              style: TextStyle(color: Colors.red,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ),

                    ],


                  ),
                ),
              ),
            )
        ));
  }
}
String? validateEmail(String? formEmail) {
  if (formEmail == null || formEmail.isEmpty) {
    return 'E-mail address is required.';
  }
  String pattern = r'\w+@\w+\.\w+';
  RegExp regex = RegExp(pattern);
  if (!regex.hasMatch(formEmail)) {
    return "Invalid E-mail Address format.";
  }
  return null;
}
String? validatePassword(String? formPassword) {
  if (formPassword == null || formPassword.isEmpty) {
    return 'Password is required.';
  }
  String pattern =
      r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$';
  RegExp regex = RegExp(pattern);
  if (!regex.hasMatch(formPassword)) {
    return '''
      Password must be at least 8 characters,
      include an uppercase letter, number and symbol.
      ''';
  }

  return null;
}