import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:layanan/models/tugas_kd3_model.dart';
import 'package:layanan/services/tugas_kd3_service.dart';

part 'tugas_kd3_event.dart';
part 'tugas_kd3_state.dart';

class TugasKd3Bloc extends Bloc<TugasKd3Event, TugasKd3State> {
  TugasKd3Bloc() : super(TugasKd3Initial()) {
    on<TugasKd3Event>((event, emit) async {
      if (event is TugasKd3Get) {
        try {
          emit(TugasKd3Loading());
          final tugaskd3s = await TugasKd3Service().getTugasKd3s();
          emit(TugasKd3Success(tugaskd3s));
        } catch (e) {
          emit(TugasKd3Failed(e.toString()));
        }
      }
    });
  }
}
