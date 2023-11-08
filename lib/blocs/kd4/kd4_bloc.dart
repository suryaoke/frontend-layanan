import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:layanan/models/kd4_model.dart';
import 'package:layanan/services/kd4_service.dart';

part 'kd4_event.dart';
part 'kd4_state.dart';

class Kd4Bloc extends Bloc<Kd4Event, Kd4State> {
  Kd4Bloc() : super(Kd4Initial()) {
    on<Kd4Event>((event, emit) async {
      if (event is Kd4Get) {
        try {
          emit(Kd4Loading());
          final kd4s = await Kd4Service().getKd4s();
          emit(Kd4Success(kd4s));
        } catch (e) {
          emit(Kd4Failed(e.toString()));
        }
      }
    });
  }
}
