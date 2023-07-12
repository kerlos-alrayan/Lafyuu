part of 'product_details_cubit.dart';

@immutable
abstract class ProductDetailsState {}

class ProductDetailsInitial extends ProductDetailsState {}

class LoadingProductState extends ProductDetailsState {}


class GetProductSuccess extends ProductDetailsState {
 final HomeResponse productDetails;
  GetProductSuccess(this.productDetails);
}

class ProductFailure extends ProductDetailsState {}

