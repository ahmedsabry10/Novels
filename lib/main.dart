import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:novels/cubit/states_screen.dart';
import 'cubit/cache_helper.dart';
import 'cubit/cubit_screen.dart';
import 'main_screen/home.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await CacheHelper.init();
  bool? isDark=CacheHelper.getBoolean(key:'isDark');
  runApp( MyApp(isDark));
}

class MyApp extends StatelessWidget {

  late final bool? isDark;
  MyApp(this.isDark);
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context)=>AppCubit()..changeAppMode(
        fromShared: isDark,
      ),
      child: BlocConsumer<AppCubit ,AppStates>(
        listener:(context ,state){},
        builder: (context ,state){
          return MaterialApp(
            theme: ThemeData(
                drawerTheme: DrawerThemeData(
                  backgroundColor: HexColor('#F4F6F7'),
                ),
                primarySwatch: Colors.deepOrange,
                scaffoldBackgroundColor:Colors.white,
                appBarTheme:const AppBarTheme(
                    titleSpacing: 20.0,
                    backgroundColor: Colors.white,
                    elevation: 0.0,
                    systemOverlayStyle: SystemUiOverlayStyle(
                      statusBarIconBrightness: Brightness.dark,
                      statusBarColor: Colors.white,
                    ),
                    titleTextStyle: TextStyle(
                      color: Colors.black,
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                    ),
                    iconTheme: IconThemeData(
                      color: Colors.black,
                    )
                ),
                bottomNavigationBarTheme:const BottomNavigationBarThemeData(
                  type: BottomNavigationBarType.fixed,
                  selectedItemColor: Colors.deepOrange,
                  unselectedItemColor: Colors.grey,
                  backgroundColor: Colors.white,
                ),

                textTheme:const TextTheme(
                    bodyText1: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    )
                )
            ),
            darkTheme: ThemeData(
              buttonTheme: ButtonThemeData(),
              drawerTheme: DrawerThemeData(
                backgroundColor: HexColor('#1C2833'),
              ),
              scaffoldBackgroundColor: HexColor('#1C2833'),
              primarySwatch: Colors.deepOrange,
              backgroundColor: HexColor('#1C2833'),
              appBarTheme: AppBarTheme(
                backgroundColor:  HexColor('#1C2833'),
                titleSpacing: 20.0,
                backwardsCompatibility: false,
                elevation: 0.0,
                systemOverlayStyle: SystemUiOverlayStyle(
                  statusBarIconBrightness: Brightness.light,
                  statusBarColor: HexColor('#1C2833 '),
                ),
                titleTextStyle: const TextStyle(
                  color: Colors.white,
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
                iconTheme: const IconThemeData(
                  color: Colors.white,
                ),
              ),
              bottomNavigationBarTheme: BottomNavigationBarThemeData(
                type: BottomNavigationBarType.fixed,
                selectedItemColor: Colors.deepOrange,
                unselectedItemColor: Colors.grey,
                backgroundColor: HexColor('#1C2833 '),
              ),
              textTheme: const TextTheme(
                bodyText1: TextStyle(
                  color: Colors.white,
                  fontSize: 18.0,
                  fontWeight: FontWeight.w600,
                ),
                bodyText2: TextStyle(
                  color: Colors.white,
                  fontSize: 16.0,
                  fontWeight: FontWeight.w600,
                ),
              ),

            ),
            themeMode:AppCubit.get(context).isDark?ThemeMode.dark:ThemeMode.light,
            home:  Home(),
            debugShowCheckedModeBanner: false,
          );
        },
      ),
    );
  }
}


