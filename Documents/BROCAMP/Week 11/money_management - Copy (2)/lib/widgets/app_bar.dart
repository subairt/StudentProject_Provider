import 'package:flutter/material.dart';

appbar(String text,bool value ,[IconData? icon]){
  
  return AppBar(
    flexibleSpace: Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(colors: [
           Color.fromRGBO(247, 22, 22, 0.878),
          Color.fromRGBO(255, 67, 40, 0.88),
          Color.fromRGBO(255, 152, 100, 0.88),
        ]),
      ),
    ),
    title: Center(child: Text(text)),
    actions: [
      Padding(padding: const EdgeInsets.only(right: 20),
      child:Icon(icon),
      )
    ], 
    //Controls whether we should try to imply the leading widget if null.
    // If true and leading is null, automatically try to deduce what the leading widget should be.
    //If false and leading is null, leading space is given to title. If leading widget is not null, 
    //this parameter has no effect.
   automaticallyImplyLeading: value,
  );
}