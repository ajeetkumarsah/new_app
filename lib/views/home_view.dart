import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:new_app/views/image_view.dart';

class HomeView extends StatelessWidget {
  const HomeView({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
     getValue() async {
    final response = await http
        .get(Uri.parse('https://dog.ceo/api/breeds/image/random'));

    if (response.statusCode == 200) {
      var decodedData = jsonDecode(response.body);
      return decodedData['message'];
    } else {
      // throw Exception('Failed to load!');
      return 'Failed to load!';
    }
  }
    return  SafeArea(
      child: Scaffold(
        body: Container(child: Center(child:FlatButton(
          color: Colors.amber,
          onPressed: ()async{
          var imgUrl= await getValue();
          if(imgUrl=='Failed to load!'){ 
             ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: const Text('Failed to load!')),
          );         
           }else{
             ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: const Text('Success!')),
          );
            Navigator.push(context, CupertinoPageRoute(builder: (_)=>ImageView(imgUrl: imgUrl)));
        
       
          }
          }, child:  Text('Fetch',style:TextStyle(color: Colors.white)),),
          
        )),
      ),
    );
  }
}