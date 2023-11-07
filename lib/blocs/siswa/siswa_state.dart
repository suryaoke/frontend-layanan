part of 'siswa_bloc.dart';

sealed class SiswaState extends Equatable {
  const SiswaState();

  @override
  List<Object> get props => [];
}

class SiswaInitial extends SiswaState {}

class SiswaLoading extends SiswaState {}

class SiswaFailed extends SiswaState {
  final String e;
  const SiswaFailed(this.e);

  @override
  List<Object> get props => [e];
}

class SiswaSuccess extends SiswaState {
  final List<SiswaModel> siswa;
  const SiswaSuccess(this.siswa);

  @override
  List<Object> get props => [siswa];
}
