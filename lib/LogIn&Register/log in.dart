
import 'package:chatapplication/LogIn&Register/register.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';


import '../Home/home_page.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final firebase = FirebaseAuth.instance;

  void initState()
  {
    super.initState();
  }



  final _formkey = GlobalKey<FormState>();

  TextEditingController _emailcontroller = TextEditingController();

  TextEditingController _passwordcontroller = TextEditingController();

  @override
  void dispose()
  {
    _emailcontroller.dispose();

    _passwordcontroller.dispose();

    super.dispose();
  }
  bool showSpinner = false;
  @override
  Widget build(BuildContext context) {
    return   Scaffold(
        backgroundColor: Color(0xffDAD3C8),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(top: 40),
            child: ListView(
                padding: const EdgeInsets.all(30),

                children: <Widget>[
                 Container(
                      padding: EdgeInsets.only(top: 20),
                      width: 250,
                      height: 250,
                      decoration: BoxDecoration(
                        image:DecorationImage(
                          image: AssetImage('assets/images/image1.png'),
                        )
                      ),
                    ),
                    SizedBox(height: 10,),


                    Container(
                      padding: EdgeInsets.all(30),
                      child: TextFormField(

                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          labelText: 'Email',
                        ),
                        controller: _emailcontroller,
                        validator: (value){
                          if(value!.isEmpty){
                            return 'Please Fill Email Input';
                          }
                        },
                      ),
                    ),

                    Container(
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
                    padding: EdgeInsets.all(25),
                    child: ElevatedButton(onPressed: ()async{

                          if(_formkey.currentState!.validate()){
                            final user =

                            await firebase.
                            signInWithEmailAndPassword
                            (email: _emailcontroller.text.trim(), password: _passwordcontroller.text.trim());

                                if(user != null) {
                                 Navigator.pushReplacement(
                                         context,
                                          MaterialPageRoute(builder: (context) => const HomeScreen(),)

                                 );
                                  }else{
                                   print('user not found');
                                   }

                             }
                    }, child: Text('Log In'),

                        style: ElevatedButton.styleFrom(
                          primary: Colors.black,
                          shape: new RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50),
                          ),
                    )
                    ),
                  ),


                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("you don't have account ?"),
                       SizedBox(width: 2,),
                       TextButton(onPressed: (){
                         Navigator.push(context,
                             MaterialPageRoute(builder: (BuildContext context) => const RegisterScreen(),
                         ),
                         );

                       },
                       child: Text('Register')),

                      ],

                  ),
                ]



      ),
            ),
          ),

    );

  }
}
