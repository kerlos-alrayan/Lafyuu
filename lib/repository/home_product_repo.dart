import 'package:dio/dio.dart';

class HomeRepository{
  dynamic getHomeProducts() async{
    final response = await Dio().get('https://student.valuxapps.com/api/home');
    return response.data;
  }
}