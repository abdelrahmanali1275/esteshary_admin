part of 'record_cubit.dart';

@immutable
abstract class RecordState {}

class RecordInitial extends RecordState {}
class RecordPlay extends RecordState {}
class RecordStop extends RecordState {}
class RecordPause extends RecordState {}
