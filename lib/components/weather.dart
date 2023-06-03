import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../services/data.dart';
import 'dart:convert';

class WeatherZone extends StatelessWidget {
  const WeatherZone({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {


    final Map info = Provider.of<Data>(context).getPlantsAndWeather()['detail']['weather'];
    final int probability = int.parse(info['value']);
    final String imageUrl = probability >= 30 ? 'https://github.com/Edmond-Yang/photo/blob/master/rain.png?raw=true':
        'https://raw.githubusercontent.com/Edmond-Yang/photo/master/sun.webp';

    final String text = probability >= 30 ? '可能下雨\n記得把植物收到室內': '天氣真好\n可以把植物拿到室外曬曬太陽' ;
    final Color color = probability >= 30 ? Colors.blueAccent: Colors.amber;

    return Column(
      children: [
        Image(image: NetworkImage(imageUrl), height: 140.0,),
        Center(child: Text('${info['value']}%', style: TextStyle(
          color: color,
          fontSize: 45,
          fontWeight: FontWeight.w500
        ),)),
        Center(child: Text(text, textAlign: TextAlign.center,style: const TextStyle(
          fontSize: 20,
          fontFamily: 'TaipeiSansTCBeta'
        ),))
      ],
    );
  }
}
