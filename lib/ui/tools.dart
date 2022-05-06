import 'package:flutter/material.dart';
import 'package:software_prototype/ui/chatbot.dart';
import 'package:software_prototype/ui/todolist.dart';

class Tools extends StatelessWidget {
  const Tools({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green.shade900,
      appBar: AppBar(
        backgroundColor: Colors.green.shade800,
        title: Text("List of tools"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            //AI CHATBOT
            Container(
              alignment: Alignment.center,
              width: 280,
              height: 120,
              decoration: BoxDecoration(
                color: Colors.white70,
                borderRadius: BorderRadius.circular(14)
              ),
              child: Stack(
                children: [
                  _get_ai_info(context)
                ]
              ),
            ),
            //TO - DO LIST
            Container(
              alignment: Alignment.center,
              width: 280,
              height: 120,
              decoration: BoxDecoration(
                color: Colors.white70,
                borderRadius: BorderRadius.circular(14)
              ),
              child: Stack(
                children: [
                  _get_todo_info(context)
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

    Padding _get_todo_info(context) {
      return Padding(
        padding: const EdgeInsets.only(left: 8.0, right: 6.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              width: 50,
              height: 90,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(14)
              ),
              child: Icon(Icons.calendar_month, size: 50, color: Colors.red,),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 15.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("To do list"),
                  Text(
                    "Create a to - do list to manage \nyour tasks and feel less \noverwhelmed",
                    style: TextStyle(fontSize: 10),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 100.0),
                    child: ElevatedButton(
                      onPressed: () {Navigator.push(context, MaterialPageRoute(builder: (context) => todolist()));}, 
                      child: Text("Start"),
                      style: ElevatedButton.styleFrom(primary: Colors.green.shade800,),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      );
  }

  Padding _get_ai_info(context) {
    return Padding(
      padding: const EdgeInsets.only(left: 8.0, right: 6.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            width: 50,
            height: 90,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(14)
            ),
            child: Icon(Icons.adb_rounded, size: 50, color: Colors.red,),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("CBT Chatbot"),
                Text(
                  "Work through your thoughts and behaviours \nby answering a serious of questions \nthrough our AI chatbot",
                  style: TextStyle(fontSize: 10),
                ),
                Container(
                  margin: EdgeInsets.only(left: 130.0),
                  child: ElevatedButton(
                    onPressed: () {Navigator.push(context, MaterialPageRoute(builder: (context) => home()));}, 
                    child: Text("Start"),
                    style: ElevatedButton.styleFrom(primary: Colors.green.shade800,),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
}
}