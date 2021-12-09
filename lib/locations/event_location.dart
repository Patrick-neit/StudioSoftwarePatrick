import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class EventLocation extends StatefulWidget {
  const EventLocation({Key? key}) : super(key: key);

  @override
  _EventLocationState createState() => _EventLocationState();
}

class _EventLocationState extends State<EventLocation> {
  final Completer<GoogleMapController> _controller = Completer();
  final Map<MarkerId, Marker> _markers = {};
  Set<Marker> get markers => _markers.values.toSet();

//Posicion inicial
  final CameraPosition _initialubication = const CameraPosition(
    target: LatLng(-17.7335177, -63.1256928), //Mi casita xd
    zoom: 16,
  );

  static const CameraPosition camPositionUb = CameraPosition(
      //Place position destination (Ficct)
      bearing: 192.8334901395799,
      target: LatLng(-17.7982188, -63.1940863),
      tilt: 59.440717697143555,
      zoom: 19.151926040649414);

  static const Polyline _kPolyline = Polyline(
    polylineId: PolylineId('_kPolyline'),
    points: [
      LatLng(-17.7335177,
          -63.1256928), //Añadimos los 2 markers con nuestra ubicacion y destino
      LatLng(-17.7982188, -63.1940863),
    ],
    width: 5,
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GoogleMap(
        mapType: MapType.normal,
        initialCameraPosition: _initialubication,
        myLocationButtonEnabled: true, //Hide the buttom witch contains my ub
        scrollGesturesEnabled: true, //Block/allow the Scrolled movement
        zoomGesturesEnabled: false, //Block the zoom
        compassEnabled: true, //Gira el mapa
        markers: createmarker(), //Llamo a mis markers que cree abajo
        polylines: {
          //Intancio las 2 ubicaciones de mi clase polyline
          _kPolyline,
        },

        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: _goToTheEvent,
        label: const Text('Ver locacion'),
        icon: const Icon(Icons.directions_bike_rounded),
      ),
    );
  }

  Future<void> _goToTheEvent() async {
    // _getMyPosition();
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(camPositionUb));
  }

  Set<Marker> createmarker() {
    var mk = <Marker>{};
    mk.add(const Marker(
      markerId: MarkerId("frompoint"),
      position: LatLng(-17.7335177, -63.1256928),
      infoWindow: InfoWindow(title: "Estas aqui!"),
    ));
    mk.add(const Marker(
      markerId: MarkerId("ToPoint"),
      position: LatLng(-17.7982188, -63.1940863),
      infoWindow: InfoWindow(title: "Salon de eventos Casino"),
    ));
    return mk;
  }
}
