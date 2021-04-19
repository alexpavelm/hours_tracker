import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:hours_tracker/blocs/record/record.dart';
import 'package:injectable/injectable.dart';
import 'package:record_repository/record_repository.dart';

@injectable
class RecordBloc extends Bloc<RecordEvent, RecordState> {
  final RecordRepository _recordRepository;
  StreamSubscription? _recordsSubscription;

  RecordBloc({required RecordRepository recordRepository})
      : _recordRepository = recordRepository,
        super(RecordsLoading());

  @override
  Stream<RecordState> mapEventToState(RecordEvent event) async* {
    if (event is LoadRecords) {
      yield* _mapLoadRecordsToState();
    } else if (event is AddRecord) {
      yield* _mapAddRecordToState(event);
    } else if (event is UpdateRecord) {
      yield* _mapUpdateRecordToState(event);
    } else if (event is DeleteRecord) {
      yield* _mapDeleteRecordToState(event);
    } else if (event is RecordsUpdated) {
      yield* _mapRecordsUpdateToState(event);
    }
  }

  Stream<RecordState> _mapLoadRecordsToState() async* {
    _recordsSubscription?.cancel();
    _recordsSubscription = _recordRepository.records().listen(
          (records) => add(RecordsUpdated(records)),
    );
  }

  Stream<RecordState> _mapAddRecordToState(AddRecord event) async* {
    _recordRepository.addNewRecord(event.record);
  }

  Stream<RecordState> _mapUpdateRecordToState(UpdateRecord event) async* {
    _recordRepository.updateRecord(event.updatedRecord);
  }

  Stream<RecordState> _mapDeleteRecordToState(DeleteRecord event) async* {
    _recordRepository.deleteRecord(event.record);
  }

  Stream<RecordState> _mapRecordsUpdateToState(RecordsUpdated event) async* {
    yield RecordsLoaded(event.records);
  }

  @override
  Future<void> close() {
    _recordsSubscription?.cancel();
    return super.close();
  }
}