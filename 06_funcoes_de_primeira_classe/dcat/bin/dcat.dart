import 'package:args/args.dart';
import 'package:dcat/dcat.dart';

const lineNumber = 'line-number';

void log(String txt) {
  print("${DateTime.now().toString()} : $txt");
}

void main(List<String> arguments) {
  final parser = ArgParser();
  parser.addFlag(lineNumber, negatable: false, abbr: 'n');
  ArgResults argResults = parser.parse(arguments);
  final paths = argResults.rest;

  final readFromInput = paths.isEmpty;

  final task = Task(readFromInput, argResults[lineNumber], paths);

  task.dcat(log);

}
