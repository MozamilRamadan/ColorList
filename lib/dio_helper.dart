import 'package:dio/dio.dart';

class DioHelper {
  static late Dio dio;
// http://23.88.122.29:8080/JubaSoup-0.1/share/sh_colors/getAllByNameSorted?name=&sort=createddate,desc
  static init(){
    dio = Dio();
  }


  static Future<Response> getData() async {
    return await dio.get('http://23.88.122.29:8080/JubaSoup-0.1/share/sh_colors/getAllByNameSorted?name=&sort=createddate,desc');
  }

}