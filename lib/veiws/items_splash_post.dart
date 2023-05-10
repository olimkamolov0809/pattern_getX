import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:pattern_getx/controllers/splash_controller.dart';
import '../model/post_model.dart';

Widget itemSplashPost(SplashController _controller ,Post post){
  return Slidable(
    startActionPane: ActionPane(
      motion: const ScrollMotion(),
      dismissible: DismissiblePane(
        onDismissed: (){

        },
      ),
      children: [
        SlidableAction(
          onPressed: (BuildContext context){
            //_apiPostUpdate(post);
          },
          backgroundColor: Colors.green,
          foregroundColor: Colors.white,
          icon: Icons.edit,
          label: "Update",
        ),
      ],
    ),
    endActionPane: ActionPane(
      motion: const ScrollMotion(),
      dismissible: DismissiblePane(
        onDismissed: (){

        },
      ),
      children: [
        SlidableAction(
          onPressed: (BuildContext context){
            _controller.apiPostDelete(post);
          },
          backgroundColor: Colors.red,
          foregroundColor: Colors.white,
          icon: Icons.delete,
          label: "Delete",
        ),
      ],
    ),
    child: Container(
      padding: EdgeInsets.only(left: 20,right: 20,top: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(post.title.toUpperCase()),
          SizedBox(height: 5),
          Text(post.body),
        ],
      ),
    ),
  );
}