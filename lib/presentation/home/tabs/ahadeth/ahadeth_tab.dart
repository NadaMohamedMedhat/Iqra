import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../../provider/theme_provider.dart';
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
    ThemeProvider themeProvider = Provider.of<ThemeProvider>(context);
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
                  color: themeProvider.themeMode == ThemeMode.light
                      ? Theme.of(context).colorScheme.primary
                      : Theme.of(context).colorScheme.secondary,
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
                    separatorBuilder: (context, index) => const Divider(),
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
