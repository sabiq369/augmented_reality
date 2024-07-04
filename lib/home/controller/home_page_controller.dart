// import 'dart:nativewrappers/_internal/vm/lib/typed_data_patch.dart';
// import 'dart:nativewrappers/_internal/vm/lib/typed_data_patch.dart';
import 'dart:typed_data';

import 'package:arcore_flutter_plugin/arcore_flutter_plugin.dart';
import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';
import 'package:vector_math/vector_math_64.dart' as vector;
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class HomePageController extends GetxController {
  var imageFile = Rxn<Uint8List>();
  ArCoreController? arCoreController;
  RxBool isUploading = false.obs;

  augmentedRealityViewCreated(ArCoreController controller) {}
  void onArCoreViewCreated(ArCoreController controller) {
    arCoreController = controller;

    _addSphere(arCoreController!);
    _addCylindre(arCoreController!);
    _addCube(arCoreController!);
  }

  void _addSphere(ArCoreController controller) {
    final material = ArCoreMaterial(color: Color.fromARGB(120, 66, 134, 244));
    final sphere = ArCoreSphere(
      materials: [material],
      radius: 0.1,
    );
    final node = ArCoreNode(
      shape: sphere,
      position: vector.Vector3(0, 0, -1.5),
    );
    controller.addArCoreNode(node);
  }

  void _addCylindre(ArCoreController controller) {
    final material = ArCoreMaterial(
      color: Colors.red,
      reflectance: 1.0,
    );
    final cylindre = ArCoreCylinder(
      materials: [material],
      radius: 0.5,
      height: 0.3,
    );
    final node = ArCoreNode(
      shape: cylindre,
      position: vector.Vector3(0.0, -0.5, -2.0),
    );
    controller.addArCoreNode(node);
  }

  void _addCube(ArCoreController controller) {
    final material = ArCoreMaterial(
      color: Color.fromARGB(120, 66, 134, 244),
      metallic: 1.0,
    );
    final cube = ArCoreCube(
      materials: [material],
      size: vector.Vector3(0.5, 0.5, 0.5),
    );
    final node = ArCoreNode(
      shape: cube,
      position: vector.Vector3(-0.5, 0.5, -3.5),
    );
    controller.addArCoreNode(node);
  }

  pickImage({required bool fromCamera}) async {
    try {
      final pickedImage = await ImagePicker().pickImage(
          source: fromCamera ? ImageSource.camera : ImageSource.gallery);
      if (pickedImage != null) {
        Get.back();
        String imagePath = pickedImage.path;
        imageFile.value = await pickedImage.readAsBytes();
        // ArCoreView(onArCoreViewCreated: arController.firstRebuild);
      }
    } catch (e) {}
  }
}
