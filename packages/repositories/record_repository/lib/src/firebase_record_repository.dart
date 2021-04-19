// Copyright 2018 The Flutter Architecture Sample Authors. All rights reserved.
// Use of this source code is governed by the MIT license that can be found
// in the LICENSE file.

import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import '../record_repository.dart';
import 'entities/entities.dart';

class FirebaseRecordRepository implements RecordRepository {
  final recordCollection = FirebaseFirestore.instance.collection('records');

  @override
  Future<void> addNewRecord(Record record) {
    return recordCollection.add(record.toEntity().toDocument());
  }

  @override
  Future<void> deleteRecord(Record record) async {
    return recordCollection.doc(record.id).delete();
  }

  @override
  Stream<List<Record>> records() {
    return recordCollection.orderBy("start_time").snapshots().map((snapshot) {
      return snapshot.docs
          .map((doc) => Record.fromEntity(RecordEntity.fromSnapshot(doc)))
          .toList();
    });
  }

  @override
  Future<void> updateRecord(Record update) {
    return recordCollection.doc(update.id).update(update.toEntity().toDocument());
  }
}
