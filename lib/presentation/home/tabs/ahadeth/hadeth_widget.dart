import 'package:flutter/material.dart';
import 'package:iqra/presentation/home/tabs/ahadeth/hadeth_model.dart';

import '../../../../core/utils/routes.dart';

class HadethWidget extends StatelessWidget {
  HadethModel hadethModel;

  HadethWidget({super.key, required this.hadethModel});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, Routes.hadethDetailsScreen,
            arguments: hadethModel);
      },
      child: Text(
        hadethModel.title,
        style: Theme.of(context).textTheme.titleMedium,
        textAlign: TextAlign.center,
      ),
    );
  }
}
