
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'chatRoom.dart';

class usersView extends StatefulWidget {
  const usersView({Key? key}) : super(key: key);

  @override
  State<usersView> createState() => _usersViewState();
}

class _usersViewState extends State<usersView> {
  final fireStore = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffFFE5DE),

  body:    StreamBuilder<QuerySnapshot>(
          stream: fireStore.collection('Users').snapshots(),
          builder: (context, snapShot) {
            return snapShot.hasData
                ? ListView.builder(
                itemCount: snapShot.data?.docs.length,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ChatRoom() ,
                        ),
                      );
                    },
                    child: Card(
                      color: Colors.white24,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      elevation: 10,
                      clipBehavior: Clip.antiAlias,
                      shadowColor: Colors.transparent,
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: Column(
                          children: <Widget>[
                            SizedBox(height: 12),
                            Row(
                              children: [
                                Container(
                                  height: 50,
                                  width: 50,
                                  decoration: BoxDecoration(
                                      borderRadius:
                                      BorderRadius.circular(20),
                                      color: Colors.grey,
                                      image: DecorationImage(
                                        image: AssetImage(
                                          '',
                                        ),
                                        fit: BoxFit.cover,
                                      )),
                                ),
                                SizedBox(
                                  width: 15,
                                ),
                                Column(
                                  mainAxisAlignment:
                                  MainAxisAlignment.start,
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Container(
                                      width: 100,
                                      child: Text(
                                        snapShot.data?.docs[index]
                                        ['name'],
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 15,
                                        ),
                                      ),
                                    ),



                                  ],
                                ),


                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  );


                })
                : snapShot.hasError
                ? Text('Error')
                : CircularProgressIndicator();
          }),
    );

  }
}
