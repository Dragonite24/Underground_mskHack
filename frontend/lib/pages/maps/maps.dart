import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

void main() => runApp(MyApp2());

class MyApp2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Google Maps Demo',
      home: MapsView(),
    );
  }
}

class MapsView extends StatefulWidget {
  const MapsView({Key key}) : super(key: key);

  @override
  _MapsViewState createState() => _MapsViewState();
}

class _MapsViewState extends State<MapsView> {
  BitmapDescriptor myIcon;
  Completer<GoogleMapController> _completer = Completer();
  GoogleMapController controller;

  @override
  void initState() {
    BitmapDescriptor.fromAssetImage(
      ImageConfiguration(
        size: Size(49, 68),
      ),
      'images/icon/mapflag.png',
    ).then((onValue) {
      myIcon = onValue;
    });
  }

  static final CameraPosition _kMoscow = CameraPosition(
    target: LatLng(55.75173133135547, 37.61654577134197),
    zoom: 14.4746,
  );

  static LatLng selected;

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: GoogleMap(
        mapType: MapType.normal,
        initialCameraPosition: _kMoscow,
        onMapCreated: (GoogleMapController controller) async {
          _completer.complete(controller);
        },
        onTap: onClick,
        markers: {
          if (selected != null)
            Marker(
              markerId: MarkerId("selected"),
              position: selected,
              icon: myIcon,
            ),
        },
      ),
      bottomNavigationBar: selected == null
          ? null
          : Container(
              color: Colors.white,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(32.0),
                    child: Text("[Создать мероприятие]"),
                  ),
                ],
              ),
            ),
    );
  }

  void onClick(LatLng pos) async {
    controller = await _completer.future;
    if (selected == null) {
      controller.animateCamera(
        CameraUpdate.newCameraPosition(
          CameraPosition(
            target: pos,
            zoom: await controller.getZoomLevel(),
          ),
        ),
      );
      selected = pos;
    } else {
      selected = null;
    }
    setState(() {});
  }
}
