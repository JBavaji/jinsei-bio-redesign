abstract class B2bFailure {
  final String message;
  final dynamic cause;

  const B2bFailure(this.message, [this.cause]);

  @override
  String toString() => 'B2bFailure: $message';
}

class B2bValidationFailure extends B2bFailure {
  const B2bValidationFailure(super.message, [super.cause]);
}

class B2bNetworkFailure extends B2bFailure {
  const B2bNetworkFailure(super.message, [super.cause]);
}

class B2bServerFailure extends B2bFailure {
  const B2bServerFailure(super.message, [super.cause]);
}
