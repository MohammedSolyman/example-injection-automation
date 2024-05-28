part of 'products_bloc.dart';

enum CallStatus {
  loading,
  success,
  failed,
}

class ProductsState extends Equatable {
  CallStatus? callStatus;
  Products? products;

  ProductsState({
    this.callStatus,
    this.products,
  });

  ProductsState copyWith({
    CallStatus? callStatus,
    Products? products,
  }) =>
      ProductsState(
          callStatus: callStatus ?? this.callStatus,
          products: products ?? this.products);

  @override
  List<Object?> get props => [
        callStatus,
        products,
      ];
}
