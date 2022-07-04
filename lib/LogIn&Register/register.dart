
import 'package:chatapplication/LogIn&Register/log%20in.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final fireStore = FirebaseFirestore.instance;


  final firebaseAuth = FirebaseAuth.instance;


  final _formkey = GlobalKey<FormState>();


  TextEditingController _emailcontroller = TextEditingController();
  TextEditingController _passwordcontroller = TextEditingController();
  TextEditingController _namecontroller = TextEditingController();
  TextEditingController _Agecontroller = TextEditingController();

  @override
  void dispose() {
    _emailcontroller.dispose();
    _passwordcontroller.dispose();
    _namecontroller.dispose();
    _Agecontroller.dispose();

    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffDAD3C8) ,
      body: SafeArea(
        child: Padding(
        padding: EdgeInsets.fromLTRB(20, 40, 20, 20),
    child: Form(
      key: _formkey,
      child: ListView(
      padding: const EdgeInsets.all(10),
      children: <Widget>[
        Container(

          width: 200,
          height: 200,
          decoration: BoxDecoration(
              image:DecorationImage(
                image: AssetImage('assets/images/image2.png'),
              )
          ),
        ),
        SizedBox(height: 10,),
        Container(
          padding: EdgeInsets.fromLTRB(5, 15, 40, 10),

          child: TextFormField(
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              labelText: 'Enter Name',
            ),
            controller: _namecontroller,
            validator: (value){
              if(value!.isEmpty){
                return 'Please Fill Name Input';
              }
            },
          ),
        ),
        SizedBox(height: 10,),
        Container(
          padding: EdgeInsets.fromLTRB(60, 0, 10, 20),

          child: TextFormField(
            decoration: InputDecoration(
              labelText: 'Enter Email',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
              ),
            ),

            controller: _emailcontroller,
            cursorColor: Colors.brown,
            validator: (value){
              if(value!.isEmpty){
                return 'Please Fill Email Input';
              }
            },
          ),
        ),
        SizedBox(height: 10,),
        Container(
          padding: EdgeInsets.fromLTRB(50, 0, 40, 10),

          child: TextFormField(
            decoration: InputDecoration(
              labelText: 'Enter Age',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
              ),
            ),

            controller: _Agecontroller,
            cursorColor: Colors.brown,
            validator: (value){
              if(value!.isEmpty){
                return 'Please Fill Age Input';
              }
            },
          ),
        ),
        SizedBox(height: 10,),

        Container(
          padding: EdgeInsets.fromLTRB(5, 0, 70, 10),

          child: TextFormField(
            decoration: InputDecoration(
              labelText: 'Password',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
              ),
            ),
            obscureText: true,
            controller: _passwordcontroller,
            cursorColor: Colors.brown,
            validator: (value){
              if(value!.isEmpty){
                return 'Please Fill Password Input';
              }
            },
          ),
        ),
        Container(
          padding: EdgeInsets.fromLTRB(40, 15, 40, 20),
          child: ElevatedButton(onPressed: () async {
                       if (_formkey.currentState!.validate()) {

                         final user  = await  firebaseAuth.createUserWithEmailAndPassword
                         (email: _emailcontroller.text.trim(), password: _passwordcontroller.text.trim()).then((value) {
                            String uid = FirebaseAuth.instance.currentUser!.uid;
                              fireStore.collection('Users').doc(uid).set({
                                  'User ID':uid,
                                   'age': _Agecontroller.text,
                                   'name': _namecontroller.text,
                                    'email': _emailcontroller.text,


                                     });
                                });

                          Navigator.push(context,
                             MaterialPageRoute(builder: (BuildContext context) => const LoginScreen(),
              ),
            );
          }else {
                         print('please try again');
                       }



               },
               child: Text('REGISTER'),

              style: ElevatedButton.styleFrom(
                primary: Colors.black,
                shape: new RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50),
                ),
              )
          ),
        ),


      ]
      ),
    ),
        ),
      ),

    );
  }
}
