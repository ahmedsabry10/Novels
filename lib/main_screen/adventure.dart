import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:novels/Reusable/reusable_component.dart';
import 'package:novels/cubit/cubit_screen.dart';
import 'package:novels/cubit/states_screen.dart';



class Adventure extends StatelessWidget {
  const Adventure({Key? key}) : super(key: key);

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
                  title: AppCubit.get(context).titleEng[index],
                  image: AppCubit.get(context).imageEng[index],
                  description: AppCubit.get(context).descriptionEng[index],
                  link: AppCubit.get(context).linksEng[index],
                ),
                separatorBuilder: (context ,index)=>Container(
                  width: double.infinity,
                  height: 1.0,
                  color:AppCubit.get(context).isDark?HexColor('#34495E'):HexColor('#EAEDED'),
                ),
                itemCount: AppCubit.get(context).titleEng.length));
      },

    );
  }
}
