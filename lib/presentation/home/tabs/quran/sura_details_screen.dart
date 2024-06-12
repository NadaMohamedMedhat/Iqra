import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iqra/presentation/home/tabs/quran/sura_model.dart';
import 'package:provider/provider.dart';

import '../../../../shared/provider/theme_provider.dart';

class SuraDetailsScreen extends StatefulWidget {
  SuraDetailsScreen({super.key});

  @override
  State<SuraDetailsScreen> createState() => _SuraDetailsScreenState();
}

class _SuraDetailsScreenState extends State<SuraDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    ThemeProvider themeProvider = Provider.of<ThemeProvider>(context);
    SuraModel suraModel =
        ModalRoute.of(context)!.settings.arguments as SuraModel;
    if (ayatLines.isEmpty) {
      readSuraFile(suraModel.index);
    }
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(themeProvider.themeMode == ThemeMode.dark
              ? 'assets/images/dark_bg.png'
              : 'assets/images/home_background.png'),
          fit: BoxFit.fill,
        ),
      ),
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            suraModel.suraName,
            style: Theme.of(context).textTheme.titleMedium,
          ),
        ),
        body: Card(
          elevation: 10,
          color: themeProvider.themeMode == ThemeMode.dark
              ? Theme.of(context).colorScheme.primary
              : Colors.white.withOpacity(0.60),
          child: ayatLines.isNotEmpty
              ? ListView.separated(
                  itemBuilder: (context, index) => Text(
                    '${ayatLines[index]} (${index + 1})',
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          fontSize: 20.sp,
                        ),
                    textDirection: TextDirection.rtl,
                    textAlign: TextAlign.center,
                  ),
                  separatorBuilder: (context, index) => const Divider(),
                  itemCount: ayatLines.length,
                )
              : const Center(
                  child: CircularProgressIndicator(),
                ),
        ),
      ),
    );
  }

  List<String> ayatLines = [];

  readSuraFile(int index) async {
    String suraFile =
        await rootBundle.loadString('assets/files/quran/${index + 1}.txt');
    setState(() {
      ayatLines = suraFile.split('\n');
    });
  }
}
