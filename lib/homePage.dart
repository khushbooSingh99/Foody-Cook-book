import 'package:flutter/material.dart';
import 'package:cook_book/random_food.dart';
import 'package:cook_book/search_page.dart';
import 'package:cook_book/favorites.dart';
class Display extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[50],
      appBar: AppBar(
        title: Text("Foody Cook Book",
          style: TextStyle(
            fontSize: 20.0,
            color: Colors.white,
          ),),
        backgroundColor: Colors.blueGrey[600],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 32.0),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(primary: Colors.brown[400]),
                onPressed: () {
                  //go to new page_updation

                  Navigator.push(
                    context,
                    MaterialPageRoute(builder : (context) => ViewFood() ),
                  );

                },
                child: Text('View Random food',
                  style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.white,
                  ),),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 32.0),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(primary: Colors.cyanAccent[700]),
                onPressed: () {
                  //go to new page_updation

                  Navigator.push(
                    context,
                    MaterialPageRoute(builder : (context) => DisplayFavorites() ),
                  );

                },
                child: Text('View favorites',
                  style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.white,
                  ),),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 32.0),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(primary: Colors.purple[600]),
                onPressed: () {
                  //go to new page_updation

                  Navigator.push(
                    context,
                    MaterialPageRoute(builder : (context) => SearchMe() ),
                  );

                },
                child: Text('Search food',
                  style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.white,
                  ),),
              ),
            ),
          ],),

      ),
    );
  }
}