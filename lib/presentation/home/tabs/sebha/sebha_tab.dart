import 'dart:async';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../../provider/theme_provider.dart';

class SebhaTab extends StatefulWidget {
  @override
  State<SebhaTab> createState() => _SebhaTabState();
}

class _SebhaTabState extends State<SebhaTab> {
  double animatedTurn = 0;
  int tsbehaCounter = 0;
  int doaaListIndex = 0;

  List<String> doaa = [
    'سبحان الله',
    "الحمد الله",
    'الله اكبر',
    'استغفر الله',
  ];

  void oneTsbehaFinshed() {
    setState(() {
      tsbehaCounter = 0;
      doaaListIndex++;
    });
  }

  void sebhaLogic() {
    setState(() {
      animatedTurn += 1 / 34;
      tsbehaCounter++;
      if (tsbehaCounter == 34) {
        oneTsbehaFinshed();
      }
      if (doaaListIndex == doaa.length) {
        doaaListIndex = 0;
      }
    });
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Timer(const Duration(seconds: 0), () {
        showAlertMessage(context);
      });
    });
  }

  void showAlertMessage(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        //ThemeProvider themeProvider = Provider.of<ThemeProvider>(context);
        return AlertDialog(
          backgroundColor:Theme.of(context).colorScheme.primary,
          title: Text(
            "sebha".tr(),
            style: Theme.of(context).textTheme.titleMedium,
          ),
          content: Text(
            "alert_message".tr(),
            style: Theme.of(context)
                .textTheme
                .titleMedium
                ?.copyWith(fontSize: 15.sp),
          ),
          actions: [
            ElevatedButton(
              child: Text(
                "ok".tr(),
                style: Theme.of(context)
                    .textTheme
                    .titleMedium
                    ?.copyWith(fontSize: 10.sp,color: Colors.black),
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Stack(
            alignment: Alignment.center,
            children: [
              Positioned(
                top: -210,
                right: 25,
                left: 30,
                child: Image.asset(
                  'assets/images/head of seb7a.png',
                ),
              ),
              Positioned(
                top: 70,
                child: GestureDetector(
                  onTap: () {
                    sebhaLogic();
                  },
                  child: AnimatedRotation(
                    turns: animatedTurn,
                    duration: const Duration(seconds: 1),
                    child: Image.asset(
                      'assets/images/body of seb7a.png',
                      height: 250.h,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: Column(
            children: [
              Text(
                "tasbeeh_count".tr(),
                style: Theme.of(context).textTheme.titleMedium,
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                width: 80.w,
                height: 80.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Theme.of(context).colorScheme.secondary,
                ),
                child: Center(
                  child: Text(
                    tsbehaCounter.toString(),
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                width: 200,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Theme.of(context).colorScheme.primary,
                ),
                child: TextButton(
                  onPressed: () {
                    sebhaLogic();
                  },
                  child: Text(
                    doaa[doaaListIndex],
                    style: Theme.of(context)
                        .textTheme
                        .titleMedium
                        ?.copyWith(color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
