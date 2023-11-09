import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:layanan/models/tugas_kd4_model.dart';
import 'package:layanan/services/tugas_kd4_service.dart';

part 'tugas_kd4_event.dart';
part 'tugas_kd4_state.dart';

class TugasKd4Bloc extends Bloc<TugasKd4Event, TugasKd4State> {
  TugasKd4Bloc() : super(TugasKd4Initial()) {
    on<TugasKd4Event>((event, emit) async {
      if (event is TugasKd4Get) {
        try {
          emit(TugasKd4Loading());
          final tugaskd4s = await TugasKd4Service().getTugasKd4s();
          emit(TugasKd4Success(tugaskd4s));
        } catch (e) {
          emit(TugasKd4Failed(e.toString()));
        }
      }
    });
  }
}
