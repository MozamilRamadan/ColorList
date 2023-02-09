import 'package:colors_list/color_list.dart';
import 'package:colors_list/color_model.dart';
import 'package:colors_list/cubit/cubit.dart';
import 'package:colors_list/cubit/states.dart';
import 'package:colors_list/globals.dart';
import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:hive/hive.dart';

import 'cubit/cubit.dart';

class HomeScreen extends StatelessWidget {
   HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(create: (context) => AppCubit()..getColors()..storeBox(),
    child: BlocConsumer<AppCubit,AppStates>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = AppCubit.get(context);
          var box;
          return Scaffold(
            appBar: AppBar(
              title: Text('Colors'),
            ),
            body: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Column(
                  children: [
                    ConditionalBuilder(
                      condition: cubit.model != null,
                      builder: (context) {
                        return ListView.builder(
                            scrollDirection: Axis.vertical,
                            shrinkWrap: true,
                            physics: BouncingScrollPhysics(),
                            itemBuilder:(context, index)
                            {

                              //xcode = cubit.model!.data!.apColors![index].code as List;
                             // xName = cubit.model!.data!.apColors![index].name as List;
                              //print('$xName Is $xcode ');
                             // box = await Hive.openBox('hive_box');
                              ColorList colorList =ColorList(
                                  name: cubit.model!.data!.apColors![index].name,
                                  code: cubit.model!.data!.apColors![index].code
                              ) ;
                              cubit.box.add(ColorList);
                              return rowItem(cubit.model!, index);

                            },
                            itemCount: cubit.model!.data!.apColors!.length);
                      },
                      fallback: (context) => Center(child: const CircularProgressIndicator()),

                    )
                    ],
                ),
              ),
            ),
            floatingActionButton: FloatingActionButton(
                onPressed: (){
                  //cubit.storeData();
                 // cubit.storeBox();
                },
              child: Icon(Icons.deblur_rounded),

            ),

          );
        }, ),
    );
  }
  //Color color = Colors.AppCubit.get(context).model!.data!.apColors[0].name ;
  Widget rowItem(ColorsModel model,index) => Padding(
    padding: const EdgeInsets.symmetric(vertical: 03.0),
    child: Container(
      width: 60,
      height: 40,
      decoration: BoxDecoration(
        color: HexColor("${model.data!.apColors![index].code}"),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text('${model.data!.apColors![index].name}',
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
          backgroundColor: Colors.grey[300],
        ),
        ),
      ),
    ),
  ) ;

}
