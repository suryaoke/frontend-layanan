import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:layanan/models/info_model.dart';

import 'package:layanan/services/info_service.dart';

part 'info_event.dart';
part 'info_state.dart';

class InfoBloc extends Bloc<InfoEvent, InfoState> {
  InfoBloc() : super(InfoInitial()) {
    on<InfoEvent>((event, emit) async {
      if (event is InfoGet) {
        try {
          emit(InfoLoading());
          final infos = await InfoService().getInfos();
          emit(InfoSuccess(infos));
        } catch (e) {
          emit(InfoFailed(e.toString()));
        }
      }
    });
  }
}
