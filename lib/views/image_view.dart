import 'package:flutter/material.dart';

class ImageView extends StatelessWidget {
  final String imgUrl;
  const ImageView({ Key? key,required this.imgUrl }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          
          height: MediaQuery.of(context).size.height*0.5,
          width: MediaQuery.of(context).size.width,
          padding: EdgeInsets.symmetric(horizontal: 20),
          child:Image.network(imgUrl)
        ),
      ),
    );
  }
}
