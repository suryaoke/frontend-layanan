part of 'info_bloc.dart';

abstract class InfoState extends Equatable {
  const InfoState();

  @override
  List<Object> get props => [];
}

class InfoInitial extends InfoState {}

class InfoLoading extends InfoState {}

class InfoFailed extends InfoState {
  final String e;
  const InfoFailed(this.e);

  @override
  List<Object> get props => [e];
}

class InfoSuccess extends InfoState {
  final List<InfoModel> info;
  const InfoSuccess(this.info);

  @override
  List<Object> get props => [info];
}
