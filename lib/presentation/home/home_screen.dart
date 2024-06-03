import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_islamic_icons/flutter_islamic_icons.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'tabs/ahadeth/ahadeth_tab.dart';
import 'tabs/quran/quran_tab.dart';
import 'tabs/radio/radio_tab.dart';
import 'tabs/sebha/sebha_tab.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentNavIndex = 0;

  List<Widget> tabs = [
    QuranTab(),
    AhadethTab(),
    SebhaTab(),
    const RadioTab(),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/home_background.png'),
          fit: BoxFit.fill,
        ),
      ),
      child: Scaffold(
        appBar: AppBar(
          title: Text("iqra".tr()),
          actions: [
            IconButton(
              onPressed: () {
                showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: Text(
                          "language".tr(),
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                        actions: [
                          Column(
                            children: [
                              InkWell(
                                onTap: () {
                                  context.setLocale(const Locale('ar'));
                                 Navigator.of(context).pop();
                                },
                                child: Row(
                                  children: [
                                    Image.asset(
                                      'assets/images/egypt.png',
                                      height: 30.h,
                                    ),
                                    SizedBox(
                                      width: 10.w,
                                    ),
                                    Text(
                                      "arabic".tr(),
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleMedium
                                          ?.copyWith(
                                            fontSize: 20.sp,
                                          ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 20.h,
                              ),
                              InkWell(
                                onTap: () {
                                  context.setLocale(const Locale('en'));
                                  Navigator.of(context).pop();
                                },
                                child: Row(
                                  children: [
                                    Image.asset(
                                      'assets/images/us.png',
                                      height: 30.h,
                                    ),
                                    SizedBox(
                                      width: 10.w,
                                    ),
                                    Text(
                                      "english".tr(),
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleMedium
                                          ?.copyWith(
                                            fontSize: 20.sp,
                                          ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      );
                    });
              },
              icon: const Icon(Icons.language_outlined),
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.light_mode_outlined),
            ),
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: currentNavIndex,
          onTap: (index) {
            setState(() {
              currentNavIndex = index;
            });
          },
          items: [
            BottomNavigationBarItem(
              backgroundColor:
                  Theme.of(context).bottomNavigationBarTheme.backgroundColor,
              icon: const Icon(FlutterIslamicIcons.quran2),
              label: "quran".tr(),
            ),
            BottomNavigationBarItem(
              backgroundColor:
                  Theme.of(context).bottomNavigationBarTheme.backgroundColor,
              icon: const Icon(FlutterIslamicIcons.solidMohammad),
              label: "ahadeth".tr(),
            ),
            BottomNavigationBarItem(
              backgroundColor:
                  Theme.of(context).bottomNavigationBarTheme.backgroundColor,
              icon: const Icon(FlutterIslamicIcons.tasbih),
              label: "sebha".tr(),
            ),
            BottomNavigationBarItem(
              backgroundColor:
                  Theme.of(context).bottomNavigationBarTheme.backgroundColor,
              icon: const Icon(Icons.radio),
              label: "radio".tr(),
            ),
          ],
        ),
        body: tabs[currentNavIndex],
      ),
    );
  }
}
