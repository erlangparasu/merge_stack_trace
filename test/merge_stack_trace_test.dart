import 'package:merge_stack_trace/merge_stack_trace.dart';
import 'package:test/test.dart';

/// Created by: Erlang Parasu 2024

class MyCustomException implements Exception {
  final dynamic message;

  MyCustomException([this.message]);

  @override
  String toString() {
    Object? message = this.message;
    if (message == null) {
      return "MyCustomException";
    }
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
    // throw MyCustomException('$e');

    // Error.throwWithStackTrace(
    //   MyCustomException('$e'),
    //   trace,
    // );

    Error.throwWithStackTrace(
      MyCustomException('$e'),
      mergeTrace(StackTrace.current, trace),
    );
  }
}

void main() {
  group('A group of tests', () {
    setUp(() {
      // Additional setup goes here.
    });

    test('First Test', () {
      try {
        exampleFunction2();
      } catch (e, trace) {
        print('<ExceptionOutput>(${e.runtimeType}) $e</ExceptionOutput>');

        print('<TraceOutput>$trace</TraceOutput>');

        expect(
          '$trace'.contains(' exampleFunction2 ') &&
              '$trace'.contains(' exampleFunction1 '),
          isTrue,
        );
      }
    });
  });
}
