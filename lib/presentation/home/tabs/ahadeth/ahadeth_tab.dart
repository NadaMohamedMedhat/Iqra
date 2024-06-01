import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AhadethTab extends StatelessWidget {
  const AhadethTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Center(
            child: Image.asset('assets/images/hadth_image.png'),
          ),
          SizedBox(
            height: 5.h,
          ),
          Divider(
            color: Theme.of(context).colorScheme.primary,
            thickness: 5.h,
          ),
          Text(
            'Ahadeth',
            style: Theme.of(context).textTheme.titleMedium,
          ),
          Divider(
            color: Theme.of(context).colorScheme.primary,
            thickness: 5.h,
          ),
        ],
      ),
    );
  }

  readAhadethFiles(int index) async {
    String ahadethContent =
        await rootBundle.loadString('assets/files/ahadeth.txt');
  }
}
