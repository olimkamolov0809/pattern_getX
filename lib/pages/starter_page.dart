import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pattern_getx/controllers/starter_controller.dart';

import '../model/post_model.dart';
import '../veiws/item_starter_post.dart';

class StarterPage extends StatefulWidget {
  const StarterPage({Key? key}) : super(key: key);

  @override
  State<StarterPage> createState() => _StarterPageState();
}

class _StarterPageState extends State<StarterPage> {
  @override

  void initState() {
    // TODO: implement initState
    super.initState();
    Get.find<StarterController>().apiPostList();
  }
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('GetX'),
      ),
      body: GetBuilder<StarterController>(
        init: StarterController(),
        builder: (controller){
          return Stack(
            children: [
              ListView.builder(
                itemCount: controller.items.length,
                itemBuilder: (ctx, index){
                  Post post = controller.items[index];
                  return itemSplashPost(controller, post);
                },
              ),
              controller.isLoading ? const Center(
                child: CircularProgressIndicator(),
              ):const SizedBox.shrink(),
            ],
          );
        },
      ),
    );
  }
}
