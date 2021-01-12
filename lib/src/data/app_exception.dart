class retail_demoException implements Exception {
  final message;
  final prefix;
  retail_demoException([this.message, this.prefix]);
}

class FetchDataException extends retail_demoException {
  FetchDataException([String message]) : super(message, "Communication Error");
}

class BadRequestException extends retail_demoException {
  BadRequestException([String message]) : super(message, "Bad Request");
}

class UnAuthorizedException extends retail_demoException {
  UnAuthorizedException([String message])
      : super(message, "Not enough privilages");
}

class InvalidInputException extends retail_demoException {
  InvalidInputException([String message]) : super(message, "Invalid inputs");
}
