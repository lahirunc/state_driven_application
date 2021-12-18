import 'package:api_call/controllers/controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_notifier.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:get/instance_manager.dart';

class Home extends GetView<Controller> {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _controller = Get.find<Controller>();

    return Scaffold(
      body: controller.obx(
        (state) => Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('AlbumID: ${_controller.photoList[0].albumId}'),
              Text('ID: ${_controller.photoList[0].id}'),
              Text('title:${_controller.photoList[0].title}'),
              Image.network(_controller.photoList[0].thumbnailUrl),
            ],
          ),
        ),
        onLoading: const Center(child: CircularProgressIndicator()),
        onEmpty: const Center(
          child: Text('No data found'),
        ),
        onError: (error) => Center(
          child: Text(error.toString()),
        ),
      ),
    );
  }
}
