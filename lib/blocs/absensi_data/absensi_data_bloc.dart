import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:layanan/models/absensi_data_model.dart';
import 'package:layanan/services/absensi_data_service.dart';

part 'absensi_data_event.dart';
part 'absensi_data_state.dart';

class AbsensiDataBloc extends Bloc<AbsensiDataEvent, AbsensiDataState> {
  AbsensiDataBloc() : super(AbsensiDataInitial()) {
    on<AbsensiDataEvent>((event, emit) async {
      if (event is AbsensiDataGet) {
        try {
          emit(AbsensiDataLoading());
          final absensis = await AbsensiDataService().getAbsensidatas();
          emit(AbsensiDataSuccess(absensis));
        } catch (e) {
          emit(AbsensiDataFailed(e.toString()));
        }
      }
    });
  }
}
