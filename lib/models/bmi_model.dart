import '../enums/gender_enum.dart';

class BMIModel {
  double ? heightValue;
  int ? weight;
  int ? age;
  double ? result;
  String ? state;

  GenderEnum selectedGender = GenderEnum.male;
  BMIModel.setBMI(
      {this.heightValue, required this.weight, required this.age,this.result,this.state});

  calculateBMI(){
    if(selectedGender == GenderEnum.male) {
      result = weight! / ((heightValue! / 100) * 2);
      if (result ! <= 18.5) {
        state = 'UnderWeight';
      }
      else if (result! > 18.5 && result! < 24.9) {
        state = 'Normal';
      }
      else if (result ! > 25 && result! < 29.9) {
        state = 'OverWeight';
      }
      else if (result ! > 30 && result! < 39.9) {
        state = 'Obese';
      }
      else if (result ! >= 40) {
        state = 'Extremely Obese';
      }
    }

    else if(selectedGender == GenderEnum.female) {
      result = weight! / ((heightValue! / 100) * 2);
      if (result ! <= 17.5) {
        state = 'UnderWeight';
      }
      else if (result! > 17.5 && result! < 24) {
        state = 'Normal';
      }
      else if (result ! > 24 && result! < 29) {
        state = 'OverWeight';
      }
      else if (result! >= 29 && result! < 34) {
        state = 'Obese';
      }
      else if (result! >=34) {
        state = 'OverWeight';
      }
    }


  }
}