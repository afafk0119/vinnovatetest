class ApiResponse {
  bool? isSuccess;
  dynamic data;
  ErrorResponse? error;

  ApiResponse({
    required this.data,
    required this.isSuccess,
    this.error
  });
}

class ErrorResponse implements Exception{
  bool? isInternetError;
  int? statusCode;
  String? errorCode;
  String? message;

  ErrorResponse({
    this.isInternetError,
    required this.statusCode,
    required this.errorCode,
    required this.message
  }){
    // if (isInternetError == null) {
    //   isInternetError = false;
    // }
  }
}