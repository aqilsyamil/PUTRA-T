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
      position: LatLng(2.9906065922278406,
          101.71072672072536), // Replace with the actual coordinates
    ),
    BusStop(
      id: 'SJ164-1',
      name: 'K14',
      position: LatLng(2.9928782265949017,
          101.71825515618721), // Replace with the actual coordinates
    ),
    BusStop(
      id: 'SJ144-1',
      name: 'FBMK',
      position: LatLng(2.9999843428909356,
          101.71484887998834), // Replace with the actual coordinates
    ),
    BusStop(
      id: 'SJ155-1',
      name: 'FSKTM',
      position: LatLng(2.9999691454681097, 101.71106029602586),
    ),
    BusStop(
      id: 'SJ159-1',
      name: 'FS',
      position: LatLng(3.0007085010742323,
          101.7068627631204), // Replace with the actual coordinates
    ),
    BusStop(
      id: 'SJ160-1',
      name: 'Library',
      position: LatLng(3.0026803506513735,
          101.70695294223508), // Replace with the actual coordinates
    ),
    BusStop(
      id: 'SJ151-1',
      name: 'FPAS',
      position: LatLng(3.004266665826632,
          101.70862908173052), // Replace with the actual coordinates
    ),
    BusStop(
      id: 'SJ153-1',
      name: 'Central',
      position: LatLng(3.0012917167440483,
          101.70969564394254), // Replace with the actual coordinates
    ),
    BusStop(
      id: 'SJ824-1',
      name: 'KC',
      position: LatLng(2.995312111780624,
          101.70886619987638), // Replace with the actual coordinates
    ),
  ];

  final List<BusStop> busStopsRoute2 = [
    BusStop(
      id: 'SJ163-2',
      name: 'SFC',
      position: LatLng(2.9921172880176776,
          101.71541414629283), // Replace with the actual coordinates
    ),
    BusStop(
      id: 'SJ162-2',
      name: 'KTAG',
      position: LatLng(2.9906065922278406,
          101.71072672072536), // Replace with the actual coordinates
    ),
    BusStop(
      id: 'SJ164-2',
      name: 'K14',
      position: LatLng(2.9928782265949017,
          101.71825515618721), // Replace with the actual coordinates
    ),
    BusStop(
      id: 'SJ144-2',
      name: 'FBMK',
      position: LatLng(2.9999843428909356,
          101.71484887998834), // Replace with the actual coordinates
    ),
    BusStop(
      id: 'SJ155-2',
      name: 'FSKTM',
      position: LatLng(2.9999691454681097, 101.71106029602586),
    ),
    BusStop(
      id: 'SJ159-2',
      name: 'FS',
      position: LatLng(3.0007085010742323,
          101.7068627631204), // Replace with the actual coordinates
    ),
    BusStop(
      id: 'SJ160-2',
      name: 'Library',
      position: LatLng(3.0026803506513735,
          101.70695294223508), // Replace with the actual coordinates
    ),
    BusStop(
      id: 'SJ151-2',
      name: 'FPAS',
      position: LatLng(3.004266665826632,
          101.70862908173052), // Replace with the actual coordinates
    ),
    BusStop(
      id: 'SJ153-2',
      name: 'Central',
      position: LatLng(3.0012917167440483,
          101.70969564394254), // Replace with the actual coordinates
    ),
    BusStop(
      id: 'SJ824-2',
      name: 'KC',
      position: LatLng(2.995312111780624,
          101.70886619987638), // Replace with the actual coordinates
    ),
  ];

  final List<BusStop> busStopsRoute3 = [
    BusStop(
      id: '111',
      name: 'FRSB',
      position: LatLng(3.003399376837077, 101.72039834803533), // Replace with the actual coordinates
    ),
    BusStop(
      id: 'SJ144-3',
      name: 'FBMK',
      position: LatLng(2.9999843428909356,
          101.71484887998834), // Replace with the actual coordinates
    ),
    BusStop(
      id: 'SJ155-3',
      name: 'FSKTM',
      position: LatLng(2.9999691454681097, 101.71106029602586),
    ),
    BusStop(
      id: 'SJ159-3',
      name: 'FS',
      position: LatLng(3.0007085010742323,
          101.7068627631204), // Replace with the actual coordinates
    ),
    BusStop(
      id: 'SJ160-3',
      name: 'Library',
      position: LatLng(3.0026803506513735,
          101.70695294223508), // Replace with the actual coordinates
    ),
    BusStop(
      id: 'SJ151-3',
      name: 'FPAS',
      position: LatLng(3.004266665826632,
          101.70862908173052), // Replace with the actual coordinates
    ),
    BusStop(
      id: 'SJ153-3',
      name: 'Central',
      position: LatLng(3.0012917167440483,
          101.70969564394254), // Replace with the actual coordinates
    ),
    BusStop(
      id: '1111',
      name: 'K10',
      position: LatLng(3.0098003882950177, 101.71972624064571), // Replace with the actual coordinates
    ),

  ];

  final List<BusStop> busStopsRoute4 = [
    BusStop(
      id: 'SJ163-4',
      name: 'SFC',
      position: LatLng(2.9921172880176776,
          101.71541414629283), // Replace with the actual coordinates
    ),
    BusStop(
      id: 'SJ162-4',
      name: 'KTAG',
      position: LatLng(2.9906065922278406,
          101.71072672072536), // Replace with the actual coordinates
    ),
    BusStop(
      id: 'SJ164-4',
      name: 'K14',
      position: LatLng(2.9928782265949017,
          101.71825515618721), // Replace with the actual coordinates
    ),
    BusStop(
      id: 'SJ144-4',
      name: 'FBMK',
      position: LatLng(2.9999843428909356,
          101.71484887998834), // Replace with the actual coordinates
    ),
    BusStop(
      id: 'SJ155-4',
      name: 'FSKTM',
      position: LatLng(2.9999691454681097, 101.71106029602586),
    ),
    BusStop(
      id: 'SJ159-4',
      name: 'FS',
      position: LatLng(3.0007085010742323,
          101.7068627631204), // Replace with the actual coordinates
    ),
    BusStop(
      id: 'SJ160-4',
      name: 'Library',
      position: LatLng(3.0026803506513735,
          101.70695294223508), // Replace with the actual coordinates
    ),
    BusStop(
      id: 'SJ151-4',
      name: 'FPAS',
      position: LatLng(3.004266665826632,
          101.70862908173052), // Replace with the actual coordinates
    ),
    BusStop(
      id: 'SJ153-4',
      name: 'Central',
      position: LatLng(3.0012917167440483,
          101.70969564394254), // Replace with the actual coordinates
    ),
    BusStop(
      id: 'SJ824-4',
      name: 'KC',
      position: LatLng(2.995312111780624,
          101.70886619987638), // Replace with the actual coordinates
    ),
  ];

  final List<BusStop> busStopsRoute5 = [
    BusStop(
      id: 'SJ163-5',
      name: 'SFC',
      position: LatLng(2.9921172880176776,
          101.71541414629283), // Replace with the actual coordinates
    ),
    BusStop(
      id: 'SJ162-5',
      name: 'KTAG',
      position: LatLng(2.9906065922278406,
          101.71072672072536), // Replace with the actual coordinates
    ),
    BusStop(
      id: 'SJ164-5',
      name: 'K14',
      position: LatLng(2.9928782265949017,
          101.71825515618721), // Replace with the actual coordinates
    ),
    BusStop(
      id: 'SJ144-5',
      name: 'FBMK',
      position: LatLng(2.9999843428909356,
          101.71484887998834), // Replace with the actual coordinates
    ),
    BusStop(
      id: 'SJ155-5',
      name: 'FSKTM',
      position: LatLng(2.9999691454681097, 101.71106029602586),
    ),
    BusStop(
      id: 'SJ159-5',
      name: 'FS',
      position: LatLng(3.0007085010742323,
          101.7068627631204), // Replace with the actual coordinates
    ),
    BusStop(
      id: 'SJ160-5',
      name: 'Library',
      position: LatLng(3.0026803506513735,
          101.70695294223508), // Replace with the actual coordinates
    ),
    BusStop(
      id: 'SJ151-5',
      name: 'FPAS',
      position: LatLng(3.004266665826632,
          101.70862908173052), // Replace with the actual coordinates
    ),
    BusStop(
      id: 'SJ153-5',
      name: 'Central',
      position: LatLng(3.0012917167440483,
          101.70969564394254), // Replace with the actual coordinates
    ),
    BusStop(
      id: 'SJ824-5',
      name: 'KC',
      position: LatLng(2.995312111780624,
          101.70886619987638), // Replace with the actual coordinates
    ),
  ];

  Set<Marker> _route1BusStopMarkers = Set<Marker>();
  Set<Marker> _route2BusStopMarkers = Set<Marker>();
  Set<Marker> _route3BusStopMarkers = Set<Marker>();
  Set<Marker> _route4BusStopMarkers = Set<Marker>();
  Set<Marker> _route5BusStopMarkers = Set<Marker>();

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

  List<LatLng> roadCoordinatesRoute3 = [
    // LatLng(2.991720962366472, 101.707556203837), // Starting Bus Stop 1: PFC
    // LatLng(2.991520998102801, 101.70761314769751),
    // LatLng(2.9907171435228257, 101.70770010942849),
    // LatLng(2.9905446607193134, 101.70792385780781),
    // LatLng(2.9905097365655955, 101.71045675473334),
    // LatLng(2.9905072547116167, 101.7107351014217), // Bus Stop 2: KTAG
    // LatLng(2.9904946736271425, 101.71096985557979),
    // LatLng(2.99049980914963, 101.71147818767012),
    // LatLng(2.9905916377437958, 101.71179629817112),
    // LatLng(2.9916886165838825, 101.71288980308277),
    // LatLng(2.9918598643144136, 101.713128386008),
    // LatLng(2.991934319839523, 101.71339927698149),
    // LatLng(2.991951692801737, 101.71453503098758),
    // LatLng(2.9919914024134493, 101.71489539058041),
    // LatLng(2.992031112022719, 101.7157875911452),
    // LatLng(2.99204352127737, 101.71760430046506),
    // // LatLng(2.9921172880176776, 101.71541414629283), // Bus Stop 3: SFC
    // LatLng(2.992080749034327, 101.7177061952349),
    // LatLng(2.99208571273516, 101.7179547190638),
    // LatLng(2.9921973959979273, 101.71807401050168),
    // LatLng(2.9931256075864705, 101.71846916343922),
    // LatLng(2.996440013231157, 101.7205277417902),
    // // LatLng(2.9928782265949017, 101.71825515618721), // Bus Stop 4: K14
    // LatLng(2.9975672469152785, 101.72105776309851),
    // LatLng(2.999086804119085, 101.72156207812499),
    // LatLng(2.9997640918100563, 101.72167511427119),
    // LatLng(3.000510844418602, 101.72162294376237),
    // LatLng(3.0012730688401286, 101.72146487994381),
    // LatLng(3.0011646580101887, 101.72070279068615),
    // LatLng(3.0011863401775227, 101.72055080704506),
    // LatLng(3.0008806215873, 101.71918078323695),
    // LatLng(3.0008199115020484, 101.7190613675413),
    // LatLng(3.0003410640710824, 101.71645475588676),
    // LatLng(2.99983507902807, 101.7136022394701),
    // LatLng(2.9999843428909356, 101.71484887998834), // Bus Stop 5: FBMK

    // LatLng(),
    // LatLng(),
    // LatLng(),
    LatLng(3.0093538865047247, 101.72009214034568),
    LatLng(3.0101157734443866, 101.71930137344236),
    LatLng(3.0100023009552275, 101.71918542521605),
    LatLng(3.009302939624124, 101.71863583062286),
    LatLng(3.008862943858412, 101.71838306348924),
    LatLng(3.008388211378421, 101.71935007169816),
    LatLng(3.0081705291049845, 101.719918218007),
    LatLng(3.008089769046511, 101.72006386303954),
    LatLng(3.006928410088234, 101.7197507679799),
    LatLng(3.004157288897445, 101.71869689611795),
    LatLng(3.0036423427403927, 101.718524564189),
    LatLng(3.0035385499205116, 101.71849908320343),
    LatLng(3.003490336479989, 101.71853194026376),
    LatLng(3.0034401141438543, 101.718532610816),
    LatLng(3.0033430176194758, 101.71891147283888),
    LatLng(3.0032847305399, 101.71934458206985),
    LatLng(3.0032740164397893, 101.71967315267538),
    LatLng(3.0033302654646694, 101.7200634140858),
    LatLng(3.0033858448581743, 101.7202625681061),
    LatLng(3.0037012411095123, 101.72097067128477),
    LatLng(3.003755481219468, 101.72105717252522),
    LatLng(3.003754120727928, 101.7210610112958),
    LatLng(3.0036940632957787, 101.72097484046687),
    LatLng(3.003375848481385, 101.72025495499703),
    LatLng(3.003289796010455, 101.71987257194365),
    LatLng(3.003266490131738, 101.71966522338656),
    LatLng(3.0032742946755655, 101.71936643441617),
    LatLng(3.0032943059470214, 101.71912287788415),
    LatLng(3.0033291267716424, 101.71893579380595),
    LatLng(3.0034179462709103, 101.71857130994493),
    LatLng(3.003331397046497, 101.71848464167597),
    LatLng(3.0031655110138944, 101.71844672430831),
    LatLng(3.0025722879172534, 101.71845214107508),
    LatLng(3.0019285773840876, 101.71847200255311),
    LatLng(3.0017771160303703, 101.7184557522527),
    LatLng(3.001232576217443, 101.71838352869486),
    LatLng(3.0009621093235688, 101.71838172310466),
    LatLng(3.00084671009157, 101.7183853342825),
    LatLng(3.0007186890600788, 101.71837269515991),
    LatLng(3.000659186322035, 101.7182625542348),
    LatLng(3.0003149731535643, 101.71644342325106),
    LatLng(3.0002986887888468, 101.7161752683438),
    LatLng(3.0000115823288986, 101.71483896409994),
    // LatLng(),
    LatLng(2.9997766568925877, 101.71356585827048),
    LatLng(2.999740381636913, 101.71351396536981),
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
    // // LatLng(3.0012917167440483, 101.70969564394254),   // Bus Stop 10: Central
    LatLng(3.001449760030355, 101.7096414321997),
    LatLng(3.0004268680619797, 101.70959379049657),
    LatLng(3.0002875145695573, 101.709762093027),
    LatLng(3.000182170743548, 101.70994083729175),
    LatLng(3.00006147722427, 101.71151866751302),
    LatLng(3.0000175524818973, 101.71204907516292),
    LatLng(2.999834102062915, 101.71310471575566),
    LatLng(2.999870275386367, 101.71315905019783),
    LatLng(2.999867691577596, 101.71323667082955),
    LatLng(2.999813431591846, 101.7133246408788),
    LatLng(2.999836685871775, 101.71350316833167),
    LatLng(2.999859940150928, 101.7136325360574),
    LatLng(3.0002707656728695, 101.71571794369557),
    LatLng(3.0003999560650985, 101.71632597198129),
    LatLng(3.0004387131785815, 101.716393243197),
    LatLng(3.000800446169597, 101.71810607180682),
    LatLng(3.0009063822341115, 101.71819921656486),
    LatLng(3.00101490209442, 101.7182432015895),
    LatLng(3.0014424837976907, 101.7182708647747),
    LatLng(3.0019739300635315, 101.71835069123985),
    LatLng(3.0027559148132053, 101.71831267863739),
    LatLng(3.0033554367770128, 101.71830707037152),

    LatLng(3.0035017901293273, 101.71828441463371),
    LatLng(3.0035860253112086, 101.7184489683344),
    LatLng(3.003514218271321, 101.71855129584574),
    LatLng(3.003449315750435, 101.71856927230043),

    LatLng(3.0033666254284896, 101.71890585928146),
    LatLng(3.003358085399534, 101.71893301840306),
    LatLng(3.003339104722436, 101.71912122983139),
    LatLng(3.0033110707254527, 101.71934581027307),
    LatLng(3.00329787825603, 101.7196694703214),
    // LatLng(3.0032861958057424, 101.71966989550229),
    LatLng(3.0033380929212763, 101.72004934799422),
    LatLng(3.003390813796452, 101.72024897299971),
    LatLng(3.0036995685148744, 101.72093871939894),
    LatLng(3.0037793517231766, 101.72107261804666),
    LatLng(3.0037401958235037, 101.72108687614508),
    LatLng(3.0036618840199343, 101.72096330595869),
    LatLng(3.003356113979596, 101.72027414614973),
    LatLng(3.003299519979326, 101.72006408420569),
    LatLng(3.0032627001260006, 101.71987383245555),
    LatLng(3.0032420810076075, 101.71967325696706),
    LatLng(3.0032509177726707, 101.71933699805987),
    LatLng(3.003268591302621, 101.71911282545206),
    LatLng(3.003308356743932, 101.71893142262056),
    LatLng(3.00341881629555, 101.71851109898655),
    LatLng(3.003362850124128, 101.71846685439351),
    LatLng(3.003362850124128, 101.71838868894578),
    LatLng(3.0034497449679933, 101.71831642277712),
    LatLng(3.0035867147925903, 101.71836214218995),
    LatLng(3.0042353828617068, 101.71861969021239),
    LatLng(3.0070334636022196, 101.71965125226217),
    LatLng(3.008123900547188, 101.71993917463685),
    LatLng(3.0082353849073913, 101.71960911390923),
    LatLng(3.008354139967417, 101.71934700686113),
    LatLng(3.0090884822131927, 101.71984209795279),
    LatLng(3.0093538865047247, 101.72009214034568),

  ];

  List<LatLng> roadCoordinatesRoute4 = [
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

  List<LatLng> roadCoordinatesRoute5 = [
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
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueYellow),
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
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueYellow),
        infoWindow: InfoWindow(
          title: busStop.name,
          snippet: '',
        ),
      );
    }));

    // Create Bus Stop markers for Route 3
    _route3BusStopMarkers.addAll(busStopsRoute3.map((busStop) {
      return Marker(
        markerId: MarkerId(busStop.id),
        position: busStop.position,
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueYellow),
        infoWindow: InfoWindow(
          title: busStop.name,
          snippet: '',
        ),
      );
    }));

    // Create Bus Stop markers for Route 4
    _route4BusStopMarkers.addAll(busStopsRoute4.map((busStop) {
      return Marker(
        markerId: MarkerId(busStop.id),
        position: busStop.position,
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueYellow),
        infoWindow: InfoWindow(
          title: busStop.name,
          snippet: '',
        ),
      );
    }));

    // Create Bus Stop markers for Route 5
    _route5BusStopMarkers.addAll(busStopsRoute5.map((busStop) {
      return Marker(
        markerId: MarkerId(busStop.id),
        position: busStop.position,
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueYellow),
        infoWindow: InfoWindow(
          title: busStop.name,
          snippet: '',
        ),
      );
    }));


    // Initialize the polylines for Route 1 (blue).
    _polylines.add(Polyline(
      polylineId: PolylineId('route1'),
      color: Colors.blue,
      width: 6,
      points: roadCoordinatesRoute1,
    ));

    // Initialize the polylines for Route 2 (red).
    _polylines.add(Polyline(
      polylineId: PolylineId('route2'),
      color: Colors.green, // Set the color to red for Route 2.
      width: 6,
      points: roadCoordinatesRoute2, // Replace with Route 2 coordinates.
    ));

    // Initialize the polylines for Route 3 (green).
    _polylines.add(Polyline(
      polylineId: PolylineId('route3'),
      color: Colors.orange, // Set the color to red for Route 3.
      width: 6,
      points: roadCoordinatesRoute3, // Replace with Route 3 coordinates.
    ));

    // Initialize the polylines for Route 4 (purple).
    _polylines.add(Polyline(
      polylineId: PolylineId('route4'),
      color: Colors.lightBlueAccent, // Set the color to red for Route 4.
      width: 6,
      points: roadCoordinatesRoute4, // Replace with Route 4 coordinates.
    ));

    // Initialize the polylines for Route 4 (purple).
    _polylines.add(Polyline(
      polylineId: PolylineId('route5'),
      color: Colors.deepPurple, // Set the color to red for Route 4.
      width: 6,
      points: roadCoordinatesRoute5, // Replace with Route 4 coordinates.
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
          Expanded(
            child: GoogleMap(
              mapType: MapType.normal,
              myLocationButtonEnabled: false,
              zoomControlsEnabled: false,
              markers: _selectedRoute == 1
                  ? _route1BusStopMarkers
                  : _selectedRoute == 2
                  ? _route2BusStopMarkers
                  : _selectedRoute == 3
                  ? _route3BusStopMarkers
                  : _selectedRoute == 4
                  ? _route4BusStopMarkers
                  : _route5BusStopMarkers,

              polylines: _polylines.where((polyline) {
                // Filter and display the selected route.
                if (_selectedRoute == 1) {
                  return polyline.polylineId.value == 'route1';
                } else if (_selectedRoute == 2) {
                  return polyline.polylineId.value == 'route2';
                } else if (_selectedRoute == 3) {
                  return polyline.polylineId.value == 'route3';
                } else if (_selectedRoute == 4) {
                  return polyline.polylineId.value == 'route4';
                } else {
                  return polyline.polylineId.value == 'route5';
                }
              }).toSet(),
              initialCameraPosition: _initialCameraPosition,
              onMapCreated: (GoogleMapController controller) {
                // You can interact with the Google Map here
              },
            ),
          ),

          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    _selectedRoute = 1; // Switch to Route 1.
                  });
                },
                style: ElevatedButton.styleFrom(
                  primary:
                  _selectedRoute == 1 ? Colors.blue : Colors.white,
                  minimumSize: Size(400, 50), // Set the width and height for a wider button
                  shape: RoundedRectangleBorder( // Adjust the button's shape
                    borderRadius: BorderRadius.circular(0), // You can change the value to make it less curved
                  ),
                ),
                child: Text('Route 1',
                  style: TextStyle(
                    color: _selectedRoute == 1 ? Colors.white : Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),

              SizedBox(width: 16),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    _selectedRoute = 2; // Switch to Route 2.
                  });
                },
                style: ElevatedButton.styleFrom(
                  primary: _selectedRoute == 2 ? Colors.green : Colors.white,
                  minimumSize: Size(400, 50), // Set the width and height for a wider button
                  shape: RoundedRectangleBorder( // Adjust the button's shape
                    borderRadius: BorderRadius.circular(0), // You can change the value to make it less curved
                  ),
                ),
                child: Text('Route 2',
                  style: TextStyle(
                    color: _selectedRoute == 2 ? Colors.white : Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),

          SizedBox(width: 16),
          ElevatedButton(
            onPressed: () {
              setState(() {
                _selectedRoute = 3; // Switch to Route 3.
              });
            },
            style: ElevatedButton.styleFrom(
              primary: _selectedRoute == 3 ? Colors.orange : Colors.white,
              minimumSize: Size(400, 50), // Set the width and height for a wider button
              shape: RoundedRectangleBorder( // Adjust the button's shape
                borderRadius: BorderRadius.circular(0), // You can change the value to make it less curved
              ),
            ),
            child: Text('Route 3',
              style: TextStyle(
                color: _selectedRoute == 3 ? Colors.white : Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),

          SizedBox(width: 16),
          ElevatedButton(
            onPressed: () {
              setState(() {
                _selectedRoute = 4; // Switch to Route 4.
              });
            },
            style: ElevatedButton.styleFrom(
              primary: _selectedRoute == 4 ? Colors.lightBlueAccent : Colors.white,
              minimumSize: Size(400, 50), // Set the width and height for a wider button
              shape: RoundedRectangleBorder( // Adjust the button's shape
                borderRadius: BorderRadius.circular(0), // You can change the value to make it less curved
              ),
            ),
            child: Text('Route 4',
              style: TextStyle(
                color: _selectedRoute == 4 ? Colors.white : Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),

          SizedBox(width: 16),
          ElevatedButton(
            onPressed: () {
              setState(() {
                _selectedRoute = 5; // Switch to Route 4.
              });
            },
            style: ElevatedButton.styleFrom(
              primary: _selectedRoute == 5 ? Colors.deepPurple : Colors.white,
              minimumSize: Size(400, 50), // Set the width and height for a wider button
              shape: RoundedRectangleBorder( // Adjust the button's shape
                borderRadius: BorderRadius.circular(0), // You can change the value to make it less curved
              ),
            ),
            child: Text('Route 5',
              style: TextStyle(
                color: _selectedRoute == 5 ? Colors.white : Colors.black,
                fontWeight: FontWeight.bold,
              ),
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
        selectedItemColor: Colors.blueAccent,
        unselectedItemColor: Colors.black,
      ),
    );
  }
}
