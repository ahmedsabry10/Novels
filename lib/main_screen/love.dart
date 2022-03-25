import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:novels/Reusable/reusable_component.dart';
import 'package:novels/cubit/cubit_screen.dart';
import 'package:novels/cubit/states_screen.dart';

class Love extends StatelessWidget {



  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit,AppStates >(
      listener: (context ,state){},
      builder: (context ,state){
        return ConditionalBuilder(
            condition: true,
            builder: (context)=>ListView.separated(
                physics: const BouncingScrollPhysics(),
                itemBuilder: (context,index)=>buildNovelsItem(
                  context ,
                  title: AppCubit.get(context).title[index],
                  image: AppCubit.get(context).image[index],
                  description: AppCubit.get(context).description[index],
                  link: AppCubit.get(context).links[index],
                ),
                separatorBuilder: (context ,index)=>Container(
                  width: double.infinity,
                  height: 1.0,
                  color:AppCubit.get(context).isDark?HexColor('#34495E'):HexColor('#EAEDED'),
                ),
                itemCount: AppCubit.get(context).title.length));
      },

    );
  }
}
