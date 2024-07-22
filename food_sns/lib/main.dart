import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_naver_map/flutter_naver_map.dart';
import 'package:food_sns/model/food_store.dart';
import 'package:food_sns/screen/detail_screen.dart';
import 'package:food_sns/screen/edit_screen.dart';
import 'package:food_sns/screen/main_screen.dart';
import 'package:food_sns/screen/register_screen.dart';
import 'package:food_sns/screen/search_address_screen.dart';
import 'package:food_sns/screen/search_result_screen.dart';
import 'package:food_sns/screen/splash_screen.dart';
import 'package:food_sns/screen/login_screen.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load();
  await Supabase.initialize(
    url: dotenv.get('PROJECT_URL'),
    anonKey: dotenv.get('PROJECT_API_KEY'),
  );
  await NaverMapSdk.instance.initialize(
    clientId: dotenv.get('NAVER_API_KEY'),
    onAuthFailed: (ex) => print('네이버 맵 인증 오류 : $ex'),
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Food Pickup SNS',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blueAccent),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => const SplashScreen(),
        '/login': (context) => const LoginScreen(),
        '/register': (context) => const RegisterScreen(),
        '/main': (context) => const MainScreen(),
        '/edit': (context) => const EditScreen(),
        '/search_address': (context) => const SearchAddressScreen(),
      },
      onGenerateRoute: (settings) {
        if (settings.name == '/detail') {
          FoodStoreModel foodStoreModel = settings.arguments as FoodStoreModel;
          return MaterialPageRoute(
            builder: (context) {
              return DetailScreen(foodStoreModel: foodStoreModel);
            },
          );
        } else if (settings.name == '/search_result') {
          List<FoodStoreModel> lstFoodStore =
              settings.arguments as List<FoodStoreModel>;
          return MaterialPageRoute(
            builder: (context) {
              return SearchResultScreen(
                lstFoodStore: lstFoodStore,
              );
            },
          );
        }
      },
    );
  }
}
