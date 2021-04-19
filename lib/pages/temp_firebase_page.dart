import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hours_tracker/blocs/record/record.dart';
import 'package:hours_tracker/injection.dart';
import 'package:hours_tracker/pages/temp_firebase_view.dart';

class TempFirebasePage extends StatefulWidget {
  @override
  _TempFirebasePageState createState() => _TempFirebasePageState();
}

class _TempFirebasePageState extends State<TempFirebasePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: BlocProvider(
            create: (_) => getIt<RecordBloc>()..add(LoadRecords()),
            child: TempFirebaseView(),
          ),
        ),
      ),
    );
  }
}
