class DataResponse<T> {
  StatusEnums status;
  T data;
  String message;

  DataResponse.success(this.data) : status = StatusEnums.SUCCESS;

  DataResponse.error(this.message, this.data) : status = StatusEnums.ERROR;

  DataResponse.connectivityError() : status = StatusEnums.CONNECTIVITY_ERROR;

  @override
  String toString() {
    return "Status : $status \n Message : $message \n Data : $data";
  }
}

enum StatusEnums { SUCCESS, ERROR, CONNECTIVITY_ERROR }
