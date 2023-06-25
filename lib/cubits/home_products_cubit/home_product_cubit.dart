import 'package:bloc/bloc.dart';
import 'package:ecommerce_app_sat26/models/home_products_model.dart';
import 'package:ecommerce_app_sat26/repository/home_product_repo.dart';
import 'package:meta/meta.dart';

part 'home_product_state.dart';

class HomeProductCubit extends Cubit<HomeProductState> {
  HomeProductCubit() : super(HomeProductInitial());
  void getHomeProducts() async{
    emit(LoadingHomeState());
    final response =await HomeRepository().getHomeProducts();
    final homeData = HomeResponse.fromJson(response);
    emit(HomeDataSuccess(homeData));
  }
}
