import 'package:flutter/material.dart';
import 'package:flutter_islamic_icons/flutter_islamic_icons.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/utils/strings.dart';
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
          title: const Text(Strings.appName),
          actions: [
            IconButton(
              onPressed: () {
                showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: Text(
                          "Language",
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                        actions: [
                          Column(
                            children: [
                              InkWell(
                                onTap: () {
                                  // TODO: localization arabic
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
                                      'Arabic',
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
                                  // TODO: localization english
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
                                      'English',
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
              label: Strings.quran,
            ),
            BottomNavigationBarItem(
              backgroundColor:
                  Theme.of(context).bottomNavigationBarTheme.backgroundColor,
              icon: const Icon(FlutterIslamicIcons.solidMohammad),
              label: Strings.ahadeth,
            ),
            BottomNavigationBarItem(
              backgroundColor:
                  Theme.of(context).bottomNavigationBarTheme.backgroundColor,
              icon: const Icon(FlutterIslamicIcons.tasbih),
              label: Strings.sebha,
            ),
            BottomNavigationBarItem(
              backgroundColor:
                  Theme.of(context).bottomNavigationBarTheme.backgroundColor,
              icon: const Icon(Icons.radio),
              label: Strings.radio,
            ),
          ],
        ),
        body: tabs[currentNavIndex],
      ),
    );
  }
}
