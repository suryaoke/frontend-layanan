part of 'absensi_data_bloc.dart';

sealed class AbsensiDataEvent extends Equatable {
  const AbsensiDataEvent();

  @override
  List<Object> get props => [];
}

class AbsensiDataGet extends AbsensiDataEvent {}
