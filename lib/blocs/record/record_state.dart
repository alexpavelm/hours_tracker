import 'package:equatable/equatable.dart';
import 'package:record_repository/record_repository.dart';

abstract class RecordState extends Equatable {
  const RecordState();

  @override
  List<Object> get props => [];
}

class RecordsLoading extends RecordState {}

class RecordsLoaded extends RecordState {
  final List<Record> records;

  const RecordsLoaded([this.records = const []]);

  @override
  List<Object> get props => [records];

  @override
  String toString() => 'RecordsLoaded { records: $records }';
}

class RecordsNotLoaded extends RecordState {}