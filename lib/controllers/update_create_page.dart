
import 'package:get/get.dart';
import '../model/post_model.dart';
import '../services/http_services.dart';
class UpdateController extends GetxController{
  var isLoading  = false.obs;
  var items = [].obs;
  void apiPostList() async{
    isLoading.value = true;
    var response = await Network.GET(Network.API_LIST, Network.paramsEmpty());
    if(response != null) {
      items.value = Network.parsePostList(response);
    }else{
      items.value = [];
    }
    isLoading.value = false;
  }
  void apiPostUpdate(Post post) async {
    isLoading.value = true;
    var response  = await Network.GET(Network.API_UPDATE+post.id.toString(), Network.paramsUpdate(post));

    if(response != null){
      apiPostList();
    }
    isLoading.value = false;
  }
}
