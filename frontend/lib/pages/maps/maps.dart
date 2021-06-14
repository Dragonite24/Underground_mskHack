import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:team_up/pages/ar/prear.dart';
import 'package:team_up/pages/profile/menuItems/createEvent.dart';

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
    super.initState();
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

  Widget _buildButton() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ElevatedButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute<void>(builder: (context) => CreateEvent()),
          );
        },
        child: Ink(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: <Color>[Color(0xFF16FF00), Color(0xFF4CFFC9)],
            ),
            borderRadius: BorderRadius.all(Radius.circular(80.0)),
          ),
          child: Container(
            constraints: const BoxConstraints(
              minWidth: 200.0,
              minHeight: 40.0,
            ), // min sizes for Material buttons
            alignment: Alignment.center,
            child: const Text(
              'Создать мероприятие',
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.black),
            ),
          ),
        ),
        style: ButtonStyle(
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(100),
            ),
          ),
          padding: MaterialStateProperty.all<EdgeInsets>(EdgeInsets.all(0.0)),
        ),
      ),
    );
  }

  Widget _buildWButton(String text, onClick) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ElevatedButton(
        onPressed: onClick,
        child: Ink(
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(80.0)),
          ),
          child: Container(
            constraints: const BoxConstraints(
              minWidth: 150.0,
              minHeight: 40.0,
            ), // min sizes for Material buttons
            alignment: Alignment.center,
            child: Text(
              text,
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.black),
            ),
          ),
        ),
        style: ButtonStyle(
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(100),
            ),
          ),
          padding: MaterialStateProperty.all<EdgeInsets>(EdgeInsets.all(0.0)),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        GoogleMap(
          mapType: MapType.normal,
          initialCameraPosition: _kMoscow,
          onMapCreated: (GoogleMapController controller) async {
            _completer.complete(controller);
          },
          onTap: onClick,
          markers: <Marker>{
            if (selected != null)
              Marker(
                markerId: MarkerId("selected"),
                position: selected,
                icon: myIcon,
              ),
          },
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildWButton("Стартап", () {
                  Navigator.push(
                    context,
                    MaterialPageRoute<void>(builder: (context) => PreArView()),
                  );
                }),
                _buildWButton("Мои события", () {}),
              ],
            ),
            Expanded(child: Container()),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (selected != null) _buildButton(),
              ],
            ),
          ],
        ),
      ],
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
