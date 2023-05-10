
import 'package:get/get.dart';
import '../model/post_model.dart';
import '../services/http_services.dart';

class SplashUpdateControlle extends GetxController{
  var isLoading = true;
  var items = [];
  void apiPostList() async {
    isLoading = true;
    update();
    var response = await Network.GET(Network.API_LIST, Network.paramsEmpty());
    if (response != null) {
      items = Network.parsePostList(response);
    } else {
      items = [];
    }
    isLoading = false;
    update();
  }
  void apiPostUpdate(Post post) async {
    isLoading = true;
    var response  = await Network.GET(Network.API_UPDATE+post.id.toString(), Network.paramsUpdate(post));

    if(response != null){
      apiPostList();
    }
    isLoading = false;
  }
}