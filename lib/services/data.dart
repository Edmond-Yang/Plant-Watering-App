import 'package:flutter/foundation.dart';
import 'package:http/http.dart';
import 'dart:convert';

class Data extends ChangeNotifier{

  Map _data = {};

  final String plantsUrl = 'https://aiot-server-shsjao25ha-de.a.run.app/getAppData';
  final String weatherUrl = '';

  Future<void>  getData() async{

    try {
      // get the data
      Response response = await get(Uri.parse(plantsUrl));
      _data = {'status': 200,'detail': jsonDecode(response.body)};

      for(var d in _data['detail']['plant']){
        d['time'] = d['time'].replaceAll('T', '\n');
      }
      for(var d in _data['detail']['watering']){
        d['time'] = d['time'].replaceAll('T', '\n');
      }
    }
    catch(e){
      _data = {'status': -1,'detail': 'error: ${e.toString()}'};
    }

    print(_data);

    notifyListeners();
  }

  Map getPlantsAndWeather() => _data;

}