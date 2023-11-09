part of 'tugas_kd4_bloc.dart';

sealed class TugasKd4State extends Equatable {
  const TugasKd4State();
  
  @override
  List<Object> get props => [];
}

final class TugasKd4Initial extends TugasKd4State {}

class TugasKd4Loading extends TugasKd4State {}

class TugasKd4Failed extends TugasKd4State {
  final String e;
  const TugasKd4Failed(this.e);

  @override
  List<Object> get props => [e];
}

class TugasKd4Success extends TugasKd4State {
  final List<TugasKd4Model> tugaskd4;
  const TugasKd4Success(this.tugaskd4);

  @override
  List<Object> get props => [tugaskd4];
}
