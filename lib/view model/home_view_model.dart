import 'package:get/get.dart';
import 'package:shop/model/category_model.dart';
import 'package:shop/model/prodacts_model.dart';
import 'package:shop/services/home_service.dart';

class HomeViewMModel extends GetxController {
  List<CategoryModel> categoryModel = [];
  List<ProdactsModel> prodactsModel = [];
  HomeViewMModel() {
    getCategory();
    getProdact();
  }
  getCategory() {
    HomeServices().getCategory().then((value) => {
          for (int i = 0; i < value.length; i++)
            {categoryModel.add(CategoryModel.fromjson(value[i].data()))}
        });
    update();
  }

  getProdact() {
    HomeServices().getProdacts().then((value) => {
          for (int i = 0; i < value.length; i++)
            {prodactsModel.add(ProdactsModel.fromjson(value[i].data()))}
        });
    update();
  }
}
