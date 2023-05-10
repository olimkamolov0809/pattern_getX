import 'package:get/get.dart';
import '../model/post_model.dart';
import '../services/http_services.dart';
class SplashController extends GetxController{
  var isLoading = true;
  var items = [];
  void apiPostList() async{
    isLoading = true;
    update();
    var response = await Network.GET(Network.API_LIST, Network.paramsEmpty());
    if(response != null) {
      items = Network.parsePostList(response);
    }else{
      items = [];
    }
    isLoading= false;
    update();
  }
  void apiPostCreate(Post post) async {
    isLoading = true;
    var response  = await Network.POST(Network.API_CREATE+post.id.toString(), Network.paramsEmpty());
    if(response != null){
      apiPostList();
    }
    isLoading = false;
    update();
  }
}