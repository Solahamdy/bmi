part of 'bmi_cubit.dart';

@immutable
abstract class BmiState {}

class BmiInitial extends BmiState {}
class CalculateBmiState extends BmiState {}
class CalculateHeightState extends BmiState {}
class WeightState extends BmiState {}
class AgeState extends BmiState {}
class ChangeGenderState extends BmiState {}




