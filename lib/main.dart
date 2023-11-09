import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class BusStop {
  final String id;
  final String name;
  final LatLng position;

  BusStop({
    required this.id,
    required this.name,
    required this.position,
  });
}

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
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
    target: LatLng(2.998255379276642, 101.71427184760564),
    zoom: 14.8,
  );

  int _currentIndex = 0;

  final List<BusStop> busStopsRoute1 = [
    BusStop(
      id: 'SJ100-1',
      name: 'PFC',
      position: LatLng(2.991720962366472, 101.707556203837),
    ),
    BusStop(
      id: 'SJ162-1',
      name: 'KTAG',
      position: LatLng(2.9906065922278406, 101.71072672072536), // Replace with the actual coordinates
    ),
    BusStop(
      id: 'SJ164-1',
      name: 'K14',
      position: LatLng(2.9928782265949017, 101.71825515618721), // Replace with the actual coordinates
    ),
    BusStop(
      id: 'SJ144-1',
      name: 'FBMK',
      position: LatLng(2.9999843428909356, 101.71484887998834), // Replace with the actual coordinates
    ),
    BusStop(
      id: 'SJ155-1',
      name: 'FSKTM',
      position: LatLng(2.9999691454681097, 101.71106029602586),
    ),
    BusStop(
      id: 'SJ159-1',
      name: 'FS',
      position: LatLng(3.0007085010742323, 101.7068627631204), // Replace with the actual coordinates
    ),
    BusStop(
      id: 'SJ160-1',
      name: 'Library',
      position: LatLng(3.0026803506513735, 101.70695294223508), // Replace with the actual coordinates
    ),
    BusStop(
      id: 'SJ151-1',
      name: 'FPAS',
      position: LatLng(3.004266665826632, 101.70862908173052), // Replace with the actual coordinates
    ),
    BusStop(
      id: 'SJ153-1',
      name: 'Central',
      position: LatLng(3.0012917167440483, 101.70969564394254), // Replace with the actual coordinates
    ),
    BusStop(
      id: 'SJ824-1',
      name: 'KC',
      position: LatLng(2.995312111780624, 101.70886619987638), // Replace with the actual coordinates
    ),
  ];

  final List<BusStop> busStopsRoute2 = [
    BusStop(
      id: 'SJ163-2',
      name: 'SFC',
      position: LatLng(2.9921172880176776, 101.71541414629283), // Replace with the actual coordinates
    ),
    BusStop(
      id: 'SJ162-2',
      name: 'KTAG',
      position: LatLng(2.9906065922278406, 101.71072672072536), // Replace with the actual coordinates
    ),
    BusStop(
      id: 'SJ164-2',
      name: 'K14',
      position: LatLng(2.9928782265949017, 101.71825515618721), // Replace with the actual coordinates
    ),
    BusStop(
      id: 'SJ144-2',
      name: 'FBMK',
      position: LatLng(2.9999843428909356, 101.71484887998834), // Replace with the actual coordinates
    ),
    BusStop(
      id: 'SJ155-2',
      name: 'FSKTM',
      position: LatLng(2.9999691454681097, 101.71106029602586),
    ),
    BusStop(
      id: 'SJ159-2',
      name: 'FS',
      position: LatLng(3.0007085010742323, 101.7068627631204), // Replace with the actual coordinates
    ),
    BusStop(
      id: 'SJ160-2',
      name: 'Library',
      position: LatLng(3.0026803506513735, 101.70695294223508), // Replace with the actual coordinates
    ),
    BusStop(
      id: 'SJ151-2',
      name: 'FPAS',
      position: LatLng(3.004266665826632, 101.70862908173052), // Replace with the actual coordinates
    ),
    BusStop(
      id: 'SJ153-2',
      name: 'Central',
      position: LatLng(3.0012917167440483, 101.70969564394254), // Replace with the actual coordinates
    ),
    BusStop(
      id: 'SJ824-2',
      name: 'KC',
      position: LatLng(2.995312111780624, 101.70886619987638), // Replace with the actual coordinates
    ),
  ];



  Set<Marker> _route1BusStopMarkers = Set<Marker>();
  Set<Marker> _route2BusStopMarkers = Set<Marker>();

  Set<Polyline> _polylines = Set<Polyline>();

  List<LatLng> roadCoordinatesRoute1 = [
    LatLng(2.991720962366472, 101.707556203837), // Starting Bus Stop 1: PFC
    LatLng(2.991520998102801, 101.70761314769751),
    LatLng(2.9907171435228257, 101.70770010942849),
    LatLng(2.9905446607193134, 101.70792385780781),
    LatLng(2.9905097365655955, 101.71045675473334),
    LatLng(2.9905072547116167, 101.7107351014217), // Bus Stop 2: KTAG
    LatLng(2.9904946736271425, 101.71096985557979),
    LatLng(2.99049980914963, 101.71147818767012),
    LatLng(2.9905916377437958, 101.71179629817112),
    LatLng(2.9916886165838825, 101.71288980308277),
    LatLng(2.9918598643144136, 101.713128386008),
    LatLng(2.991934319839523, 101.71339927698149),
    LatLng(2.991951692801737, 101.71453503098758),
    LatLng(2.9919914024134493, 101.71489539058041),
    LatLng(2.992031112022719, 101.7157875911452),
    LatLng(2.99204352127737, 101.71760430046506),
    // LatLng(2.9921172880176776, 101.71541414629283), // Bus Stop 3: SFC
    LatLng(2.992080749034327, 101.7177061952349),
    LatLng(2.99208571273516, 101.7179547190638),
    LatLng(2.9921973959979273, 101.71807401050168),
    LatLng(2.9931256075864705, 101.71846916343922),
    LatLng(2.996440013231157, 101.7205277417902),
    // LatLng(2.9928782265949017, 101.71825515618721), // Bus Stop 4: K14
    LatLng(2.9975672469152785, 101.72105776309851),
    LatLng(2.999086804119085, 101.72156207812499),
    LatLng(2.9997640918100563, 101.72167511427119),
    LatLng(3.000510844418602, 101.72162294376237),
    LatLng(3.0012730688401286, 101.72146487994381),
    LatLng(3.0011646580101887, 101.72070279068615),
    LatLng(3.0011863401775227, 101.72055080704506),
    LatLng(3.0008806215873, 101.71918078323695),
    LatLng(3.0008199115020484, 101.7190613675413),
    LatLng(3.0003410640710824, 101.71645475588676),
    LatLng(2.99983507902807, 101.7136022394701),
    // LatLng(2.9999843428909356, 101.71484887998834), // Bus Stop 5: FBMK
    LatLng(2.9996889845279076, 101.71331661598855),
    LatLng(2.9996395257454487, 101.71323151466471),
    LatLng(2.9996333294751127, 101.71314245532906),
    LatLng(2.9996990325952884, 101.71307062573325),
    LatLng(2.999772467101826, 101.71305189178614),
    // LatLng(2.9999691454681097, 101.71106029602586),   // Bus Stop 6: FSKTM
    LatLng(3.0000203695270784, 101.71106249342165),
    LatLng(3.0001185557941703, 101.71014185112803),
    LatLng(3.0001542598898303, 101.7095161718703),
    LatLng(3.000186988642652, 101.70696876370917),
    // LatLng(3.0000203695270784, 101.71106249342165),
    LatLng(3.0006124623528008, 101.70698664021101),
    // LatLng(3.0007085010742323, 101.7068627631204),    // Bus Stop 7: FS
    LatLng(3.0023530348426792, 101.70698664021144),
    LatLng(3.0034211796681416, 101.70705516698143),
    // LatLng(3.0026803506513735, 101.70695294223508),   // Bus Stop 8: SAS Lib
    LatLng(3.0042334451045942, 101.70692109286725),
    LatLng(3.004177404041656, 101.70863004951426),
    // LatLng(3.004266665826632, 101.70862908173052),    // Bus Stop 9: FPAS
    LatLng(3.0041870229539565, 101.7093114243268),
    LatLng(3.004107556216379, 101.70947057651071),
    LatLng(3.0039353782651155, 101.70959436154261),
    LatLng(3.0036749038770028, 101.70966951674056),
    LatLng(3.0033895382720317, 101.70967643515753),
    LatLng(3.001899530705045, 101.70965419526968),
    // LatLng(3.0012917167440483, 101.70969564394254),   // Bus Stop 10: Central
    LatLng(2.998896976761488, 101.70954317562156),
    LatLng(2.9985806553319065, 101.70950061144056),
    LatLng(2.9962326921026965, 101.70900124582738),
    LatLng(2.995365191139604, 101.70876716817361),
    // LatLng(2.995312111780624, 101.70886619987638),    // Bus Stop 11: KC
    LatLng(2.9950547235768026, 101.70839058310906),
    LatLng(2.99502355585406, 101.70761552599876),
    LatLng(2.9950287504742055, 101.70744907081766),
    LatLng(2.994794992534458, 101.7072826155674),
    LatLng(2.993454643132772, 101.70724046748276),
    LatLng(2.9921930156259755, 101.70754115147894),
    LatLng(2.9920069415350716, 101.7075644424967),
    LatLng(2.991754412373068, 101.70760104265666),
    // LatLng(2.991720962366472, 101.707556203837),      // Terminating Bus Stop 1: PFC
  ];

  List<LatLng> roadCoordinatesRoute2 = [
    LatLng(2.991720962366472, 101.707556203837), // Starting Bus Stop 1: PFC
    LatLng(2.991520998102801, 101.70761314769751),
    LatLng(2.9907171435228257, 101.70770010942849),
    LatLng(2.9905446607193134, 101.70792385780781),
    LatLng(2.9905097365655955, 101.71045675473334),
    LatLng(2.9905072547116167, 101.7107351014217), // Bus Stop 2: KTAG
    LatLng(2.9904946736271425, 101.71096985557979),
    LatLng(2.99049980914963, 101.71147818767012),
    LatLng(2.9905916377437958, 101.71179629817112),
    LatLng(2.9916886165838825, 101.71288980308277),
    LatLng(2.9918598643144136, 101.713128386008),
    LatLng(2.991934319839523, 101.71339927698149),
    LatLng(2.991951692801737, 101.71453503098758),
    LatLng(2.9919914024134493, 101.71489539058041),
    LatLng(2.992031112022719, 101.7157875911452),
    LatLng(2.99204352127737, 101.71760430046506),
    // LatLng(2.9921172880176776, 101.71541414629283), // Bus Stop 3: SFC
    LatLng(2.992080749034327, 101.7177061952349),
    LatLng(2.99208571273516, 101.7179547190638),
    LatLng(2.9921973959979273, 101.71807401050168),
    LatLng(2.9931256075864705, 101.71846916343922),
    LatLng(2.996440013231157, 101.7205277417902),
    // LatLng(2.9928782265949017, 101.71825515618721), // Bus Stop 4: K14
    LatLng(2.9975672469152785, 101.72105776309851),
    LatLng(2.999086804119085, 101.72156207812499),
    LatLng(2.9997640918100563, 101.72167511427119),
    LatLng(3.000510844418602, 101.72162294376237),
    LatLng(3.0012730688401286, 101.72146487994381),
    LatLng(3.0011646580101887, 101.72070279068615),
    LatLng(3.0011863401775227, 101.72055080704506),
    LatLng(3.0008806215873, 101.71918078323695),
    LatLng(3.0008199115020484, 101.7190613675413),
    LatLng(3.0003410640710824, 101.71645475588676),
    LatLng(2.99983507902807, 101.7136022394701),
    // LatLng(2.9999843428909356, 101.71484887998834), // Bus Stop 5: FBMK
    LatLng(2.9996889845279076, 101.71331661598855),
    LatLng(2.9996395257454487, 101.71323151466471),
    LatLng(2.9996333294751127, 101.71314245532906),
    LatLng(2.9996990325952884, 101.71307062573325),
    LatLng(2.999772467101826, 101.71305189178614),
    // LatLng(2.9999691454681097, 101.71106029602586),   // Bus Stop 6: FSKTM
    LatLng(3.0000203695270784, 101.71106249342165),
    LatLng(3.0001185557941703, 101.71014185112803),
    LatLng(3.0001542598898303, 101.7095161718703),
    LatLng(3.000186988642652, 101.70696876370917),
    // LatLng(3.0000203695270784, 101.71106249342165),
    LatLng(3.0006124623528008, 101.70698664021101),
    // LatLng(3.0007085010742323, 101.7068627631204),    // Bus Stop 7: FS
    LatLng(3.0023530348426792, 101.70698664021144),
    LatLng(3.0034211796681416, 101.70705516698143),
    // LatLng(3.0026803506513735, 101.70695294223508),   // Bus Stop 8: SAS Lib
    LatLng(3.0042334451045942, 101.70692109286725),
    LatLng(3.004177404041656, 101.70863004951426),
    // LatLng(3.004266665826632, 101.70862908173052),    // Bus Stop 9: FPAS
    LatLng(3.0041870229539565, 101.7093114243268),
    LatLng(3.004107556216379, 101.70947057651071),
    LatLng(3.0039353782651155, 101.70959436154261),
    LatLng(3.0036749038770028, 101.70966951674056),
    LatLng(3.0033895382720317, 101.70967643515753),
    LatLng(3.001899530705045, 101.70965419526968),
    // LatLng(3.0012917167440483, 101.70969564394254),   // Bus Stop 10: Central
    LatLng(2.998896976761488, 101.70954317562156),
    LatLng(2.9985806553319065, 101.70950061144056),
    LatLng(2.9962326921026965, 101.70900124582738),
    LatLng(2.995365191139604, 101.70876716817361),
    // LatLng(2.995312111780624, 101.70886619987638),    // Bus Stop 11: KC
    LatLng(2.9950547235768026, 101.70839058310906),
    LatLng(2.99502355585406, 101.70761552599876),
    LatLng(2.9950287504742055, 101.70744907081766),
    LatLng(2.994794992534458, 101.7072826155674),
    LatLng(2.993454643132772, 101.70724046748276),
    LatLng(2.9921930156259755, 101.70754115147894),
    LatLng(2.9920069415350716, 101.7075644424967),
    LatLng(2.991754412373068, 101.70760104265666),
    // LatLng(2.991720962366472, 101.707556203837),      // Terminating Bus Stop 1: PFC
  ];


  List<Widget> _pages = [];
  int _selectedRoute = 1;

  @override
  void initState() {
    super.initState();

    // Create Bus Stop markers for Route 1
    _route1BusStopMarkers.addAll(busStopsRoute1.map((busStop) {
      return Marker(
        markerId: MarkerId(busStop.id),
        position: busStop.position,
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue),
        infoWindow: InfoWindow(
          title: busStop.name,
          snippet: '',
        ),
      );
    }));

    // Create Bus Stop markers for Route 2
    _route2BusStopMarkers.addAll(busStopsRoute2.map((busStop) {
      return Marker(
        markerId: MarkerId(busStop.id),
        position: busStop.position,
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed),
        infoWindow: InfoWindow(
          title: busStop.name,
          snippet: '',
        ),
      );
    }));

    // Initialize the polylines for Route 1 (blue).
    _polylines.add(Polyline(
      polylineId: PolylineId('route1'),
      color: Colors.blueAccent,
      width: 7,
      points: roadCoordinatesRoute1,
    ));

    // Initialize the polylines for Route 2 (red).
    _polylines.add(Polyline(
      polylineId: PolylineId('route2'),
      color: Colors.red, // Set the color to red for Route 2.
      width: 7,
      points: roadCoordinatesRoute2, // Replace with Route 2 coordinates.
    ));

    _pages = [
      // GoogleMap(
      //   mapType: MapType.normal,
      //   myLocationButtonEnabled: false,
      //   zoomControlsEnabled: false,
      //   markers: _markers,
      //   polylines: _polylines,
      //   initialCameraPosition: _initialCameraPosition,
      //   onMapCreated: (GoogleMapController controller) {
      //     // You can interact with the Google Map here
      //   },
      // ),
      const Text('Bus Stops'),
      const Text('Bus Routes'),
      const Text('Navigation'),
      const Text('Starred'),
      const Text('Messages'),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.menu),
          onPressed: () {
            // Handle menu button tap
          },
        ),
        title: Text('Search Bus Stops'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              // Handle search button tap
            },
          ),
        ],
      ),
      
      body: _currentIndex == 1 // Check if the Bus Routes tab is selected.
          ? Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    _selectedRoute = 1; // Switch to Route 1.
                  });
                },
                style: ElevatedButton.styleFrom(
                  primary: _selectedRoute == 1 ? Colors.blue : Colors.grey,
                ),
                child: Text('Route 1'),
              ),
              SizedBox(width: 16),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    _selectedRoute = 2; // Switch to Route 2.
                  });
                },
                style: ElevatedButton.styleFrom(
                  primary: _selectedRoute == 2 ? Colors.red : Colors.grey,
                ),
                child: Text('Route 2'),
              ),
            ],
          ),
          Expanded(
            child: GoogleMap(
              mapType: MapType.normal,
              myLocationButtonEnabled: false,
              zoomControlsEnabled: false,
              markers: _selectedRoute == 1 ? _route1BusStopMarkers : _route2BusStopMarkers,
              polylines: _polylines.where((polyline) {
                // Filter and display the selected route.
                if (_selectedRoute == 1) {
                  return polyline.polylineId.value == 'route1';
                } else {
                  return polyline.polylineId.value == 'route2';
                }
              }).toSet(),
              initialCameraPosition: _initialCameraPosition,
              onMapCreated: (GoogleMapController controller) {
                // You can interact with the Google Map here
              },
            ),
          ),
        ],
      )

          : _pages[_currentIndex],
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
            label: 'Bus Stop',
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
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.black,
      ),
    );
  }
}
