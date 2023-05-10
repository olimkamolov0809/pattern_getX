import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:http/http.dart';
import 'package:pattern_getx/controllers/create_page_controller.dart';
import 'package:pattern_getx/controllers/update_create_page.dart';

import '../controllers/home_controller.dart';
import '../model/post_model.dart';
import '../services/http_services.dart';
import '../veiws/items_home_post.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _controller = Get.put(HomeController());
  final _controller1 = Get.put(CreateController());
  final _controller2 = Get.put(UpdateController());

  void initState(){
   super.initState();
   _controller.apiPostList();
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
                itemCount: _controller.items.length,
                itemBuilder: (ctx, index){
                  Post post=  _controller.items[index];
                  return itemsHomePost(_controller ,post);
                },
              ),
              _controller.isLoading.value? const Center(
                child: CircularProgressIndicator(),
              ): const SizedBox.shrink(),
            ],
          ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        onPressed: (){
          _controller1.apiPostCreate(post as Post);
        },
        child: const Icon(Icons.add),
      ),
    );
  }

}
