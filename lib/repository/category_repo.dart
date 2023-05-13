import 'package:dio/dio.dart';
import 'package:ecommerce_app_sat26/model/category_repo_model.dart';

class CategoryRepository {
  Future<List<CategoryRepoModel>> getAllCategories() async {
    final response =
        await Dio().get('https://api.escuelajs.co/api/v1/categories/');

    final listOfCategories = List<CategoryRepoModel>.from(
      response.data.map(
        (value) => CategoryRepoModel(
          id: value['id'],
          name: value['name'],
          image: value['image'],
         ),
      ),
    );
    return listOfCategories;
  }
}

class RepoTest {

  void getHttp() async {
    final response = await Dio().get('https://dart.dev');
    print(response);
  }

  void getHttp1() {
    final response = Dio().get('https://dart.dev');
    print(response);
    print('_________________________________________________');
  }
}

void main() {
 // RepoTest().getHttp();

 // RepoTest().getHttp1();

  CategoryText().getCategoryRepo();
}

class CategoryText{
  void getCategoryRepo() async{
    final response = await Dio().get('https://api.escuelajs.co/api/v1/categories/');
    print(response);
  }
}
