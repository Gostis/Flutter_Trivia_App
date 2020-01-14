import 'package:flutter/material.dart';

class NewGame extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     body:
       SafeArea(
                child: Column(
            children: <Widget>[
              Text("New Game", style: TextStyle(color: Theme.of(context).primaryColor, fontSize: 50, fontWeight: FontWeight.w600),), 
              
              SizedBox(height: 100,),
              
              
              Center(
    child: Card(
      child: InkWell(
        splashColor: Colors.blue.withAlpha(30),
        onTap: () {
          print('Card tapped.');
        },
        child: Container(
          width: 300,
          height: 100,
          child: Text('A card that can be tapped'),
        ),
      ),
    ),
  )

              
              ],
           ),
       ),
    );
  }
}