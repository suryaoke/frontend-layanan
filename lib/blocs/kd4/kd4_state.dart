part of 'kd4_bloc.dart';

sealed class Kd4State extends Equatable {
  const Kd4State();

  @override
  List<Object> get props => [];
}

final class Kd4Initial extends Kd4State {}
class Kd4Loading extends Kd4State {}

class Kd4Failed extends Kd4State {
  final String e;
  const Kd4Failed(this.e);

  @override
  List<Object> get props => [e];
}

class Kd4Success extends Kd4State {
  final List<Kd4Model> kd4;
  const Kd4Success(this.kd4);

  @override
  List<Object> get props => [kd4];
}
