// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        title:const  Text("Circular Notched Rectangle"),
      ),
      floatingActionButton: FloatingActionButton(backgroundColor: Colors.deepOrangeAccent
      ,onPressed:(){},child: const Icon(Icons.add),),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration:const  BoxDecoration(
          gradient: LinearGradient(colors: [Colors.teal,
          Colors.white],
          begin: Alignment.topCenter,end: Alignment.bottomCenter),
        ),
      ),
floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        
     color: Colors.blue,
      shape: CircularNotchedRectangle(
      ),
        child: Container(
        
          // ignore: prefer_const_literals_to_create_immutables
         child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround,children: [
         Icon(Icons.home,
           size: 50,),
           Icon(Icons.search,
           size: 50,)
          ],)
        ),
      ),
    );
  }
}