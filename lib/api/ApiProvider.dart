

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'dart:convert' as convert;
import 'package:http/http.dart' as http;

class LoginData{
  String _login="Loading...";
  String get login=>_login;
  set loginData(String data)=>_login=data;
}

class ApiProvider with ChangeNotifier{

LoginData note=LoginData();

 Stream<LoginData> streamBalance(){

   return Stream.fromFuture(getData());
 }


LoginData notifier(){
   return note;
 }
 Future<LoginData> getData() async {


   final  http.Response result=await http.get("https://api.themoviedb.org/3/movie/550?api_key=6a381a437a01fb252f224befc00f772f");
   //'http://192.168.11.152:9045/secured/transact';


  /* ;
   var response = await http.post(url, body: {
     "operation":"BALANCE_ENQUIRY",
     "requestBody":{
       "fromAccount":"1001572594",
       "currency":"932",
       "asyncRequest":true
     }
   },headers: {"Content-Type"
     :"application/json"});
   print('Response status: ${response.statusCode}');
   print('Response body: ${response.body}');*/
   note=LoginData()..loginData=result.body;
   notifyListeners();
   return note;
 }
}
