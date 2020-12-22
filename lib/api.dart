import 'dart:convert';
import 'package:http/http.dart' as http;
import 'dart:async';

class URLS {
  static const String BASE_URL = 'https://www.themealdb.com/api/json/v1/1';
}


Future<FoodDetail> fetchRandomFood() async {
  var response = await http.get('${URLS.BASE_URL}/random.php');
  List<FoodDetail> list;
  if(response.statusCode == 200){
    var data = json.decode(response.body);
    var rest = data["meals"] as List;
    list = rest.map<FoodDetail>((json) => FoodDetail.fromJson(json)).toList();
    return list[0];
   // return FoodDetail.fromJson(json.decode(response.body));
  }
  else{
    throw Exception('Failed to load album');
  }

}


//search by food name
Future<List<FoodDetail> > searchGivenFood(String myFood) async {
  var response = await http.get('${URLS.BASE_URL}/search.php?s=${myFood}');
  List<FoodDetail> list;
  if(response.statusCode == 200){
    var data = json.decode(response.body);
    var rest = data["meals"] as List;
    list = rest.map<FoodDetail>((json) => FoodDetail.fromJson(json)).toList();
    return list;
    // return FoodDetail.fromJson(json.decode(response.body));
  }
  else{
    throw Exception('Failed to load album');
  }

}

Future<List<FoodDetail> > searchAllGivenFoodFirst(String myFood) async {
  var response = await http.get('${URLS.BASE_URL}/search.php?f=${myFood}');
  List<FoodDetail> list;
  if(response.statusCode == 200){
    var data = json.decode(response.body);
    var rest = data["meals"] as List;
    list = rest.map<FoodDetail>((json) => FoodDetail.fromJson(json)).toList();
    return list;
    // return FoodDetail.fromJson(json.decode(response.body));
  }
  else{
    throw Exception('Failed to load album');
  }

}

Future<FoodDetail> getFavList(String myFood) async {
  var response = await http.get('${URLS.BASE_URL}/lookup.php?i=${myFood}');
  List<FoodDetail> list;
  if(response.statusCode == 200){
    var data = json.decode(response.body);
    var rest = data["meals"] as List;
    list = rest.map<FoodDetail>((json) => FoodDetail.fromJson(json)).toList();
    return list[0];
    // return FoodDetail.fromJson(json.decode(response.body));
  }
  else{
    throw Exception('Failed to load album');
  }

}




class FoodDetail {
  final String name;
  final String category;
  final String area;
  final String youTube;
  final String tags;
  final String source;
  final String imageUrl;
  final String idF;

  FoodDetail( {this.name, this.category, this.area, this.youTube, this.tags, this.source, this.imageUrl, this.idF});

  factory FoodDetail.fromJson(Map<String, dynamic> json) {
    return FoodDetail(
      name: json["strMeal"],
      category: json["strCategory"],
      area: json["strArea"],
      youTube: json["strYoutube"],
      tags: json["strTags"],
      source: json["strSource"],
      imageUrl: json["strMealThumb"],
      idF: json["idMeal"]
    );
  }
}
