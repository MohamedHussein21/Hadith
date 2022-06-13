import 'package:buildcondition/buildcondition.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hadith/cubit/cubit.dart';
import 'package:hadith/cubit/states.dart';
import 'package:hadith/shared/componant/componant.dart';

import 'hadith_details.dart';

class HadithScreen extends StatelessWidget {
  const HadithScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HadithCubit, HadithStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var hadith = HadithCubit.get(context).hadith;
        return Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: const Text(
              'الاحاديث',
            ),
          ),
          body: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                BuildCondition(
                    condition: state is! LoadingStates,
                    builder: (context) {
                      return Expanded(
                        child: GridView.builder(
                            gridDelegate:
                                const SliverGridDelegateWithMaxCrossAxisExtent(
                              maxCrossAxisExtent: 200,
                              childAspectRatio: 3 / 2,
                              crossAxisSpacing: 20,
                              mainAxisSpacing: 20,
                            ),
                            itemCount: hadith.length,
                            itemBuilder: (BuildContext ctx, index) {
                              return buildRow(context, hadith[index], () {
                                navigateTo(
                                    context,
                                    HadithDetails(
                                      hadith: hadith[index],
                                    ));
                              });
                            }),
                      );
                    },
                    fallback: (context) =>
                        const Center(child: CircularProgressIndicator()))
              ],
            ),
          ),
        );
      },
    );
  }

  Widget buildRow(
    BuildContext context,
    model,
    GestureTapCallback? onTap,
  ) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: InkWell(
        onTap: onTap,
        child: Container(
          width: double.infinity,
          height: 70,
          decoration: BoxDecoration(
              image: const DecorationImage(
                image: AssetImage('assets/images/background.jpg'),
                fit: BoxFit.cover,
              ),
              color: const Color(0xff3DA53D),
              borderRadius: BorderRadius.circular(30)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(
                width: 25,
              ),
              Text(
                ' حديث ${model["Hadith_ID"]}',
                textAlign: TextAlign.center,
                style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                    color: Colors.teal),
              ),
              const SizedBox(
                width: 25,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
//ListView.separated(
//                           physics: const BouncingScrollPhysics(),
//                             itemBuilder: (context, index) => buildRow(context,hadith[index],(){
//                               navigateTo(context,  HadithDetails(hadith: hadith[index],));
//                             }),
//                             separatorBuilder: (context, index) => const SizedBox(height: 7,),
//                             itemCount: hadith.length),
