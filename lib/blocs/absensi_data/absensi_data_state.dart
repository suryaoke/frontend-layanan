part of 'absensi_data_bloc.dart';

sealed class AbsensiDataState extends Equatable {
  const AbsensiDataState();

  @override
  List<Object> get props => [];
}

final class AbsensiDataInitial extends AbsensiDataState {}

class AbsensiDataLoading extends AbsensiDataState {}

class AbsensiDataFailed extends AbsensiDataState {
  final String e;
  const AbsensiDataFailed(this.e);

  @override
  List<Object> get props => [e];
}

class AbsensiDataSuccess extends AbsensiDataState {
  final List<AbsensiDataModel> absensi;
  const AbsensiDataSuccess(this.absensi);

  @override
  List<Object> get props => [absensi];
}
