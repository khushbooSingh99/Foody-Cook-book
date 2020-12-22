import 'package:flutter/material.dart';
import 'package:cook_book/api.dart';
import 'dart:async';

class ResponseFood extends StatefulWidget{

  final String searchThis;
  ResponseFood({Key key, this.searchThis}) : super(key:key);

  @override
  _GetItem createState() => _GetItem();

}

class _GetItem extends State<ResponseFood>{

  Future<List<FoodDetail>> foodResult;

  @override
  void initState() {
    super.initState();
    foodResult = searchGivenFood(widget.searchThis);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        title: Text("Hey! Your Result",
          style: TextStyle(
            fontSize: 20.0,
            color: Colors.white,
          ),),
        backgroundColor: Colors.grey[850],
      ),
      body: Center(
        child: FutureBuilder<List<FoodDetail>> (
          future: foodResult,
          builder: (context, snapshot) {


            if(snapshot.hasData){
              return DetailDisplay(myFood: snapshot.data);
            }
            else if (snapshot.hasError) {
              return Text("Oops! Wrong choice of letters ;(",
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.black,
                ),);
            }
             // return snapshot.hasData
               //   ? DetailDisplay(myFood: snapshot.data)
                 // : Center(child: CircularProgressIndicator());
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
   /* return new Container(
      //child: SizedBox(width: 8),
      child: ListView.builder(
          itemCount: myFood.length,
          itemBuilder: (context,index) {
            return Text('${myFood[index].name}');
          }

      )
    ); */
    return new Container(
      //child: SizedBox(width: 8),
        child: ListView.builder(
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

        )
    );

  }
}
