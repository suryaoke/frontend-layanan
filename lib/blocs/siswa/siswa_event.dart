part of 'siswa_bloc.dart';

sealed class SiswaEvent extends Equatable {
  const SiswaEvent();

  @override
  List<Object> get props => [];
}

class SiswaGet extends SiswaEvent{}