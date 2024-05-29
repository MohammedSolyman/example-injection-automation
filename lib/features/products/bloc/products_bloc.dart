// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

import 'package:my_arrangement/features/products/data/repo/base.dart';

import '../data/models/produc.dart';

part 'products_event.dart';
part 'products_state.dart';

@injectable
class ProductsBloc extends Bloc<ProductsEvent, ProductsState> {
  ProductsRepo productsRepo;

  ProductsBloc({required this.productsRepo}) : super(ProductsState()) {
    on<GetProducsts>(getProducstsFunction);
  }

  void getProducstsFunction(event, emit) async {
    emit(state.copyWith(callStatus: CallStatus.loading));

    Either<Unit, Products> result = await productsRepo.getProducst();

    result.fold(
      (l) {
        emit(state.copyWith(callStatus: CallStatus.failed));
      },
      (r) {
        emit(state.copyWith(products: r, callStatus: CallStatus.success));
      },
    );
  }
}
