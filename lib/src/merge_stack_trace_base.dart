/// Created by: Erlang Parasu 2024
const kMergeStackTraceDefaultSeparator = '#------>';

StackTrace mergeTrace(
  StackTrace firstTrace,
  StackTrace secondTrace, [
  String separator = kMergeStackTraceDefaultSeparator,
]) {
  return StackTrace.fromString(
    [firstTrace, secondTrace].join('$separator\n'),
  );
}

StackTrace mergeTraces(
  List<StackTrace> traces, [
  String separator = kMergeStackTraceDefaultSeparator,
]) {
  return StackTrace.fromString(
    traces.join('$separator\n'),
  );
}
