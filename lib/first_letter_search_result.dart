import 'package:flutter/material.dart';
import 'package:cook_book/api.dart';
import 'dart:async';


//result display for food starting with give letter search
class FirstLetterResult extends StatefulWidget{
  final String searchThis;
  FirstLetterResult({Key key, this.searchThis}) : super(key:key);

  @override
  _GetItems createState() {
    return _GetItems();
  }
}

class _GetItems extends State<FirstLetterResult>{

  //storing the list
  Future<List<FoodDetail>> foodResult;

  @override
  void initState() {
    super.initState();
    foodResult = searchAllGivenFoodFirst(widget.searchThis); //goes to api.dart
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green[100],
      appBar: AppBar(
        title: Text("Hey! Your Result",),
        backgroundColor: Colors.green[600],
      ),
      body: Center(
          child: FutureBuilder<List<FoodDetail>> (
            future: foodResult,
            builder: (context, snapshot) {

              if(snapshot.hasData){
                return DetailDisplay(myFood: snapshot.data);
              }
              else if (snapshot.hasError) { //error handling
                return Text("Oops!! NA!! Chose some other letter!",
                  style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.black,
                  ),);
              }

              return CircularProgressIndicator();

            },
          )
      ),
    );
  }
}

class DetailDisplay extends StatelessWidget{
  List<FoodDetail> myFood;

  DetailDisplay({Key key, this.myFood}) : super(key:key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: myFood.length,
        itemBuilder: (context,index) {
          return Center(
            //key: _formKey,
            child: Card(
              child: Column(
                  children: <Widget>[
                    ListTile(
                      leading: Icon(Icons.fastfood),
                      title: Text('${myFood[index].name}',
                        style: TextStyle(
                          fontSize: 15.0,
                          color: Colors.black,
                        ),),
                      subtitle: Text('${myFood[index].youTube}'),
                    ),
                    SizedBox(width: 10),
                  ]

              ),
            ),
          );
        }
    );
  }
}
