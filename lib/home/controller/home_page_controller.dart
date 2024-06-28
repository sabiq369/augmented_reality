// import 'dart:nativewrappers/_internal/vm/lib/typed_data_patch.dart';
// import 'dart:nativewrappers/_internal/vm/lib/typed_data_patch.dart';
import 'dart:typed_data';

import 'package:get/get.dart';

class HomePageController extends GetxController {
  var imageFile = Rxn<Uint8List>();

  RxBool isUploading = false.obs;
}
