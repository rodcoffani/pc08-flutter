import 'dart:io';
import 'dart:convert';

class Task {
  bool readFromInput = false;
  bool showLineNumbers = false;
  List<String> paths = [];

  Task(bool? readFromInput, bool? showLineNumbers, List<String>? paths) {
    this.readFromInput = readFromInput ?? false;
    this.showLineNumbers = showLineNumbers ?? false;
    this.paths = paths ?? [];
  }

  Future<void> dcat() async {
    exitCode = 0;

    if (readFromInput) {
      await stdin.pipe(stdout);
    } else {
      for (final path in paths) {
        var lineNumber = 1;
        final lines = utf8.decoder
            .bind(File(path).openRead())
            .transform(const LineSplitter());
        try {
          await for (final line in lines) {
            if (showLineNumbers) {
              stdout.write('${lineNumber++} ');
            }
            stdout.writeln(line);
          }
        } catch (_) {
          await _handleError(path);
        }
      }
    }
  }

  Future<void> _handleError(String path) async {
    if (await FileSystemEntity.isDirectory(path)) {
      stderr.writeln('error: $path is a directory');
    } else {
      exitCode = 2;
    }
  }
}
