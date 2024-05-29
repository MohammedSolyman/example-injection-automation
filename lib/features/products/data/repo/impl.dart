import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:my_arrangement/core/util/services/api_services.dart';
import 'package:my_arrangement/core/util/services/local_services.dart';
import 'package:my_arrangement/features/products/data/models/produc.dart';
import 'package:my_arrangement/features/products/data/repo/base.dart';

@Injectable(as: ProductsRepo)
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
      final data = await apiServices.get();
      Products products = Products.fromJson(data);

      return Right(products);
    } catch (e) {
      print('---${e.toString()}');

      return const Left(unit);
    }
  }
}
