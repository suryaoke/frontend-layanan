part of 'jadwal_mapel_bloc.dart';

sealed class JadwalMapelEvent extends Equatable {
  const JadwalMapelEvent();

  @override
  List<Object> get props => [];
}

class JadwalMapelGet extends JadwalMapelEvent {}
