import 'package:bits/views/newcontact.dart';
import 'package:flutter/material.dart';
import 'package:mix/mix.dart';

import 'chat_screen.dart';



class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {


  List<Map<String, dynamic>> personDetails = [
    {
      'name': 'Haseeb',
      'image':
          'https://static.vecteezy.com/system/resources/previews/005/544/718/non_2x/profile-icon-design-free-vector.jpg',
      'lastmessage': 'Why are you not coming?',
      'time': '2 min ago'
    },
    {
      'name': 'Adil',
      'image':
          'https://static.vecteezy.com/system/resources/previews/005/544/718/non_2x/profile-icon-design-free-vector.jpg',
      'lastmessage': 'Can you join the meeting?',
      'time': '5 min ago'
    },
    {
      'name': 'Marina',
      'image':
          'https://static.vecteezy.com/system/resources/previews/005/544/718/non_2x/profile-icon-design-free-vector.jpg',
      'lastmessage': 'Let\'s catch up later.',
      'time': '10 min ago'
    },
    {
      'name': 'Dean',
      'image':
          'https://static.vecteezy.com/system/resources/previews/005/544/718/non_2x/profile-icon-design-free-vector.jpg',
      'lastmessage': 'I\'ll be there in 5 minutes.',
      'time': '15 min ago'
    },
    {
      'name': 'Max',
      'image':
          'https://static.vecteezy.com/system/resources/previews/005/544/718/non_2x/profile-icon-design-free-vector.jpg',
      'lastmessage': 'Meeting postponed to tomorrow.',
      'time': '20 min ago'
    },
    {
      'name': 'Sabila',
      'image':
          'https://static.vecteezy.com/system/resources/previews/005/544/718/non_2x/profile-icon-design-free-vector.jpg',
      'lastmessage': 'How are you today?',
      'time': '30 min ago'
    },
    {
      'name': 'John',
      'image':
          'https://static.vecteezy.com/system/resources/previews/005/544/718/non_2x/profile-icon-design-free-vector.jpg',
      'lastmessage': 'Don\'t forget to submit the report.',
      'time': '40 min ago'
    },
    {
      'name': 'Linda',
      'image':
          'https://static.vecteezy.com/system/resources/previews/005/544/718/non_2x/profile-icon-design-free-vector.jpg',
      'lastmessage': 'Let\'s meet for lunch.',
      'time': '50 min ago'
    },
    {
      'name': 'Michael',
      'image':
          'https://static.vecteezy.com/system/resources/previews/005/544/718/non_2x/profile-icon-design-free-vector.jpg',
      'lastmessage': 'I\'ll call you later.',
      'time': '1 hour ago'
    },
    {
      'name': 'Sarah',
      'image':
          'https://static.vecteezy.com/system/resources/previews/005/544/718/non_2x/profile-icon-design-free-vector.jpg',
      'lastmessage': 'See you at the event.',
      'time': '2 hours ago'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Colors.black,
          title: HBox(
              style: Style($flex.mainAxisAlignment.spaceBetween()),
              children: [
                Box(
                  style: Style(
                    $box.border.all(color: Colors.grey.shade800, width: 2),
                    $box.shape.circle(),
                  ),
                  child: CircleAvatar(
                    radius: 20,
                    backgroundColor: Colors.transparent,
                    child: Pressable(
                      child: StyledIcon(
                          style:
                              Style($icon.size(20), $icon.color(Colors.orangeAccent)),
                          Icons.search),
                    ),
                  ),
                ),
                Text('Home', style: TextStyle(color: Colors.white)),
                CircleAvatar(
                  backgroundColor: Colors.grey,
                  child: Icon(Icons.person, color: Colors.white),
                ),
              ]),
        ),
        body:
        VBox(
          children: [
            SizedBox(height: 20),
            // Top Status Row
            Container(
              color: Colors.black,
              height: 100,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: personDetails.length,
                itemBuilder: (context, index) {
                  return Container(
                    width: 80, // Adjust width to fit your design
                    margin: EdgeInsets.symmetric(horizontal: 8), // Adjust margin to fit your design
                    child: Column(
                      children: [
                        Container(
                          margin: EdgeInsets.only(bottom: 4),
                          decoration: BoxDecoration(
                            color: Colors.grey,
                            shape: BoxShape.circle,
                          ),
                          width: 70,
                          height: 70,
                          child: Center(
                            child: Icon(Icons.account_circle, color: Colors.white, size: 40),
                          ),
                        ),
                        Text(
                          personDetails[index]['name'],
                          style: TextStyle(color: Colors.white),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
            SizedBox(height: 20),
            // Chats List
            Expanded(
              child: Container(
                padding: EdgeInsets.only(top: 10),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(50),
                    topLeft: Radius.circular(50),
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,

                  children: [
                    Center(
                      child: Container(
                        height:5,
                        width: 50,
                        decoration: BoxDecoration(
                          color: Colors.grey,
                          borderRadius: BorderRadius.circular(30)

                        ),
                      ),
                    ),
                    Expanded(
                      child: ListView.builder(
                        itemCount: personDetails.length,
                        itemBuilder: (context, index) {
                          return Container(
                            decoration: BoxDecoration(
                              //olor: Colors.white,

                            ),
                            child: InkWell(
                              onTap: (){
                                Navigator.push(context, MaterialPageRoute(builder: (context)=>ChatScreen()));
                              },
                              child: ListTile(
                                leading: Container(
                                  decoration:BoxDecoration(
                                    shape: BoxShape.circle,
                                    border: Border.all(color: Colors.grey,width: 2)
                                  ),
                                  child: CircleAvatar(
                                    radius: 20,
                                    backgroundImage: NetworkImage(personDetails[index]['image']),
                                  ),
                                ),
                                title: Text(
                                  personDetails[index]['name'],
                                  style: TextStyle(color: Colors.black),
                                ),
                                subtitle: Text(
                                  personDetails[index]['lastmessage'],
                                  style: TextStyle(color: Colors.grey),
                                ),
                                trailing: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      personDetails[index]['time'],
                                      style: TextStyle(color: Colors.grey),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),


    );
  }
}

