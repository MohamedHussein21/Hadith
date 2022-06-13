import 'package:dio/dio.dart';

class DioHelper {
  static Dio? dio;

  static init (){
    dio = Dio(
        BaseOptions(
          baseUrl: 'https://ahadith-api.herokuapp.com/',
          receiveDataWhenStatusError: true,
        )
    );
  }

  static Future<Response> getData ({
    required String url,
  })async{
    return await dio!.get(url );
  }
}

//https://ahadith-api.herokuapp.com/api/ahadith/all/ar-tashkeel