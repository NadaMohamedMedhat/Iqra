import 'package:flutter/material.dart';
import 'package:iqra/core/utils/routes.dart';
import 'package:iqra/presentation/home/tabs/quran/sura_model.dart';

class SuraWidget extends StatelessWidget {
  String suraName;
  String versesNumber;
  int index; //need to know user selected sura

  SuraWidget(
      {super.key,
      required this.suraName,
      required this.versesNumber,
      required this.index});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, Routes.suraDetailsScreen,
            arguments: SuraModel(suraName: suraName, index: index));
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            versesNumber,
            style: Theme.of(context).textTheme.titleMedium,
            textAlign: TextAlign.center,
          ),
          Text(
            suraName,
            style: Theme.of(context).textTheme.titleMedium,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
