// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:game/data/model/meme/meme_model.dart';

part 'select_meme_state.dart';

class SelectMemeCubit extends Cubit<SelectMemeState> {
  SelectMemeCubit() : super(SelectMemeInitial());

  final _selectedMemes = <MemeModel>[];

  void update(MemeModel selectedMeme) {
    _selectedMemes.add(selectedMeme);

    emit(SelectMemeInitial());

    emit(SelectMemeAdded(selectedMemes: _selectedMemes));
  }
}
