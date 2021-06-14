import 'package:arcore_flutter_plugin/arcore_flutter_plugin.dart';
import 'package:flutter/material.dart';

class ArView extends StatefulWidget {
  const ArView({Key key}) : super(key: key);

  @override
  _ArViewState createState() => _ArViewState();
}

class _ArViewState extends State<ArView> {
  ArCoreController arCoreController;
  @override
  Widget build(BuildContext context) {
    return ArCoreView(
      onArCoreViewCreated: _onArCoreViewCreated,
      enableTapRecognizer: true,
    );
  }

  void _onArCoreViewCreated(ArCoreController controller) {
    arCoreController = controller;

    arCoreController.onNodeTap = (name) => onTapHandler(name);
    arCoreController.onPlaneTap = _handleOnPlaneTap;
  }

  void onTapHandler(String name) => print("Лису гладят");

  void _handleOnPlaneTap(List<ArCoreHitTestResult> hits) {
    final hit = hits.first;
    _addFox(hit);
  }

  void _addFox(ArCoreHitTestResult plane) {
    print("HIT");
    var foxNode = ArCoreReferenceNode(
      name: "arcticfoxposed.sfb",
      object3DFileName: "arcticfoxposed.sfb",
      position: plane.pose.translation,
      rotation: plane.pose.rotation,
    );
    arCoreController.addArCoreNodeWithAnchor(foxNode);
  }

  @override
  void dispose() {
    arCoreController.dispose();
    super.dispose();
  }
}
