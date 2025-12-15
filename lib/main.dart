import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tasck_clean_architecture/core/db_helper.dart';
import 'package:tasck_clean_architecture/src/features/product/presentation/bloc/product_bloc.dart';
import 'package:tasck_clean_architecture/src/features/product/presentation/views/product.dart';
import 'injection_container.dart' as di;

void main() async {
  runApp(MyApp());
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  await DatabaseHelper.instance.initDb();
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => di.sl<ProductBloc>()..add(FetchProduct(current: 0)),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(colorScheme: .fromSeed(seedColor: Colors.deepPurple)),
        home: Home(),
      ),
    );
  }
}

class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => HomeState();
}

class HomeState extends State<Home> {
  bool islist = true;
  @override
  build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("welcome"),
        actions: [
          IconButton(
            onPressed: () {
              final d = context.read<ProductBloc>();
              if (d.state is ProductStateData) {
                final m = context.read<ProductBloc>().state as ProductStateData;
                islist = !islist;
                d.add(SwichedProduct(isList: islist, products: m.products));
              }
            },
            icon: Icon(Icons.sports_basketball),
          ),
        ],
      ),
      body: ProductView(),
      //  Center(
      //   child: Column(
      //     mainAxisAlignment: MainAxisAlignment.center,
      //     children: [
      //     //   Expanded(
      //     //     child: FutureBuilder(
      //     //       future: s.getProducts(),
      //     //       initialData: [],
      //     //       builder: (c, snap) => islist
      //     //           ? ListView.builder(
      //     //               itemCount: snap.data!.length,
      //     //               itemBuilder: (v, index) =>
      //     //                   ProductDetilsCard(model: snap.data![index]),
      //     //             )
      //     //           : GridView.builder(
      //     //               gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
      //     //                 crossAxisCount: 2,
      //     //               ),
      //     //               itemCount: snap.data!.length,
      //     //               itemBuilder: (c, index) => Container(
      //     //                 child: ProductDetilsCardGrid(
      //     //                   model: snap.data![index],
      //     //                 ),
      //     //               ),
      //     //             ),
      //     //     ),
      //     //   ),
      //     // ],
      // ]  ),
      // ),
    );
  }
}
// class HomePage extends StateL