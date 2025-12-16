import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tasck_clean_architecture/core/db_helper.dart';
import 'package:tasck_clean_architecture/src/features/product/presentation/bloc/product_bloc.dart';
import 'package:tasck_clean_architecture/src/features/product/presentation/bloc/product_event.dart';
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
        BlocProvider(create: (_) => di.sl<ProductBloc>()..add(FetchProduct())),
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
    return Scaffold(
      appBar: AppBar(
        title: Text("welcome"),
        actions: [
          IconButton(
            onPressed: () {
              final productBloc = context.read<ProductBloc>();
              if (productBloc.state is ProductLoaded) {
                productBloc.add(SwichedProduct());
              }
            },
            icon: Icon(Icons.sports_basketball),
          ),
        ],
      ),
      body: ProductView(),
    );
  }
}
