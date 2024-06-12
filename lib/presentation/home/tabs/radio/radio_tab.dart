import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:iqra/presentation/home/tabs/radio/widgets/radio_body_widget.dart';

import 'cubit/radio_cubit.dart';

class RadioTab extends StatelessWidget {
  const RadioTab({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RadioCubit()..getRadios(),
      child: BlocBuilder<RadioCubit, RadioState>(
        builder: (context, state) {
          switch (state) {
            case RadioInitialState():
              return const Center(
                child: CircularProgressIndicator(),
              );
            case RadioSuccessState():
              return RadioBodyWidget();
            case RadioErrorState():
              return Text(
                  textAlign: TextAlign.center,
                  state.error,
                  style: Theme.of(context).textTheme.titleMedium);
          }
        },
      ),
    );
  }
}
