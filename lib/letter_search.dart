import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:cook_book/first_letter_search_result.dart';

class LetterSearch extends StatefulWidget{


  @override
  _InitialLetter createState() {
    return _InitialLetter();
  }
}

class _InitialLetter extends State<LetterSearch> {
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
      backgroundColor: Colors.blue[50],
      appBar: AppBar(
        title: Text("Search food with start letter",
          style: TextStyle(
            fontSize: 20.0,
            color: Colors.white,
          ),),
        backgroundColor: Colors.blue[600],
      ),
      body: Form(
          key: _formKey,
          child: Column(
              children: <Widget>[
                TextFormField(
                  controller: _myControlText,
                  decoration: const InputDecoration(
                    hintText: 'Enter the first food letter',
                  ),
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Please enter some text';
                    }
                    return null;
                  },
                  maxLength: 1,
                ),

                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(primary: Colors.blue[400]),
                    onPressed: () {
                      //Display();
                      if (_formKey.currentState.validate()) {
                        // Process data if valid form.
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder : (context) => FirstLetterResult(searchThis : _myControlText.text) ),
                        );
                        // ResponseFood(searchThis : _myControlText.text);
                      }
                    },
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