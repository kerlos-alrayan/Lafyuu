import 'package:bloc/bloc.dart';
import 'package:ecommerce_app_sat26/models/home_products_model.dart';
import 'package:ecommerce_app_sat26/repository/home_product_repo.dart';
import 'package:meta/meta.dart';

part 'product_details_state.dart';

class ProductDetailsCubit extends Cubit<ProductDetailsState> {
  ProductDetailsCubit() : super(ProductDetailsInitial());

  void getProductDetails(int id) async{
    emit(LoadingProductState());
    try {
      final response = await ProductRepository().getHomeProductsDetails(id);
      final productDetails = HomeResponse.fromJson(response);
      emit(GetProductSuccess(productDetails));
    } on Exception catch (e) {
      emit(ProductFailure());
    }
  }
}
