import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'core/util/injection/injection.dart';
import 'features/products/bloc/products_bloc.dart';
import 'features/products/data/models/produc.dart';

///
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await slSetup();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ProductsBloc>(
      create: (context) => sl<ProductsBloc>()..add(GetProducsts()),
      child: const MaterialApp(
        home: MyHome(),
      ),
    );
  }
}

class MyHome extends StatelessWidget {
  const MyHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<ProductsBloc, ProductsState>(
        builder: (context, state) {
          //1. loading
          if (state.callStatus == CallStatus.loading) {
            return const Center(child: CircularProgressIndicator());
          }

          //2. failure
          else if (state.callStatus == CallStatus.failed) {
            return const Center(child: Text('failed'));
          }

          //3. success
          else if (state.callStatus == CallStatus.success) {
            return ListView.builder(
              itemCount: state.products!.products!.length,
              itemBuilder: (context, index) {
                Product p = state.products!.products![index];
                return ListTile(
                  leading: CircleAvatar(
                    child: Image.network(p.thumbnail!),
                  ),
                  title: Text('${p.id} -- ${p.title}'),
                  subtitle: Text(p.description!),
                );
              },
            );
          } else {
            return Container();
          }
        },
        listener: (context, state) {},
      ),
    );
  }
}
