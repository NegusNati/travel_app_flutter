import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:travel_app_flutter/model/data_model.dart';


// our Network class to fech an Api
class DataServices {
 //the base url for the API endpoint
  String baseUrl = "http://mark.bslmeiyu.com/api";

  Future<List<DataModel>> getInfo() async {
    var apiUrl = '/getplaces'; //the api endpoint
    http.Response res = await  http.get(Uri.parse(baseUrl+apiUrl)); // does a http Get of the full URL using the healer function of Uri(because get accepts Uri).parse
    try{
      if(res.statusCode == 200){ // always check if the api responded without an error by using tools like postMan or just using the status code 200 response
        List<dynamic> list = json.decode(res.body);// need to decode because flutter understand Map not Json
        return list.map((e) => DataModel.fromJson(e)).toList();// each e point to a certain instance of the json {}, so we need a list of those 'e's.
      }else{
         return <DataModel>[]; // the data dont load empty Data model is returned
      }
    }catch(e){
      print(e);
      return <DataModel>[];
    }
  }
}