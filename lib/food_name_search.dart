import 'package:flutter/material.dart';
import 'package:cook_book/response_food_search.dart';
import 'package:cook_book/api.dart';
import 'package:cook_book/homePage.dart';
import 'dart:async';

class FoodPresence extends StatefulWidget{

  @override
  _SearchByName createState() => _SearchByName();

}

class _SearchByName extends State<FoodPresence> {

  final _myControlText = TextEditingController();
  final _formKey = GlobalKey<FormState>();


  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    _myControlText.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal[50],
      appBar: AppBar(
        title: Text("Search for food names having letters. .",
          style: TextStyle(
            fontSize: 20.0,
            color: Colors.white,
          ),),
        backgroundColor: Colors.teal[600],
      ),

      body: Form(
          key: _formKey,
        //  body: Container(
          child: Column(
              children: <Widget>[
                TextFormField(
                  controller: _myControlText,
                  decoration: const InputDecoration(
                    hintText: 'Enter the food name',
                  ),
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Please enter some text';
                    }
                    return null;
                  },
                ),

                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                  child: RaisedButton(
                    onPressed: () {
                      //Display();
                       if (_formKey.currentState.validate()) {
                      // Process data if valid form.
                         //goes to response_food_search.dart for further processing
                         Navigator.push(
                           context,
                           MaterialPageRoute(builder : (context) => ResponseFood(searchThis : _myControlText.text) ),
                         );

                      }
                    },
                    color: Colors.teal[400],
                    child: Text('Search',
                      style: TextStyle(
                        fontSize: 20.0,
                        color: Colors.white,
                      ),),

                  ),
                ),
              ]
          )
      ),
    );
  }
}

