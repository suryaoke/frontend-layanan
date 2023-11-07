import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:layanan/models/absensi_model.dart';
import 'package:layanan/services/absensi_service.dart';

part 'absensi_event.dart';
part 'absensi_state.dart';

class AbsensiBloc extends Bloc<AbsensiEvent, AbsensiState> {
  AbsensiBloc() : super(AbsensiInitial()) {
  on<AbsensiEvent>((event, emit) async {
      if (event is AbsensiGet) {
        try {
          emit(AbsensiLoading());
          final absensis = await AbsensiService().getAbsensis();
          emit(AbsensiSuccess(absensis));
        } catch (e) {
          emit(AbsensiFailed(e.toString()));
        }
      }
    });
  }
}
