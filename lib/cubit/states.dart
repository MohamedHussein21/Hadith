import 'package:hadith/models/hadithModel.dart';

abstract class HadithStates {}

class InitialStates extends HadithStates{}

class LoadingStates extends HadithStates{}

class GetHadithSuccessStates extends HadithStates{

  GetHadithSuccessStates(List hadith);


}

class GetHadithErrorStates extends HadithStates{}

class HadithChangeFavIconState extends HadithStates{}