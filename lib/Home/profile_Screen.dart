
import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {



  @override
  Widget build(BuildContext context) {
    final fireStore = FirebaseFirestore.instance;

    var currentUser  =  FirebaseAuth.instance.currentUser?.uid;




    return Scaffold(
      backgroundColor: Color(0xffDAD3C8) ,
      body: Padding(
        padding: EdgeInsets.all(20),



          child:    StreamBuilder<QuerySnapshot>(
                stream: fireStore.collection('Users').where('${currentUser}').snapshots(),
                builder: (context, currentUser) {
                  return currentUser.hasData
                      ?ListView(

                       children: [
                          Column(
                            children: [
                              Container(
                                padding: EdgeInsets.fromLTRB(50, 100, 50, 50),
                                child: Align(
                                  alignment: Alignment.topCenter,
                                  child: SizedBox(
                                    child: CircleAvatar(
                                      radius: 60,
                                      backgroundColor: Colors.white,
                                      child: CircleAvatar(
                                        child: Align(
                                          alignment: Alignment.bottomRight,
                                          child: Container(
                                            child: CircleAvatar(

                                              backgroundColor: Colors.white,
                                              radius: 17,

                                              child: Icon(

                                                Icons.camera_alt,
                                                size: 20,
                                                color: Color(0xFF404040),
                                              ),

                                            ),
                                          ),
                                        ),
                                        radius: 60,

                                      ),
                                    ),
                                  ),
                                ),


                              ),


                              Container(


                                child: Text(currentUser.connectionState.name,

                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 25,
                                  ),
                                ),
                              ),

                                 Container(
                                  padding:
                                  EdgeInsets.fromLTRB(16.0, 8.0, 16.0, 8.0),
                                  decoration: BoxDecoration(
                                    color: Colors.black,
                                    borderRadius:
                                    BorderRadius.all(Radius.circular(20.0)),
                                  ),
                                  child: Text(
                                    'Edit Profile',
                                    style: TextStyle(
                                      fontFamily: 'Mulish',
                                      color: Colors.amber,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 16.0,
                                    ),
                                  ),
                                ),

                            ],
                          ),

                       ]




                  )
                      : currentUser.hasError
                  ? Text('Error')
        : CircularProgressIndicator();
    }),









    ),


    );
  }
}
