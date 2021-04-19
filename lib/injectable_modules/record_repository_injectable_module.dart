
import 'package:injectable/injectable.dart';
import 'package:record_repository/record_repository.dart';

@module
abstract class RecordRepositoryInjectableModule {

  @lazySingleton
  RecordRepository get recordRepository => FirebaseRecordRepository();
}