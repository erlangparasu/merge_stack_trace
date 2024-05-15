import 'package:merge_stack_trace/merge_stack_trace.dart';

/// Created by: Erlang Parasu 2024

class MyCustomException implements Exception {
  final dynamic message;

  MyCustomException([this.message]);

  @override
  String toString() {
    Object? message = this.message;
    if (message == null) return "MyCustomException";
    return "MyCustomException: $message";
  }
}

void exampleFunction1() {
  throw MyCustomException('Something went wrong');
}

void exampleFunction2() {
  try {
    exampleFunction1();
  } catch (e, trace) {
    Error.throwWithStackTrace(
      MyCustomException('$e'),
      mergeTrace(StackTrace.current, trace),
    );
  }
}

void main() {
  try {
    exampleFunction2();
  } catch (e, trace) {
    print('catch exception: <output>(${e.runtimeType}) $e</output>');
    print('catch trace: <output>$trace</output>');
  }
}
