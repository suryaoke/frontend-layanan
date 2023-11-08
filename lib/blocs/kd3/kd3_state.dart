part of 'kd3_bloc.dart';

sealed class Kd3State extends Equatable {
  const Kd3State();

  @override
  List<Object> get props => [];
}

final class Kd3Initial extends Kd3State {}
class Kd3Loading extends Kd3State {}

class Kd3Failed extends Kd3State {
  final String e;
  const Kd3Failed(this.e);

  @override
  List<Object> get props => [e];
}

class Kd3Success extends Kd3State {
  final List<Kd3Model> kd3;
  const Kd3Success(this.kd3);

  @override
  List<Object> get props => [kd3];
}
