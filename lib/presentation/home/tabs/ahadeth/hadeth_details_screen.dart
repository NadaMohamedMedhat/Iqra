import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iqra/presentation/home/tabs/ahadeth/hadeth_model.dart';

class HadethDetailsScreen extends StatefulWidget {
  const HadethDetailsScreen({super.key});

  @override
  State<HadethDetailsScreen> createState() => _HadethDetailsScreenState();
}

class _HadethDetailsScreenState extends State<HadethDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    HadethModel hadeth = ModalRoute.of(context)!.settings.arguments as HadethModel;
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/home_background.png'),
          fit: BoxFit.fill,
        ),
      ),
      child: Scaffold(
        appBar: AppBar(
          title:  Text(hadeth.title),
        ),
        body: Column(
          children: [
            Expanded(
              child: Card(
                elevation: 10,
                child:
                hadeth.content.isNotEmpty
                    ? SingleChildScrollView(
                      child: Text(
                       hadeth.content,
                        style: Theme.of(context).textTheme.titleMedium?.copyWith(
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
