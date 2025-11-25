
import 'package:ecommerce_flutter/injection.dart';
import 'package:ecommerce_flutter/src/blocProviders.dart';
import 'package:ecommerce_flutter/src/config/AppRouter.dart';
import 'package:ecommerce_flutter/src/services/DeepLinkService.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';


final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
late DeepLinkService deepLinkService;


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await configureDependencies();
  deepLinkService = DeepLinkService(navigatorKey: navigatorKey);
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  

  @override
  void initState() {
    super.initState();
    deepLinkService.initDeepLinks();
  }

  @override
  void dispose() {
    super.dispose();
    deepLinkService.dispose();
  }
  


  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: blocProviders,
      child: MaterialApp(
        navigatorKey: navigatorKey,
        builder: FToastBuilder(),
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        ),
        initialRoute: AppRouter.loginRoute,
        onGenerateRoute: AppRouter.onGenerateRoute,
      ),
    );
  }
}