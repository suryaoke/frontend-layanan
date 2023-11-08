import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:layanan/models/kd3_model.dart';
import 'package:layanan/services/kd3_service.dart';

part 'kd3_event.dart';
part 'kd3_state.dart';

class Kd3Bloc extends Bloc<Kd3Event, Kd3State> {
  Kd3Bloc() : super(Kd3Initial()) {
    on<Kd3Event>((event, emit) async {
      if (event is Kd3Get) {
        try {
          emit(Kd3Loading());
          final kd3s = await Kd3Service().getKd3s();
          emit(Kd3Success(kd3s));
        } catch (e) {
          emit(Kd3Failed(e.toString()));
        }
      }
    });
  }
}
