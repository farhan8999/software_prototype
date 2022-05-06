import 'package:flutter/material.dart';
import 'package:software_prototype/ui/tools.dart';

//MAKE ROUTES TO TOOLS PAGE

class divide_conquer extends StatelessWidget {
  const divide_conquer({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green.shade900,
      body: Center(
        child: Container(
          alignment: Alignment.center,
          width: 300,
          height: 500,
          decoration: BoxDecoration(
            color: Colors.green.shade800,
            borderRadius: BorderRadius.circular(14.5)
          ),  
        child: IntrinsicWidth(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Divide and \nConquer", style: TextStyle(fontSize: 40, color: Colors.white, fontFamily: ''), textAlign: TextAlign.center,),
              ElevatedButton(onPressed: () {Navigator.push(context, MaterialPageRoute(builder: (context) => Tools()));}, 
                            child: Text("Tools", style: TextStyle(color: Colors.black),), 
                            style: ElevatedButton.styleFrom(primary: Colors.grey, elevation: 12),
              ),
              ElevatedButton(onPressed: () => debugPrint("Progress button"), 
                            child: Text("Progress", style: TextStyle(color: Colors.black),), 
                            style: ElevatedButton.styleFrom(primary: Colors.grey, elevation: 12),
              ),
              ElevatedButton(onPressed: () => debugPrint("Settings button"), 
                            child: Text("Settings", style: TextStyle(color: Colors.black),), 
                            style: ElevatedButton.styleFrom(primary: Colors.grey, elevation: 12),
              ),
            ],
          ),
        ),
        ),
      ),
    );
  }
}