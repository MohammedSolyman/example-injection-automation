import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_arrangement/core/util/services/api_services.dart';
import 'package:my_arrangement/features/products/bloc/products_bloc.dart';

import 'core/util/services/local_services.dart';
import 'features/products/data/models/produc.dart';
import 'features/products/data/repo/impl.dart';

///////////////////////////////////////////////////////////////////////////
//web_socket_channel //////////////////////////////////////////////////////

// import 'package:flutter/material.dart';
// import 'package:web_socket_channel/web_socket_channel.dart';

// void main() {
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Home(),
//     );
//   }
// }

// class Home extends StatelessWidget {
//   Home({super.key});

//   final WebSocketChannel channel =
//       WebSocketChannel.connect(Uri.parse('ws://echo.websocket.org'));

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: Column(children: [
//           ElevatedButton(
//               onPressed: () {
//                 channel.stream.listen((message) {
//                   print(message);
//                 });
//               },
//               child: const Text('start')),
//           ElevatedButton(
//               onPressed: () {
//                 channel.sink.add('message');
//               },
//               child: const Text('send')),
//         ]),
//       ),
//     );
//   }
// }

// ///////////////////////////////////////////////////////////////////////////
// //chip/container/card //////////////////////////////////////////////////////

// import 'package:flutter/material.dart';

// void main() {
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Home(),
//     );
//   }
// }

// class Home extends StatelessWidget {
//   Home({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//           child: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           Chip(
//             label: const Text('chip'),
//             avatar: const Icon(Icons.man),
//             deleteIcon: const Icon(Icons.remove),
//             onDeleted: () {
//               print('deleted');
//             },
//             elevation: 5,
//             shadowColor: Colors.black,
//             deleteIconColor: Colors.red,
//           ),
//           const Card(
//             child: Text('card'),
//           ),
//           Container(child: const Text('container')),
//         ],
//       )),
//     );
//   }
// }

//////////////////////////////////////////////////////////////////////////////
// manual injection //////////////////////////////////////////////////////////
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ProductsBloc>(
      create: (context) => ProductsBloc(
          productsRepo: ProductsRepoImpl(
              apiServices: ApiServices(dio: Dio()),
              localServices: LocalServices()))
        ..add(GetProducsts()),
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
          else {
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
          }
        },
        listener: (context, state) {},
      ),
    );
  }
}
