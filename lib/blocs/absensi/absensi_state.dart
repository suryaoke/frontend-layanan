part of 'absensi_bloc.dart';

sealed class AbsensiState extends Equatable {
  const AbsensiState();
  
  @override
  List<Object> get props => [];
}

final class AbsensiInitial extends AbsensiState {}

class AbsensiLoading extends AbsensiState {}

class AbsensiFailed extends AbsensiState {
  final String e;
  const AbsensiFailed(this.e);

  @override
  List<Object> get props => [e];
}

class AbsensiSuccess extends AbsensiState {
  final List<AbsensiModel> absensi;
  const AbsensiSuccess(this.absensi);

  @override
  List<Object> get props => [absensi];
}
