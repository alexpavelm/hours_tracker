import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:meta/meta.dart';
import '../entities/entities.dart';

@immutable
class Record {
  final String id;
  final String project_id;
  final String type;
  final Timestamp start_time;
  final Timestamp end_time;

  const Record(
      {required String id,
      required String project_id,
      required String type,
      required Timestamp start_time,
      required Timestamp end_time})
      : this.id = id,
        this.project_id = project_id,
        this.type = type,
        this.start_time = start_time,
        this.end_time = end_time;

  Record copyWith(
      {required String id,
        required String project_id,
        required String type,
        required Timestamp start_time,
        required Timestamp end_time}) {
    return Record(
      id: id,
      project_id: project_id,
      type: type,
      start_time: start_time,
      end_time: end_time,
    );
  }

  @override
  int get hashCode =>
      id.hashCode ^ project_id.hashCode ^ type.hashCode ^ start_time.hashCode ^ end_time.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Record &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          project_id == other.project_id &&
          type == other.type &&
          start_time == other.start_time &&
          end_time == other.end_time;

  @override
  String toString() {
    return 'Record{ id: $id, project_id: $project_id, type: $type, start_time: $start_time, end_time: $end_time}';
  }

  RecordEntity toEntity() {
    return RecordEntity(id, project_id, type, start_time, end_time);
  }

  static Record fromEntity(RecordEntity entity) {
    return Record(
      id: entity.id,
      project_id: entity.project_id,
      type: entity.type,
      start_time: entity.start_time,
      end_time: entity.end_time,
    );
  }
}
