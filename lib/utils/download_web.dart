import 'dart:convert';
import 'dart:js_interop';
import 'package:web/web.dart';

/// Triggers a browser download of [text] as a file named [fileName].
void saveTextFile(String text, String fileName) {
  // convert Dart UTF-8 bytes to a JS array…
  final bytes = utf8.encode(text);
  final jsArray = JSArray.from(bytes.toJS);

  // …and build a Blob/URL for download
  final blob = Blob(jsArray);
  final url = URL.createObjectURL(blob);

  // create and click an <a> element
  final anchor = HTMLAnchorElement()
    ..href = url
    ..download = fileName;
  document.body?.append(anchor);
  anchor.click();
  anchor.remove();

  // clean up
  URL.revokeObjectURL(url);
}
