part of 'home_product_cubit.dart';

@immutable
abstract class HomeProductState {}

class HomeProductInitial extends HomeProductState {}

class LoadingHomeState extends HomeProductState {}

class HomeDataSuccess extends HomeProductState {
  final HomeResponse homeResponse;

  HomeDataSuccess(this.homeResponse);
}
