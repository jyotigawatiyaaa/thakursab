class ExceptionHandling implements Exception {
  final String? message;
  final String? prefix;
  final String? url;

  ExceptionHandling([this.message, this.prefix, this.url]);
}

class BadRequestException extends ExceptionHandling {
  BadRequestException([
    String? message,
    String? url,
  ]) : super(message, "Bad Requiest", url);
}

class FetchDataException extends ExceptionHandling {
  FetchDataException([
    String? message,
    String? url,
  ]) : super(message, "Unable to process", url);
}

class ApiNotRespondingException extends ExceptionHandling {
  ApiNotRespondingException([
    String? message,
    String? url,
  ]) : super(message, "Server Not Responding ", url);
}

class UnAuthorizedException extends ExceptionHandling {
  UnAuthorizedException([
    String? message,
    String? url,
  ]) : super(message, "UnAuthorized Access", url);
}
