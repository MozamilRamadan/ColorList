import 'package:bloc/bloc.dart';
import 'package:colors_list/color_list.dart';
import 'package:colors_list/cubit/states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import '../color_model.dart';
import '../dio_helper.dart';
import '../globals.dart';

class AppCubit extends Cubit<AppStates>{
  AppCubit() : super(InitialAppStates());
  static AppCubit get(context) => BlocProvider.of(context);

  // http://23.88.122.29:8080/JubaSoup-0.1/share/sh_colors/getAllByNameSorted?name=&sort=createddate,desc
  ColorsModel? model;
  var box;
  List colors = [];
  void storeBox()async {
    box = await Hive.openBox('color_box');
    colors = box.values
        .toList()
        .reversed
        .toList();
    print(colors);
emit(ColorsStoreBoxSuccessStates());
  }
  void getColors(){
    emit(ColorsLoadingState());
      DioHelper.getData().then((value) {
          //print(value);
        model = ColorsModel.fromJson(value.data);
        for (var element in model!.data!.apColors!) {
          colors.add({
            element.name!: element.name,
          });
          ColorList(name: '${element.name}', code: '${element.code}');
        }
        //print(colors);
      emit(ColorsSuccessStates());
    }).catchError((error){
      print(error.toString());
     emit(ColorsErrorStates(error.toString()));
    }
    );

  }

}