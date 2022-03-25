import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:novels/cubit/cubit_screen.dart';
import 'package:novels/cubit/states_screen.dart';


class Home extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit ,AppStates>(
        listener: (context, states){},
        builder: (context, states){
          AppCubit cubit =AppCubit.get(context);
          return Scaffold(
            appBar: AppBar(
              actions: [
                IconButton(
                    onPressed: (){
                      AppCubit.get(context).changeAppMode();
                    },
                    icon: const Icon(
                      Icons.brightness_4_outlined,
                    )),
              ],
            ),
            body: ConditionalBuilder(
              condition: true,
              builder: (context)=>AppCubit.get(context).screens[AppCubit.get(context).currentIndex],
              fallback: (context)=>const Center(child: CircularProgressIndicator()),
            ),
            bottomNavigationBar: BottomNavigationBar(
              items:  const [
                BottomNavigationBarItem(icon: Icon(
                  Icons.menu_book_rounded,
                ),
                  label: 'دينيه',
                ),
                BottomNavigationBarItem(
                  icon:Icon(
                    Icons.directions_run_rounded,
                  ),
                  label: 'مغامره',
                ),
                BottomNavigationBarItem(
                  icon:Icon(
                    Icons.favorite,
                  ),
                  label: 'رومانسيه',
                ),
                BottomNavigationBarItem(
                  icon:
                  Icon(FontAwesomeIcons.virus),
                  label: 'رعب',
                ),
              ],
              type: BottomNavigationBarType.fixed,
              elevation: 50.0,
              currentIndex: cubit.currentIndex,
              onTap: (index){
                AppCubit.get(context).changeIndex(index);
              },
            ),
          );
        }
    );
  }
}
