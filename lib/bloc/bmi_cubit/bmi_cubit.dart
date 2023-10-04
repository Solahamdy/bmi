import 'package:bmi/models/app_colors.dart';
import 'package:bmi/models/bmi_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../../enums/gender_enum.dart';

part 'bmi_state.dart';

class BmiCubit extends Cubit<BmiState> {
  BmiCubit() : super(BmiInitial());

  static BmiCubit get(context)=> BlocProvider.of(context);

  BMIModel bmiModel = BMIModel.setBMI(weight: 20, age: 20 ,heightValue: 100,);

    GenderEnum selectedGender = GenderEnum.male;

  calculateHeight(value){
    bmiModel.heightValue = value;
    emit(CalculateHeightState());
  }
  calculateBmi(){
    bmiModel.calculateBMI();
    emit(CalculateBmiState());
  }
  decrementWeight(){
    bmiModel.weight = bmiModel.weight! - 1;
    emit(WeightState());
  }
  incrementWeight(){
    bmiModel.weight = bmiModel.weight! + 1;
    emit(WeightState());
  }
  decrementAge(){
    bmiModel.age = bmiModel.age! - 1;
    emit(AgeState());
  }
  incrementAge(){
    bmiModel.age = bmiModel.age! + 1;
    emit(AgeState());
  }

  changeGender(GenderEnum gender){
    selectedGender =gender;
    emit(ChangeGenderState());
  }



}
