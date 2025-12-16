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
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => di.sl<ProductBloc>()..add(FetchProduct())),
      ],
      child: const MaterialApp(title: 'Flutter Demo', home: Home()),
    );
  }
}

class Home extends StatefulWidget {
  const Home({super.key});
  @override
  State<StatefulWidget> createState() => HomeState();
}

class HomeState extends State<Home> {
  bool islist = true;
  @override
  build(BuildContext context) {
    return Scaffold(
      drawer: Container(
        color: Colors.white,
        width: 350,
        height: double.infinity,
      ),
      appBar: AppBar(
        title: Column(
          children: [
            Text(
              "Shop",
              style: TextStyle(
                fontWeight: FontWeight.w900,
                fontSize: 20,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),

        bottom: PreferredSize(
          preferredSize: Size(0, 30),
          child: Container(
            padding: EdgeInsets.only(left: 20),
            width: double.infinity,
            child: Text(
              "Product List",
              style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 16,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ),
        ),
        // excludeHeaderSema/sntics: true,
        actions: [
          IconButton(
            onPressed: () {
              final productBloc = context.read<ProductBloc>();
              if (productBloc.state is ProductLoaded) {
                productBloc.add(SwichedProduct());
              }
            },
            icon: Icon(Icons.shopping_cart),
          ),
        ],
      ),
      body: const ProductView(),
    );
  }
}
