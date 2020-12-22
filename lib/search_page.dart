import 'package:flutter/material.dart';
import 'package:cook_book/food_name_search.dart';
import 'package:cook_book/letter_search.dart';


class SearchMe extends StatelessWidget{


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pink[50],
      appBar: AppBar(
        title: Text("Search food",
          style: TextStyle(
            fontSize: 20.0,
            color: Colors.white,
          ),),
        backgroundColor: Colors.purple[600],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 32.0),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(primary: Colors.purple[300]),
                onPressed: () {
                  //go to new page_updation

                  Navigator.push(
                    context,
                    MaterialPageRoute(builder : (context) => LetterSearch() ),
                  );

                },
                child: Text('Search by first letter',
                  style: TextStyle(
                    fontSize: 16.0,
                    color: Colors.white,
                  ),),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 32.0),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(primary: Colors.purple[300]),
                onPressed: () {
                  //go to new page_updation

                  Navigator.push(
                    context,
                    MaterialPageRoute(builder : (context) => FoodPresence() ),
                  );

                },
                child: Text('Search by food name',
                  style: TextStyle(
                    fontSize: 16.0,
                    color: Colors.white,
                  ),),
              ),
            ),
          ],),

      ),
    );
  }
}