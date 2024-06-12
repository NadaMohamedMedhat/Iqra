import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iqra/presentation/home/tabs/radio/cubit/radio_cubit.dart';

class RadioBodyWidget extends StatelessWidget {
  const RadioBodyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    RadioCubit radioCubit = BlocProvider.of<RadioCubit>(context);
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "quran_radio".tr(),
          style: Theme.of(context).textTheme.titleMedium,
        ),
        SizedBox(
          height: 10.h,
        ),
        Image.asset(
          'assets/images/radio.png',
        ),
        SizedBox(
          height: 10.h,
        ),
        Text(
          radioCubit.currentRadio!.name ?? '',
          style: Theme.of(context).textTheme.titleMedium,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        SizedBox(
          height: 10.h,
        ),
        Row(
          //todo: icons arrange in Arabic language
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
              onPressed: () {
                radioCubit.previousRadio();
              },
              icon: const Icon(
                Icons.skip_previous_rounded,
                size: 40,
              ),
            ),
            IconButton(
              onPressed: () {
                radioCubit.clickOnPlayButton();
              },
              icon: (radioCubit.isPlaying)
                  ? const Icon(
                      Icons.pause_rounded,
                      size: 40,
                    )
                  : const Icon(
                      Icons.play_arrow_rounded,
                      size: 40,
                    ),
            ),
            IconButton(
              onPressed: () {
                radioCubit.nextRadio();
              },
              icon: const Icon(
                Icons.skip_next_rounded,
                size: 40,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
