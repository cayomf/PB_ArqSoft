extension StringExtension on String {
  String capitalize() {
    return "${this[0].toUpperCase()}${substring(1)}";
  }

  String capitalizeWords() {
    return replaceAllMapped(RegExp(r'(\w)(\w+)'), (match) => match[1]!.toUpperCase() + match[2]!);
  }

  String cep() {
    var cep = replaceAll(RegExp(r'[^\w\s]+'), '');
    return '${cep.substring(0, 5)}-${cep.substring(5)}';
  }

  String addQueryParams(Map<String, dynamic> params) {
    var queryParams = <String>[];
    for (var key in params.keys) {
      var value = params[key];
      if (value != null) {
        queryParams.add('$key=$value');
      }
    }
    var queryString = queryParams.join('&');

    var prefix = "?";
    if (contains("?")) {
      prefix = "&";
    }

    if (queryParams.isEmpty) {
      prefix = "";
    }

    return '${this}$prefix$queryString';
  }

  String useRouteParams(Map<String, String> params) {
    var url = this;
    var keys = params.keys;
    for (var element in keys) {
      url = url.replaceAll('{{$element}}', params[element]!);
    }
    return url;
  }

  String pascalToCamelCase() {
    if (isEmpty) return "";

    var codeCamelCase = this[0].toLowerCase() + substring(1);

    return codeCamelCase;
  }
}
