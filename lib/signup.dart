//regis
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_fonts/google_fonts.dart';

class RegPage extends StatefulWidget {
  const RegPage({Key? key}) : super(key: key);

  @override
  State<RegPage>createState() => _RegPageState();
}

class _RegPageState extends State<RegPage> {

  // controller for text
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _repasswordController = TextEditingController();
  final _numberController = TextEditingController();
  final GlobalKey<FormState> _key = GlobalKey<FormState>();
  String errorMessage = '';
  @override
  // bool passconfirmed(){
  //   if(_passwordController.text.trim() == _repasswordController.text.trim()){
  //     return true;
  //   }
  //   else{
  //     return false;
  //   }
  // }
  // Future signIn() async {
  //   if (passconfirmed()) {
  //     await FirebaseAuth.instance.createUserWithEmailAndPassword(
  //         email: _emailController.text.trim(),
  //         password: _passwordController.text.trim()
  //     );
  //   }
  // }
  // @override
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
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 60,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 80.0),
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
                      SizedBox(
                        height: 40,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 25.0 ),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(color: Colors.grey),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(left: 20.0),
                            child: TextField(
                                controller: _nameController,
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: "Name",
                                )
                            ),
                          ),

                        ),
                      ),
                      SizedBox(height: 30),

                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 25.0 ),
                        child: Container(
                          decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border.all(color: Colors.white),
                              borderRadius: BorderRadius.circular(14)
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(left: 20.0),
                            child: TextField(
                                controller: _numberController,
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: "Mobile number",
                                )
                            ),
                          ),

                        ),
                      ),
                      SizedBox(height: 30),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 25.0 ),
                        child: Container(
                          decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border.all(color: Colors.white),
                              borderRadius: BorderRadius.circular(14)
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
                              //validator: ,
                            ),
                          ),

                        ),
                      ),
                      SizedBox(height: 30,),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 25.0),
                        child: Container(
                          decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border.all(color: Colors.white),
                              borderRadius: BorderRadius.circular(14)
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
                      SizedBox(height: 30,),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 25.0),
                        child: Container(
                          decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border.all(color: Colors.white),
                              borderRadius: BorderRadius.circular(14)
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(left: 20.0),
                            child: TextFormField(
                              controller: _repasswordController,
                              obscureText: false,
                              decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: "Confirm Password"
                              ),
                              validator: validatePassword,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 30),
                      Center(
                        child: Text(errorMessage),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 25.0),
                        child: FloatingActionButton.extended (
                          backgroundColor:Colors.blue ,
                          onPressed: () async {
                            if(_key.currentState!.validate()) {
                              try {
                                await FirebaseAuth.instance.createUserWithEmailAndPassword(
                                    email: _emailController.text,
                                    password: _passwordController.text);
                                Navigator.pushNamed(context, "/login_page");
                                errorMessage='';
                              } on FirebaseAuthException catch(error){
                                errorMessage=error.message!;
                              }
                            }
                          },

                          label: Text("Sign Up",
                            style: TextStyle(color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),),
                        ),
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
    return "E-mail address is required.";
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
    return "Password is required.";
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