import 'package:dartz/dartz.dart';
import 'package:my_arrangement/features/products/data/models/produc.dart';

abstract class ProductsRepo {
  Future<Either<Unit, Products>> getProducst();
}
