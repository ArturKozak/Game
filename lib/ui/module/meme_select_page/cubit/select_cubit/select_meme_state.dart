part of 'select_meme_cubit.dart';

abstract class SelectMemeState extends Equatable {
  const SelectMemeState();

  @override
  List<Object> get props => [];
}

class SelectMemeInitial extends SelectMemeState {}

class SelectMemeAdded extends SelectMemeState {
  final List<MemeModel> selectedMemes;

  const SelectMemeAdded({required this.selectedMemes});

  @override
  List<MemeModel> get props => selectedMemes;
}
