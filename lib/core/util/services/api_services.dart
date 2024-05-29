// import 'package:dio/dio.dart';
// import 'package:injectable/injectable.dart';

// @injectable
// class ApiServices {
//   Dio dio;

//   ApiServices({
//     required this.dio,
//   });

//   Future<dynamic> get() async {
//     Response response = await dio.get('https://dummyjson.com/products');

//     if (response.statusCode == 200) {
//       return response.data;
//     } else {
//       throw Exception('there is something wrong');
//     }
//   }
// }

// @module
// abstract class RegisterModule {
//   @lazySingleton
//   Dio get dio => Dio();
// }

import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

@injectable
class ApiServices {
  Dio dio = Dio();

  Future<dynamic> get() async {
    Response response = await dio.get('https://dummyjson.com/products');

    if (response.statusCode == 200) {
      return response.data;
    } else {
      throw Exception('there is something wrong');
    }
  }
}
