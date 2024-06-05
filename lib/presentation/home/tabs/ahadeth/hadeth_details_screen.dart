import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iqra/presentation/home/tabs/ahadeth/hadeth_model.dart';
import 'package:provider/provider.dart';

import '../../../../shared/provider/theme_provider.dart';

class HadethDetailsScreen extends StatefulWidget {
  const HadethDetailsScreen({super.key});

  @override
  State<HadethDetailsScreen> createState() => _HadethDetailsScreenState();
}

class _HadethDetailsScreenState extends State<HadethDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    ThemeProvider themeProvider = Provider.of<ThemeProvider>(context);
    HadethModel hadeth =
        ModalRoute.of(context)!.settings.arguments as HadethModel;
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
          title: Text(hadeth.title),
        ),
        body: Column(
          children: [
            Expanded(
              child: Card(
                elevation: 10,
                color:  themeProvider.themeMode == ThemeMode.dark
                    ? Theme.of(context).colorScheme.primary
                    : Colors.white.withOpacity(0.60),
                child: hadeth.content.isNotEmpty
                    ? SingleChildScrollView(
                        child: Text(
                          hadeth.content,
                          style:
                              Theme.of(context).textTheme.titleMedium?.copyWith(
                                    fontSize: 20.sp,
                                  ),
                          textDirection: TextDirection.rtl,
                          textAlign: TextAlign.center,
                        ),
                      )
                    : const Center(
                        child: CircularProgressIndicator(),
                      ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
