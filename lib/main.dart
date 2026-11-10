import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart'
    show debugPaintLayerBordersEnabled, debugPaintSizeEnabled, debugRepaintRainbowEnabled;
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:islami_c20_dokki/models/hadeth.dart';
import 'package:islami_c20_dokki/models/sura.dart';
import 'package:islami_c20_dokki/screens/hadeth_details/hadeth_details.dart';
import 'package:islami_c20_dokki/screens/home/home_screen.dart';
import 'package:islami_c20_dokki/screens/on_boarding/on_boarding_screen.dart';
import 'package:islami_c20_dokki/screens/sura_details/sura_details.dart';

void main() {
  assert(() {
    debugPaintLayerBordersEnabled = false;
    debugPaintSizeEnabled = false;
    debugRepaintRainbowEnabled = false;
    return true;
  }());
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  runApp(MyApp());
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
    Future.delayed(const Duration(seconds: 1), () {
      FlutterNativeSplash.remove();
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        OnBoardingScreen.routeName: (context) => const OnBoardingScreen(),
        HomeScreen.routeName: (_) => HomeScreen(),
        SuraDetails.routeName: (context){
          var sura = ModalRoute.of(context)?.settings.arguments as Sura;
          return SuraDetails(sura: sura);
        },
        HadethDetails.routeName: (context){
          var hadeth = ModalRoute.of(context)?.settings.arguments as Hadeth;
          return HadethDetails(hadeth: hadeth);
        }
        
      },
      initialRoute: OnBoardingScreen.routeName,
    );
  }
}
