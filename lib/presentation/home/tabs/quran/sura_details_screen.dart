import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iqra/presentation/home/tabs/quran/sura_model.dart';

class SuraDetailsScreen extends StatefulWidget {
  SuraDetailsScreen({super.key});

  @override
  State<SuraDetailsScreen> createState() => _SuraDetailsScreenState();
}

class _SuraDetailsScreenState extends State<SuraDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    SuraModel suraModel =
        ModalRoute.of(context)!.settings.arguments as SuraModel;
    if (ayatLines.isEmpty) {
      readSuraFile(suraModel.index);
    }
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/home_background.png'),
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
                  separatorBuilder: (context, index) => Divider(
                    color: Theme.of(context).colorScheme.primary,
                    thickness: 5.h,
                  ),
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
