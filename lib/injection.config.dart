// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:my_arrangement/core/util/services/api_services.dart' as _i3;
import 'package:my_arrangement/core/util/services/local_services.dart' as _i4;
import 'package:my_arrangement/features/products/bloc/products_bloc.dart'
    as _i7;
import 'package:my_arrangement/features/products/data/repo/base.dart' as _i5;
import 'package:my_arrangement/features/products/data/repo/impl.dart' as _i6;

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.factory<_i3.ApiServices>(() => _i3.ApiServices());
    gh.factory<_i4.LocalServices>(() => _i4.LocalServices());
    gh.factory<_i5.ProductsRepo>(() => _i6.ProductsRepoImpl(
          apiServices: gh<_i3.ApiServices>(),
          localServices: gh<_i4.LocalServices>(),
        ));
    gh.factory<_i7.ProductsBloc>(
        () => _i7.ProductsBloc(productsRepo: gh<_i5.ProductsRepo>()));
    return this;
  }
}
