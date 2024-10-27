class CustomException implements Exception {
  const CustomException([this.message]);

  final String? message;

  @override
  String toString() => '$runtimeType : ${message ?? ''}';
}

class NotImplemented extends CustomException {
  const NotImplemented([super.message]);
}
