// Copyright 2018 The Flutter Architecture Sample Authors. All rights reserved.
// Use of this source code is governed by the MIT license that can be found
// in the LICENSE file.

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

class RecordEntity extends Equatable {
  final String id;
  final String project_id;
  final String type;
  final Timestamp start_time;
  final Timestamp end_time;

  const RecordEntity(this.id, this.project_id, this.type, this.start_time, this.end_time);

  Map<String, Object> toJson() {
    return {
      'id': id,
      'project_id': project_id,
      'type': type,
      'start_time': start_time,
      'end_time': end_time,
    };
  }

  @override
  List<Object> get props => [id, project_id, type, start_time, end_time];

  @override
  String toString() {
    return 'RecordEntity { id: $id, project_id: $project_id, type: $type, start_time: $start_time, end_time: $end_time}';
  }

  static RecordEntity fromJson(Map<String, Object> json) {
    return RecordEntity(
      json['id'] as String,
      json['project_id'] as String,
      json['type'] as String,
      json['start_time'] as Timestamp,
      json['end_time'] as Timestamp,
    );
  }

  static RecordEntity fromSnapshot(DocumentSnapshot snap) {
    return RecordEntity(
      snap.id,
      snap.data()!['project_id'],
      snap.data()!['type'],
      snap.data()!['start_time'],
      snap.data()!['end_time'],
    );
  }

  Map<String, Object> toDocument() {
    return {
      'project_id': project_id,
      'type': type,
      'start_time': start_time,
      'end_time': end_time,
    };
  }
}
