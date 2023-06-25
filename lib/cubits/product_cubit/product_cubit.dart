import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:ecommerce_app_sat26/repository/category_repo.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'product_state.dart';

class ProductCubit extends Cubit<ProductState> {
  ProductCubit() : super(ProductInitial());
  void getProducts(int id) async{
    final response = await HomeProducts().getHomeProducts(id);
    emit(ProductSuccessful(response));
  }
}
