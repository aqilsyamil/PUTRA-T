import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'PUTRA T',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: MapScreen(),
    );
  }
}

class MapScreen extends StatefulWidget {
  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  static const _initialCameraPosition = CameraPosition(
    target: LatLng(2.999806580581811, 101.71042853446261),
    zoom: 15.5,
  );

  int _currentIndex = 0; // Current index for the selected bottom navigation bar item
  MapType _currentMapType = MapType.normal; // Track the selected map type

  final List<Widget> _pages = [
    GoogleMap(
        mapType: MapType.normal,
        myLocationButtonEnabled: false,
        zoomControlsEnabled: false,
        initialCameraPosition: _initialCameraPosition,
        onMapCreated: (GoogleMapController controller) {
          // You can interact with the Google Map here
        }
    ),
    const Text('Bus Routes'),
    const Text('Navigation'),
    const Text('Starred'),
    const Text('Messages'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.menu), // Hamburger icon
          onPressed: () {
            // Handle menu button tap
          },
        ),
        title: Text('Search Bus Stops'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search), // Magnifying glass icon
            onPressed: () {
              // Handle search button tap
            },
          ),
        ],
      ),

      body: _pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.location_on),
            label: 'Bus Stops',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.directions_bus),
            label: 'Bus Routes',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.navigation),
            label: 'Navigation',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star),
            label: 'Starred',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.message),
            label: 'Messages',
          ),
        ],
        selectedItemColor: Colors.blue, // Set the selected item color to blue
        unselectedItemColor: Colors.black, // Set the unselected item color to black
      ),
      // ToggleButtons to switch between Map and Satellite views
      bottomSheet: ToggleButtons(
        isSelected: [
          _currentMapType == MapType.normal,
          _currentMapType == MapType.satellite,
        ],
        onPressed: (int index) {
          setState(() {
            if (index == 0) {
              _currentMapType = MapType.normal;
              _pages[0] =  GoogleMap(
                  mapType: MapType.normal,
                  myLocationButtonEnabled: false,
                  zoomControlsEnabled: false,
                  initialCameraPosition: _initialCameraPosition,
                  onMapCreated: (GoogleMapController controller) {
                    // You can interact with the Google Map here
                  }
              );
            } else {
              _currentMapType = MapType.satellite;
              _pages[0] =  GoogleMap(
                  mapType: MapType.satellite,
                  myLocationButtonEnabled: false,
                  zoomControlsEnabled: false,
                  initialCameraPosition: _initialCameraPosition,
                  onMapCreated: (GoogleMapController controller) {
                    // You can interact with the Google Map here
                  }
              );
            }
          });
        },
        children: const [
          Icon(Icons.map),
          Icon(Icons.satellite),
        ],
      ),
    );
  }
}
