import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'hadeth_model.dart';
import 'hadeth_widget.dart';

class AhadethTab extends StatefulWidget {
  AhadethTab({super.key});

  @override
  State<AhadethTab> createState() => _AhadethTabState();
}

class _AhadethTabState extends State<AhadethTab> {
  @override
  Widget build(BuildContext context) {
    if (oneHadeth.isEmpty) {
      readAhadethFiles();
    }
    return Scaffold(
      body: Column(
        children: [
          Center(
            child: Image.asset('assets/images/hadth_image.png'),
          ),
          SizedBox(
            height: 5.h,
          ),
          Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(vertical: 2.h),
            decoration: BoxDecoration(
              border: Border.symmetric(
                horizontal: BorderSide(
                  color: Theme.of(context).colorScheme.primary,
                  width: 5.h,
                ),
              ),
            ),
            child: Text(
              textAlign: TextAlign.center,
              'ahadeth'.tr(),
              style: Theme.of(context).textTheme.titleMedium,
            ),
          ),
          oneHadeth.isNotEmpty
              ? Expanded(
                  child: ListView.separated(
                    itemBuilder: (context, index) => HadethWidget(
                      hadethModel: oneHadeth[index],
                    ),
                    separatorBuilder: (context, index) => Divider(
                      color: Theme.of(context).colorScheme.primary,
                      thickness: 5.h,
                    ),
                    itemCount: oneHadeth.length,
                  ),
                )
              : const Center(child: CircularProgressIndicator()),
        ],
      ),
    );
  }

  List<HadethModel> oneHadeth = [];

  void readAhadethFiles() async {
    String readAllAhadeth =
        await rootBundle.loadString('assets/files/ahadeth.txt');
    List<String> hadethSplitted = readAllAhadeth.trim().split('#');
    for (int i = 0; i < hadethSplitted.length; i++) {
      List<String> oneHadethSplitted = hadethSplitted[i].trim().split('\n');
      String hadethTitle = oneHadethSplitted[0];
      oneHadethSplitted.removeAt(0);
      String hadethContent = oneHadethSplitted.join('');

      oneHadeth.add(HadethModel(title: hadethTitle, content: hadethContent));
    }
    setState(() {});
  }
}
