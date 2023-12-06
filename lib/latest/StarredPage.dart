import 'package:flutter/material.dart';

// class StarredPage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//       ),
//       body: Center(
//         child: Text('Starred Page'),
//       ),
//     );
//   }
// }
class StarredPage extends StatelessWidget {
  final List<String> starredBusStops;
  final Function(String) removeFromStarred;

  StarredPage({
    required this.starredBusStops,
    required this.removeFromStarred,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Starred',
          style: TextStyle(
            color: Colors.white, // Set the title font color to white
            fontWeight: FontWeight.bold, // Set the title font weight to bold
          ),
        ),
        backgroundColor: Color(0xFF13E573), // Set the background color of the AppBar
      ),
      body: ListView.builder(
        itemCount: starredBusStops.length,
        itemBuilder: (context, index) {
          String starredBusStop = starredBusStops[index];

          // Split the combined string into name and shortName
          List<String> parts = starredBusStop.split('|');
          String busStopName = parts[0];
          String busStopShortName = parts[1];

          return Column(
            children: [
              ListTile(
                title: Text(
                  busStopName,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                subtitle: Text(busStopShortName),
                trailing: IconButton(
                  icon: Icon(Icons.star, color: Colors.orange),
                  onPressed: () {
                    removeFromStarred(starredBusStop);
                  },
                ),
              ),
              Divider(
                color: Colors.grey,
                thickness: 0.5, // Set the thickness of the divider
              ),
            ],
          );
        },
      ),
    );
  }
}
