class ResponseModel<T> {
  late ResponsStatus status;
  late T data;
  late String message;

  ResponseModel.loading(this.message) : status = ResponsStatus.LOADING;
  ResponseModel.completed(this.data) : status = ResponsStatus.COMPLETED;
  ResponseModel.error(this.message) : status = ResponsStatus.ERROR;

  @override
  String toString() {
    return "Status : $status \n Message : $message \n Data : $data";
  }
}

// ignore: constant_identifier_names   استیت ما سه حالت کلی داره
enum ResponsStatus { LOADING, COMPLETED, ERROR }
