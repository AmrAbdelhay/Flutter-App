
import 'package:flutter/material.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffDAD3C8) ,
      body: Padding(
        padding: EdgeInsets.all(20),

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
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
                          radius: 60,
                          backgroundImage: AssetImage(
                              'assets/images/image5.png'

                          ),
                        ),
                      ),
                    ),
                ),
              ),
              Container(

               child: Text('Amr Ahmed',
               style: TextStyle(
                 fontWeight: FontWeight.bold,
                 fontSize: 25,
               ),
               ),
              ),
              TextButton(
                onPressed: () {
                  print('im pressed');
                },
                child: Container(
                  padding:
                  EdgeInsets.fromLTRB(16.0, 8.0, 16.0, 8.0),
                  decoration: BoxDecoration(
                    color: Color(0xFFEF476F),
                    borderRadius:
                    BorderRadius.all(Radius.circular(20.0)),
                  ),
                  child: Text(
                    'Edit Profile',
                    style: TextStyle(
                      fontFamily: 'SF Pro',
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                      fontSize: 16.0,
                    ),
                  ),
                ),
              ),







          ]


    ),
    ),


    );
  }
}
