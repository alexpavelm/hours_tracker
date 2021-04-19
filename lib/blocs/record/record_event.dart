import 'package:equatable/equatable.dart';
import 'package:record_repository/record_repository.dart';

abstract class RecordEvent extends Equatable {
  const RecordEvent();

  @override
  List<Object> get props => [];
}

class LoadRecords extends RecordEvent {}

class AddRecord extends RecordEvent {
  final Record record;

  const AddRecord(this.record);

  @override
  List<Object> get props => [record];

  @override
  String toString() => 'AddRecord { record: $record }';
}

class UpdateRecord extends RecordEvent {
  final Record updatedRecord;

  const UpdateRecord(this.updatedRecord);

  @override
  List<Object> get props => [updatedRecord];

  @override
  String toString() => 'UpdateRecord { updatedRecord: $updatedRecord }';
}

class DeleteRecord extends RecordEvent {
  final Record record;

  const DeleteRecord(this.record);

  @override
  List<Object> get props => [record];

  @override
  String toString() => 'DeleteRecord { record: $record }';
}

class RecordsUpdated extends RecordEvent {
  final List<Record> records;

  const RecordsUpdated(this.records);

  @override
  List<Object> get props => [records];
}
