export 'download_stub.dart'   // default for non-web
    if (dart.library.html)    // when dart:html is available (i.e. web)
      'download_web.dart';