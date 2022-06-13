import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hadith/cubit/states.dart';

import '../shared/remote/dio.dart';

class HadithCubit extends Cubit<HadithStates> {
  HadithCubit() : super(InitialStates());

  static HadithCubit get(context) => BlocProvider.of(context);

  List<dynamic> hadith = [];

  void getHadith() {
    emit(LoadingStates());
    DioHelper.getData(url: 'api/ahadith/all/ar-tashkeel').then((value) {
       hadith = value.data["AllChapters"];

        // print(hadith[2]['Ar_Text']);
      emit(GetHadithSuccessStates(hadith));
    }).catchError((error) {
      emit(GetHadithErrorStates());
      print(error.toString());
    });
  }



}
