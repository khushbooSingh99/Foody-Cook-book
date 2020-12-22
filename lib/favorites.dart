import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:cook_book/api.dart';
import 'dart:async';



class DisplayFavorites extends StatefulWidget{


  @override
  _DisplayFav createState() {
    return _DisplayFav();
  }

}

class _DisplayFav extends State<DisplayFavorites> {

  Query _ref; //reference to the database

  @override
  void initState() {
    super.initState();
    _ref = FirebaseDatabase.instance.reference().orderByChild('name');
  }


  Widget _buildListItem( {Map food}){

    return Center(
      //key: _formKey,
      child: Card(
        child: Column(
            children: <Widget>[
              ListTile(
                leading: Icon(Icons.fastfood),
                title: Text('${food['name']}'),
              ),
              getYouTube(food['id']), //lookup using the api call and show corresponding youtube link
              SizedBox(width: 20),
            ]

        ),
      ),
    );
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.cyan[50],
      appBar: AppBar(
        title: Text('Your Favorites',
          style: TextStyle(
            fontSize: 20.0,
            color: Colors.white,
          ),),
        backgroundColor: Colors.cyanAccent[700],
      ),
      body: Container(
        height: double.infinity, //takes up all of the screen
        child: FirebaseAnimatedList(query: _ref , itemBuilder: (BuildContext context,
            DataSnapshot snapshot, Animation<double> animation, int index){

          //this contains all the value of one field of our database
          Map eachFood = snapshot.value;

          return _buildListItem(food: eachFood);
        },),

      ),
    );
  }
}

//lookup using the api call and show corresponding youtube link of the food with given id number in realtime database
Widget getYouTube(String idNum){
  Future<FoodDetail> favFood;
  favFood = getFavList(idNum);

  return FutureBuilder<FoodDetail>(
    future: favFood,
    builder: (context, snapshot) {
      if(snapshot.hasData){
        return Text("${snapshot.data.youTube}");
      }
      else if (snapshot.hasError) {
        return Text("${snapshot.error}");
      }
      return CircularProgressIndicator();
    }
  );
}


