part of 'meme_view_cubit.dart';

@immutable
abstract class MemeViewState extends Equatable {}

class MemeViewInitial extends MemeViewState {
  @override
  List<Object> get props => [];
}

class MemeViewCardLoaded extends MemeViewState {
  final List<MemeModel> memes;

  MemeViewCardLoaded({required this.memes});

  @override
  List<MemeModel> get props => memes;
}
