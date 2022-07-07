
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';



class ChatRoom extends StatefulWidget {
  final friendUid;
  final friendName;
  const ChatRoom({Key? key, this.friendUid, this.friendName}) : super(key: key);

  @override
  State<ChatRoom> createState() => _ChatRoomState(friendUid, friendName);
}

class _ChatRoomState extends State<ChatRoom> {

  var fireStore = FirebaseFirestore.instance;

  TextEditingController controller = TextEditingController();


  CollectionReference chats = FirebaseFirestore.instance.collection('chats');
  final friendUid;
  final friendName;
  final currentUserId = FirebaseAuth.instance.currentUser?.uid;
  var chatDocId;
  var _textController = new TextEditingController();
  _ChatRoomState(this.friendUid, this.friendName);

  @override
  void initState() {
    super.initState();
    checkUser();
  }

  void checkUser() async {
    await FirebaseFirestore.instance.collection('chats')
        .where('Users', isEqualTo: {friendUid: null, currentUserId: null})
        .limit(1)
        .get()
        .then(
          (QuerySnapshot querySnapshot) async {
        if (querySnapshot.docs.isNotEmpty) {
          setState(() {
            chatDocId = querySnapshot.docs.single.id;
          });

          print(chatDocId);
        } else {
          await chats.add({
            'users': {currentUserId: null, friendUid: null},
            'names':{currentUserId:FirebaseAuth.instance.currentUser?.displayName,friendUid:friendName }
          }).then((value) => {chatDocId = value});
        }
      },
    )
        .catchError((error) {});
  }

  void sendMessage(String msg) {
    if (msg == '') return;
    chats.doc(chatDocId).collection('chats').add({
      'createdOn': FieldValue.serverTimestamp(),
      'uid': currentUserId,
      'friendName':friendName,
      'msg': msg
    }).then((value) {
      _textController.text = '';
    });
  }

  bool isSender(String friend) {
    return friend == currentUserId;
  }

  Alignment getAlignment(friend) {
    if (friend == currentUserId) {
      return Alignment.topRight;
    }
    return Alignment.topLeft;
  }

  @override
  Widget build(BuildContext context) {


    return Scaffold(
      body:Container(
        padding: EdgeInsets.all(10),
        child: Column (
          mainAxisAlignment: MainAxisAlignment.start,

            children: [

        StreamBuilder<QuerySnapshot>(
          stream: fireStore.collection('chats').snapshots(),
          builder: (context, snapShot) {
            return snapShot.hasData
                ? Expanded(
              child: ListView.builder(
                itemCount: snapShot.data?.docs.length,
                itemBuilder: (context, index) {
                  return Container(
                    child: Text(
                      snapShot.data?.docs[index]['text'],
                      style: const TextStyle(
                        fontWeight: FontWeight.w900,
                        fontSize: 30,
                      ),
                    ),
                  );
                },
              ),
            )
                : snapShot.hasError
                ? Text('Error')
                : CircularProgressIndicator();
          },
        ),
              Row(

                children: [
                  Container(

                    child: TextFormField(
                      decoration: InputDecoration(

                        hintText: 'type your massage'

                      ),
                      controller: controller,
                    ),
                  ),

              IconButton(
                onPressed: () {
                  fireStore.collection('chats').add({
                    'text': controller.text,
                  });
                },
                icon: Icon(Icons.send_sharp),

              ),
                ],
              ),

            ],
    ),
      ),
    );
  }
}
