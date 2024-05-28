import 'package:dartz/dartz.dart';
import 'package:my_arrangement/core/util/services/api_services.dart';
import 'package:my_arrangement/core/util/services/local_services.dart';
import 'package:my_arrangement/features/products/data/models/produc.dart';
import 'package:my_arrangement/features/products/data/repo/base.dart';

class ProductsRepoImpl implements ProductsRepo {
  ApiServices apiServices;
  LocalServices localServices;

  ProductsRepoImpl({
    required this.apiServices,
    required this.localServices,
  });

  @override
  Future<Either<Unit, Products>> getProducst() async {
    try {
      print('----1-------------');
      final data = await apiServices.get();
      print('----2-------------');
      print('-- $data');
      Products products = Products.fromJson(data);
      print('----3-------------');

      return Right(products);
    } catch (e) {
      print('---${e.toString()}');
      print('----4-------------');

      return const Left(unit);
    }
  }
}
