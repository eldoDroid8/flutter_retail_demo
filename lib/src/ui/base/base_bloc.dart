import 'package:rxdart/subjects.dart';

abstract class BaseBloc {
  /// relays error information
  // ignore: close_sinks
  final _errorSubject = PublishSubject<String>();

  Sink<String> get errorSink => _errorSubject.sink;

  Stream<String> get errorStream => _errorSubject.stream;
}