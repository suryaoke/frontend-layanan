part of 'jadwal_mapel_bloc.dart';

sealed class JadwalMapelState extends Equatable {
  const JadwalMapelState();

  @override
  List<Object> get props => [];
}

final class JadwalMapelInitial extends JadwalMapelState {}

class JadwalMapelLoading extends JadwalMapelState {}

class JadwalMapelFailed extends JadwalMapelState {
  final String e;
  const JadwalMapelFailed(this.e);

  @override
  List<Object> get props => [e];
}

class JadwalMapelSuccess extends JadwalMapelState {
  final List<JadwalmapelModel> jadwal;
  const JadwalMapelSuccess(this.jadwal);

  @override
  List<Object> get props => [jadwal];
}
