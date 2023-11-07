import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:layanan/models/siswa_model.dart';
import 'package:layanan/services/siswa_service.dart';

part 'siswa_event.dart';
part 'siswa_state.dart';

class SiswaBloc extends Bloc<SiswaEvent, SiswaState> {
  SiswaBloc() : super(SiswaInitial()) {
    on<SiswaEvent>((event, emit) async {
      if (event is SiswaGet) {
        try {
          emit(SiswaLoading());
          final siswas = await SiswaService().getSiswas();
          emit(SiswaSuccess(siswas));
        } catch (e) {
          emit(SiswaFailed(e.toString()));
        }
      }
    });
  }
}
