// Copyright 2018 The Flutter Architecture Sample Authors. All rights reserved.
// Use of this source code is governed by the MIT license that can be found
// in the LICENSE file.

import 'dart:async';

import '../record_repository.dart';


abstract class RecordRepository {
  Future<void> addNewRecord(Record record);

  Future<void> deleteRecord(Record record);

  Stream<List<Record>> records();

  Future<void> updateRecord(Record record);
}
