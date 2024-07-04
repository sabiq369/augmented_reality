import 'dart:math';

import 'package:arcore_flutter_plugin/arcore_flutter_plugin.dart';
import 'package:augmented_reality/home/controller/home_page_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);
  final HomePageController controller = Get.put(HomePageController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Augmented Reality'),
        centerTitle: true,
      ),
      body: ArCoreView(onArCoreViewCreated: controller.onArCoreViewCreated),
      // body: Center(
      //   child: Text('Click the + button to add your AR photo.'),
      // ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) {
              return Material(
                color: Colors.transparent,
                child: Center(
                  child: Wrap(
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width,
                        margin:
                            EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                        padding:
                            EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.white),
                        child: Column(
                          children: [
                            Align(
                              alignment: Alignment.centerRight,
                              child: IconButton(
                                  onPressed: () => Get.back(),
                                  icon: Icon(Icons.close)),
                            ),
                            Text(
                              'Choose an option',
                              style: TextStyle(
                                  fontWeight: FontWeight.w600, fontSize: 18),
                            ),
                            SizedBox(height: 5),
                            TextButton(
                                onPressed: () =>
                                    controller.pickImage(fromCamera: true),
                                child: Text('Camera')),
                            TextButton(
                                onPressed: () =>
                                    controller.pickImage(fromCamera: false),
                                child: Text('Gallery'))
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
