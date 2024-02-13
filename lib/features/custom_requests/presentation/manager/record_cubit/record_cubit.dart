import 'package:audioplayers/audioplayers.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'record_state.dart';

class RecordCubit extends Cubit<RecordState> {
  RecordCubit() : super(RecordInitial());

  final audio = AudioPlayer();

  int? selectedIndex;

  play(
    audioUrl,index
  ) async {
    await audio.play(UrlSource(audioUrl!));
    selectedIndex = index;
    emit(RecordPlay());
  }

  stop(index) async {
    await audio.stop();
    selectedIndex = -1;
    emit(RecordStop());
  }

  change(index, audioUrl) async {
    if (selectedIndex == index) {
      selectedIndex = -1;
      await audio.play(UrlSource(audioUrl!));
      emit(RecordPlay());
    } else {
      selectedIndex = index;
      await audio.stop();
      emit(RecordPlay());
    }
  }
}
