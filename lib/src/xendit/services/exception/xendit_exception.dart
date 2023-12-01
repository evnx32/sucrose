// Xendit Exception
// Base class for all Xendit exceptions will return XenditError object

class XenditException implements Exception {
  late Map error;

  XenditException(this.error);

  Map toMap() {
    return error;
  }

  Map toJson() {
    return error;
  }
}
