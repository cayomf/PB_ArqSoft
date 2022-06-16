import 'dart:developer';

import 'package:ventura_hr/shared/extensions/string.extension.dart';

class Endpoint {
  final String? baseUrl;
  final String path;

  final bool useMock;
  final String? mockPath;

  const Endpoint({
    this.baseUrl,
    required this.path,
    this.useMock = false,
    this.mockPath,
  });

  String buildUrl({Map<String, dynamic>? queryParams, Map<String, String>? routeParams}) {
    log("Chamando $path.");

    var base = baseUrl ?? "";
    var url = path;
    if (routeParams != null) {
      url = url.useRouteParams(routeParams);
    }
    if (queryParams != null) {
      url = url.addQueryParams(queryParams);
    }
    if (url[0] != '/') {
      url = '/' + url;
    }
    if (base.endsWith('/')) {
      base = base.substring(0, base.length - 2);
    }

    return base + url;
  }
}
