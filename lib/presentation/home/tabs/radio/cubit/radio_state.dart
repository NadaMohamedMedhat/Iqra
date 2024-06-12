part of 'radio_cubit.dart';

@immutable
sealed class RadioState {}

final class RadioInitialState extends RadioState {}
final class RadioSuccessState extends RadioState {}
final class RadioErrorState extends RadioState {
  final String error;
  RadioErrorState(this.error);
}
