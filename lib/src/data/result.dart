class Result<T> {
  T data;
  Status status;
  String message;

  Result.loading(this.message) : status = Status.Loading;
  Result.completed(this.data) : status = Status.Completed;
  Result.error(this.message) : status = Status.Error;

  @override
  String toString() {
    return "Status=$status \n Message=$message \n Data=$data";
  }
}

enum Status { Loading, Completed, Error }
