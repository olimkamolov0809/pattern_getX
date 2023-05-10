import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:http/http.dart';

import '../controllers/home_controller.dart';
import '../controllers/main_controller.dart';
import '../model/post_model.dart';
import '../services/http_services.dart';
import '../veiws/items_home_post.dart';
import '../veiws/items_main_post.dart';

class MainPage extends StatefulWidget {

  static final String id = "/main_page";
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {


  void initState(){
    super.initState();
    Get.find<MainController>().apiPostList();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("GetX"),
      ),
      body: Obx(
            () =>  Stack(
          children: [
            ListView.builder(
              itemCount: Get.find<MainController>().items.length,
              itemBuilder: (ctx, index){
                Post post=  Get.find<MainController>().items[index];
                return itemsMainPost(Get.find<MainController>() ,post);
              },
            ),
            Get.find<MainController>().isLoading.value? const Center(
              child: CircularProgressIndicator(),
            ): const SizedBox.shrink(),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        onPressed: (){
          //_apiPostCreate();
        },
        child: const Icon(Icons.add),
      ),
    );
  }

}
