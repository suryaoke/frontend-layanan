part of 'tugas_kd3_bloc.dart';

sealed class TugasKd3State extends Equatable {
  const TugasKd3State();
  
  @override
  List<Object> get props => [];
}

final class TugasKd3Initial extends TugasKd3State {}

class TugasKd3Loading extends TugasKd3State {}

class TugasKd3Failed extends TugasKd3State {
  final String e;
  const TugasKd3Failed(this.e);

  @override
  List<Object> get props => [e];
}

class TugasKd3Success extends TugasKd3State {
  final List<TugasKd3Model> tugaskd3;
  const TugasKd3Success(this.tugaskd3);

  @override
  List<Object> get props => [tugaskd3];
}
