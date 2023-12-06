import 'package:flutter/material.dart';
import 'BusStop.dart';

class BusStopPage extends StatefulWidget {

  final List<String> starredBusStops;
  final Function(String) addToStarred;
  final Function(String) removeFromStarred;


  BusStopPage({
    required this.starredBusStops,
    required this.addToStarred,
    required this.removeFromStarred,
  });

  @override
  _BusStopPageState createState() => _BusStopPageState();
}

class _BusStopPageState extends State<BusStopPage> {
  List<String> starredBusStops = []; // Add your initialization logic here

  @override
  Widget build(BuildContext context) {
    List<Map<String, String>> manualBusStops = [
        {'name': 'Putra Foodcourt', 'shortName': 'PFC'},
        {'name': 'Tan Sri Aishah Ghani College', 'shortName': 'KTAG'},
        {'name': 'Serumpun Foodcourt', 'shortName': 'SFC'},
        {'name': 'Fourteenth College', 'shortName': 'K14'},
        {'name': 'Institute of Bioscience', 'shortName': 'IBS'},
        {'name': 'Faculty of Modern Languages & Communication', 'shortName': 'FBMK'},
        {'name': 'Faculty of Computer Science & Information Technology', 'shortName': 'FSKTM'},
        {'name': 'Faculty of Science', 'shortName': 'FS'},
        {'name': 'Sultan Abdul Samad Library', 'shortName': 'Library'},
        {'name': 'Faculty of Food Science & Technology', 'shortName': 'FSTM'},
        {'name': 'Central (Great Hall & Experimental Theatre)', 'shortName': 'Central'},
        {'name': 'Academic Complex A (Opp Faculty of Modern Languages & Communication)', 'shortName': 'KAA'},
        {'name': 'Faculty of Design & Architecture', 'shortName': 'FRSB'},
        {'name': 'Tenth College', 'shortName': 'K10'},
        {'name': 'Tan Sri Mustaffa Babjee', 'shortName': 'KMB'},
        {'name': 'Tenth College', 'shortName': 'K10'},
        {'name': 'School of Graduate Studies', 'shortName': 'SGS'},
        {'name': 'Banquet Hall', 'shortName': 'Banquet'},
        {'name': 'Sports Academy', 'shortName': 'Academy'},
        {'name': 'Faculty of Agriculture Cafeteria', 'shortName': 'FPC'},
        {'name': 'Faculty of Agriculture', 'shortName': 'FP'},
        {'name': 'Institute for Mathematical Research', 'shortName': 'INSPEM'},
        {'name': 'Centre of Foundation Studies for Agricultural Science', 'shortName': 'ASPer'},
        {'name': 'Faculty of Biotechnology and Biomolecular Sciences', 'shortName': 'FBSB'},
      ];

    // List<Map<String, String>> manualBusStops = [
      // {'name': '푸트라 식당', 'shortName': 'PFC'},
      // {'name': '탄스리 아이샤 가니 기숙사', 'shortName': 'KTAG'},
      // {'name': '세룸펀 식당', 'shortName': 'SFC'},
      // {'name': '14번 기숙사', 'shortName': 'K14'},
      // {'name': '생명과학연구소', 'shortName': 'IBS'},
      // {'name': '외국어통신학관', 'shortName': 'FBMK'},
      // {'name': '컴퓨터과학정보기술학관', 'shortName': 'FSKTM'},
      // {'name': '과학관', 'shortName': 'FS'},
      // {'name': '술탄 압둘 사마드 도서관', 'shortName': 'Library'},
      // {'name': '식품과학기술학관', 'shortName': 'FSTM'},
      // {'name': 'Central (Great Hall & Experimental Theatre)', 'shortName': 'Central'},
      // {'name': 'Academic Complex A (Opp Faculty of Modern Languages & Communication)', 'shortName': 'KAA'},
      // {'name': 'Faculty of Design & Architecture', 'shortName': 'FRSB'},
      // {'name': 'Tenth College', 'shortName': 'K10'},
      // {'name': 'Tan Sri Mustaffa Babjee', 'shortName': 'KMB'},
      // {'name': 'Tenth College', 'shortName': 'K10'},
      // {'name': 'School of Graduate Studies', 'shortName': 'SGS'},
      // {'name': 'Banquet Hall', 'shortName': 'Banquet'},
      // {'name': 'Sports Academy', 'shortName': 'Academy'},
      // {'name': 'Faculty of Agriculture Cafeteria', 'shortName': 'FPC'},
      // {'name': 'Faculty of Agriculture', 'shortName': 'FP'},
      // {'name': 'Institute for Mathematical Research', 'shortName': 'INSPEM'},
      // {'name': 'Centre of Foundation Studies for Agricultural Science', 'shortName': 'ASPer'},
      // {'name': 'Faculty of Biotechnology and Biomolecular Sciences', 'shortName': 'FBSB'},
    // ];

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Bus Stops',
          style: TextStyle(
            color: Colors.white, // Set the title font color to white
            fontWeight: FontWeight.bold, // Set the title font weight to bold
          ),
        ),
        backgroundColor: Color(0xFF13E573), // Set the background color of the AppBar
      ),
      body:
      ListView.builder(
        itemCount: manualBusStops.length,
        itemBuilder: (context, index) {
          String busStopName = manualBusStops[index]['name']!;
          String busStopShortName = manualBusStops[index]['shortName']!;
          bool isStarred = widget.starredBusStops.contains('$busStopName | $busStopShortName');

          return BusStop(
            name: busStopName,
            shortName: busStopShortName,
            isStarred: isStarred,
            onStarPressed: () {
              setState(() {
                if (isStarred) {
                  widget.removeFromStarred('$busStopName | $busStopShortName');
                } else {
                  widget.addToStarred('$busStopName | $busStopShortName');
                }
              });
            },
          );
        },
      ),
    );
  }
}

