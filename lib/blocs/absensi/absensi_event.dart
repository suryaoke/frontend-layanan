part of 'absensi_bloc.dart';

sealed class AbsensiEvent extends Equatable {
  const AbsensiEvent();

  @override
  List<Object> get props => [];
}

class AbsensiGet extends AbsensiEvent {}
