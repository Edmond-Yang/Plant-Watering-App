import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../services/data.dart';

class WaterTable extends StatelessWidget {
  const WaterTable({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final List info = Provider.of<Data>(context).getPlantsAndWeather()['detail']['watering'];

    return Table(
      defaultVerticalAlignment: TableCellVerticalAlignment.middle,

      border: const TableBorder(
        horizontalInside: BorderSide(width: 1, color: Colors.grey),
        top: BorderSide(width: 1, color: Colors.grey),
        bottom: BorderSide(width: 1, color: Colors.grey),
      ),
      children: <TableRow>[
        TableRow(
          children: <Widget>[
            const TableCell(child: Padding(
              padding: EdgeInsets.symmetric(vertical: 12.0),
              child: Center(child: Text('時間', style: TextStyle(
                fontFamily: 'TaipeiSansTCBeta',
                fontSize: 15
              ))),
            )),
            TableCell(child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 12.0),
                child: Center(child: Text(info[0]['time'], textAlign: TextAlign.center,))
            )),
            TableCell(child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 12.0),
                child: Center(child: Text(info[1]['time'], textAlign: TextAlign.center,))
            )),
            TableCell(child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 12.0),
                child: Center(child: Text(info[2]['time'], textAlign: TextAlign.center,))
            )),
          ],
        ),
        TableRow(
          children: <Widget>[
            const TableCell(child: Padding(
              padding: EdgeInsets.symmetric(vertical: 12.0),
              child: Center(child: Text('澆水量', style: TextStyle(
                  fontFamily: 'TaipeiSansTCBeta',
                  fontSize: 15
              ))),
            )),
            TableCell(child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 12.0),
                child: Center(child: Text(info[0]['water'].toString()))
            )),
            TableCell(child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 12.0),
                child: Center(child: Text(info[1]['water'].toString()))
            )),
            TableCell(child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 12.0),
                child: Center(child: Text(info[2]['water'].toString()))
            )),
          ],
        ),

      ],
    );
  }
}
