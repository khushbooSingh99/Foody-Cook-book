import 'package:flutter/material.dart';
import 'package:cook_book/api.dart';
import 'dart:async';
import 'package:firebase_database/firebase_database.dart';

class ViewFood extends StatefulWidget{

  @override
  _ViewItem createState() => _ViewItem();
}

//creating reference in realtime database to store the id and name of favorite food
DatabaseReference _ref ;

class _ViewItem extends State<ViewFood>{

  Future<FoodDetail> futureFood;

  @override
  void initState() {
    super.initState();
    futureFood = fetchRandomFood(); //goes to api.dart
    _ref = FirebaseDatabase.instance.reference();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pink[50],
      appBar: AppBar(
        title: Text("Hey!!! Try This",
          style: TextStyle(
            fontSize: 20.0,
            color: Colors.white,
          ),),
        backgroundColor: Colors.brown[400],
      ),
      body: Center(
          child: FutureBuilder<FoodDetail> (
            future: futureFood,
            builder: (context, snapshot) {
           //   if (snapshot.hasError) print(snapshot.error);

              if(snapshot.hasData){
                return DetailDisplay(myFood: snapshot.data);
              }
              else if (snapshot.hasError) {
                return Text("${snapshot.error}");
              }

              return CircularProgressIndicator();
            }

     )
      ),

    );
  }
}

class DetailDisplay extends StatelessWidget {

  final FoodDetail myFood;
  DetailDisplay({Key key, this.myFood}) : super(key:key);



  @override
  Widget build(BuildContext context) {
    return Center(
      //key: _formKey,
      child: Card(
        child: Column(
          children: <Widget>[
            new Container(
              child: new Image.asset(
                'assets/cook_min.jpg',
                height: 200.0,
                fit: BoxFit.cover,
              ),
            ),
            ListTile(
              leading: Icon(Icons.fastfood),
              title: Text('${myFood.name}',
                style: TextStyle(
                  fontSize: 15.0,
                  color: Colors.black,
                ),),
              subtitle: Text('${myFood.youTube}'),
            ),
            SizedBox(width: 20),
            TextButton(
              child: const Text('Add to Favorite',
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.amber,
                ),),
              onPressed: () {/* ... */

                /*_ref.push().set(idList).then((value) {
                  Navigator.pop(context);
                }); */
                  String foodId = myFood.idF;
                  String foodName = myFood.name;

                  Map<String, String> idList = {
                    'id': foodId,
                    'name': foodName,
                  };
                  _ref.push().set(idList);
                  Navigator.pop(context, true);


                },
            ),
            SizedBox(width: 8),
            Text('OR'),
            SizedBox(width: 8),
            TextButton(
              child: const Text('Go Back!?? Lets go!',
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.blueGrey,
                ),),
              onPressed: () {/* ... */
                Navigator.pop(context, true);
              },
            ),
          ]

        ),
      ),
    );
  }


}
