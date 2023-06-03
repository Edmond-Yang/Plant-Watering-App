import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import './services/data.dart';
import './components/loading.dart';
import './components/chart.dart';
import './components/table.dart';
import './components/weather.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      title: 'Plants',
      theme: ThemeData(

      ),
      home: ChangeNotifierProvider(
        create: (context) => Data(),
        child: Consumer<Data>(
          builder: (context, data, child) {

            final Map info = data.getPlantsAndWeather();

            if(info.isEmpty){
              data.getData();
              return const Loading();
            }

            if(info['status'] == -1){
              return Center(
                  child: Text(
                    info['detail'], style: const TextStyle(
                    fontFamily: 'TaipeiSansTCBeta',
                  ),
                  )
              );
            }

            return Scaffold(
              appBar: AppBar(
                title: Text('狐尾武竹', style: TextStyle(color: Colors.pink.shade800,fontFamily: 'TaipeiSansTCBeta',),),
                centerTitle: true,
                backgroundColor: Colors.pink[100],
                actions: [
                  ElevatedButton(
                    onPressed: (){
                      data.getData();
                    },
                    style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.white,
                        backgroundColor: Colors.transparent,
                        elevation: 0.0
                    ),
                    child: Row(
                      children: [
                        Icon(Icons.refresh_rounded, color: Colors.pink.shade800,),
                        const SizedBox(width: 10),
                        Text('Refresh', style: TextStyle(
                          color: Colors.pink.shade800
                        ),)
                      ],
                    ),

                  )
                ],
              ),
              body: Column(
                children: [
                  const SizedBox(
                      height: 20.0
                  ),
                  const Center(
                    child: Text(
                      '植物環境數據',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w400,
                        fontFamily: 'TaipeiSansTCBeta',
                      ),
                    ),
                  ),
                  const SizedBox(
                      height: 10.0
                  ),
                  Chart(),
                  const SizedBox(
                      height: 20.0
                  ),
                  const Center(
                    child: Text(
                      '澆水數據',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w400,
                        fontFamily: 'TaipeiSansTCBeta',
                      ),
                    ),
                  ),
                  const SizedBox(
                      height: 10.0
                  ),
                  const WaterTable(),
                  const SizedBox(
                      height: 10.0
                  ),
                  const WeatherZone()
                ],
              ),
            );
          })
      ),
    );
  }
}



