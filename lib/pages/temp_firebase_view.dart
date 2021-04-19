import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hours_tracker/blocs/record/record.dart';
import 'package:record_repository/record_repository.dart';

class TempFirebaseView extends StatefulWidget {
  @override
  _TempFirebaseViewState createState() => _TempFirebaseViewState();
}

class _TempFirebaseViewState extends State<TempFirebaseView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<RecordBloc, RecordState>(
        builder: (context, state) {
          if (state is RecordsLoading) {
            return const Center(child: CircularProgressIndicator());
          }
          if (state is RecordsLoaded) {
            return Column(
              children: [
                Container(
                  height: 600,
                  child: ListView(
                    children: state.records
                        .map((record) => recordWidget(record))
                        .toList(),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    final Record r = Record(
                      id: "DUMMY",
                      project_id: "DUMMY",
                      type: "record dummy",
                      start_time: Timestamp.fromDate(DateTime.now()),
                      end_time: Timestamp.fromDate(
                          DateTime.now().add(const Duration(hours: 1))),
                    );
                    context.read<RecordBloc>().add(AddRecord(r));
                  },
                  child: Container(
                    height: 120,
                    width: 800,
                    decoration: BoxDecoration(
                      color: Theme.of(context).buttonColor,
                      borderRadius: BorderRadius.circular(25),
                    ),
                    child: Center(
                      child: Text(
                        "add dummy data",
                        style: Theme.of(context).textTheme.button,
                      ),
                    ),
                  ),
                ),
              ],
            );
          }
          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }

  Widget recordWidget(Record record) {
    return Container(
      height: 200,
      child: Column(
        children: [
          Text(record.id),
          Text(record.project_id),
          Text(record.type),
          Text(record.start_time.toDate().toIso8601String()),
          Text(record.end_time.toDate().toIso8601String()),
        ],
      ),
    );
  }
}
