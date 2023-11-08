import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:layanan/models/jadwal_mapel_model.dart';
import 'package:layanan/services/jadwal_mapel_service.dart';

part 'jadwal_mapel_event.dart';
part 'jadwal_mapel_state.dart';

class JadwalMapelBloc extends Bloc<JadwalMapelEvent, JadwalMapelState> {
  JadwalMapelBloc() : super(JadwalMapelInitial()) {
    on<JadwalMapelEvent>((event, emit) async {
      if (event is JadwalMapelGet) {
        try {
          emit(JadwalMapelLoading());
          final jadwals = await JadwalMapelService().getJadwalMapels();
          emit(JadwalMapelSuccess(jadwals));
        } catch (e) {
          emit(JadwalMapelFailed(e.toString()));
        }
      }
    });
  }
}
