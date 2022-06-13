import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hadith/cubit/cubit.dart';
import 'package:hadith/cubit/states.dart';

class HadithDetails extends StatelessWidget {

  final dynamic hadith;
   const HadithDetails( {Key? key, required this.hadith}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HadithCubit, HadithStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: Text('حديث ${hadith["Hadith_ID"]}'),
            centerTitle: true,

          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(
                child: Column(
                  children:  [
                    const Text(
                      ': الحديث ',
                      style: TextStyle(
                        color: Colors.teal,
                        fontWeight: FontWeight.bold,
                        fontSize: 22
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(15),
                      width: double.infinity,
                      height: 400,
                      decoration: BoxDecoration(
                          color: Colors.black12,
                          borderRadius: BorderRadius.circular(30)),
                      child: SingleChildScrollView(
                        physics: const BouncingScrollPhysics(),
                        child: Text(
                          '${hadith['Ar_Text']}',
                          textDirection: TextDirection.rtl,
                          style: const TextStyle(
                              fontSize: 18,
                              color: Colors.teal,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    const SizedBox(height: 15,),
                    const Text(
                      ': سند الحديث ',
                      style: TextStyle(
                          color: Colors.teal,
                          fontWeight: FontWeight.bold,
                          fontSize: 22
                      ),

                    ),
                    Container(
                      padding: EdgeInsets.all(15),
                      width: double.infinity,
                      height: 100,
                      decoration: BoxDecoration(
                          color: Colors.black12,
                          borderRadius: BorderRadius.circular(30)),
                      child: SingleChildScrollView(
                        physics: const BouncingScrollPhysics(),
                        child: Text(
                          '${hadith['Ar_Sanad_1']}',
                          textDirection: TextDirection.rtl,
                          style: const TextStyle(
                              fontSize: 18,
                              color: Colors.teal,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
