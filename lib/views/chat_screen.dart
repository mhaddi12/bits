import 'package:flutter/material.dart';
import 'package:mix/mix.dart';


class ChatScreen extends StatefulWidget {


  @override
  State<ChatScreen> createState() => _ChatScreenState();
}


class _ChatScreenState extends State<ChatScreen> {
  TextEditingController controller=TextEditingController();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller.addListener(() {
      setState(() {});
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        surfaceTintColor: Colors.grey.shade200,
        backgroundColor: Colors.grey.shade200,
        automaticallyImplyLeading: false,
        title: Row(
          children: [
            GestureDetector(
                onTap: (){
                  Navigator.pop(context);
                },
                child: Icon(Icons.arrow_back)),
            SizedBox(width: 6,),
            Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: Colors.grey)
              ),
              child: CircleAvatar(
                backgroundImage: NetworkImage('https://static.vecteezy.com/system/resources/previews/005/544/718/non_2x/profile-icon-design-free-vector.jpg'), // Add a real image URL here
              ),
            ),
            SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Jhon Abraham', style: TextStyle(fontSize: 16)),
                Text('Active now', style: TextStyle(fontSize: 12, color: Colors.green)),
              ],
            ),
          ],
        ),

      ),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              children: [
                ChatBubble(
                  text: 'Hello! Jhon abraham',
                  isMe: true,
                  time: '09:25 AM',
                ),
                ChatBubble(
                  text: 'Hello! Nazrul How are you?',
                  isMe: false,
                  time: '09:23 AM',
                ),
                ChatBubble(
                  text: 'You did your job well!',
                  isMe: true,
                  time: '09:25 AM',
                ),
                ChatBubble(
                  text: 'Have a great working week!! Hope you like it',
                  isMe: false,
                  time: '09:25 AM',
                ),
                VoiceMessageBubble(
                  duration: '00:16',
                  time: '09:52 AM',
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
               Icon(Icons.attach_file,color: Colors.orangeAccent,),
                Expanded(
                  child: TextField(

                    cursorColor: Colors.orangeAccent,
                    controller: controller,
                    autocorrect: true,
                    decoration: InputDecoration(
                      focusColor: Colors.orangeAccent,
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide(color: Colors.orangeAccent)
                      ),
                      hintText: 'Write your message',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      hintStyle: TextStyle(
                        color: Colors.grey
                      ),
                      filled: true,
                      fillColor: Colors.grey[200],
                    ),
                  ),
                ),
                controller.text.isEmpty?Row(
                  children: [
                    SizedBox(width: 5,),
                    Icon(Icons.camera_alt_outlined,color: Colors.orangeAccent,),SizedBox(width: 13,),
                       Icon(Icons.mic,color: Colors.orangeAccent,),
                  ],
                ):Container(
                  margin: EdgeInsets.all(12),
                  padding: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Colors.orangeAccent,
                    border:Border.all(color: Colors.black),
                    shape: BoxShape.circle
                  ),
                  child: Icon(Icons.send,color: Colors.white,)
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ChatBubble extends StatelessWidget {
  final String text;
  final bool isMe;
  final String time;

  ChatBubble({required this.text, required this.isMe, required this.time});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
        children: [
          Container(

            padding: EdgeInsets.symmetric(vertical: 7, horizontal: 12),
            decoration: BoxDecoration(
              color: isMe ? Colors.orangeAccent : Colors.grey[400],
              borderRadius: BorderRadius.circular(12),
            ),
            child: SizedBox(
                width: MediaQuery.of(context).size.width/2,
                child: Text(text)),
          ),
          Text(
            time,
            style: TextStyle(fontSize: 12, color: Colors.grey[600]),
          ),
        ],
      ),
    );
  }
}

class VoiceMessageBubble extends StatelessWidget {
  final String duration;
  final String time;

  VoiceMessageBubble({required this.duration, required this.time});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.all(10),
            margin: EdgeInsets.only(left: 0,right: 70),
            decoration: BoxDecoration(
              color: Colors.grey[300],
              borderRadius: BorderRadius.circular(12),
            ),
            child: Row(
              children: [
                Icon(Icons.play_arrow),
                Text(duration),
              ],
            ),
          ),
          Text(
            time,
            style: TextStyle(fontSize: 12, color: Colors.grey[600]),
          ),
        ],
      ),
    );
  }
}
