abstract class CollaborationsFailure {
  final String message;
  final dynamic cause;

  const CollaborationsFailure(this.message, [this.cause]);

  @override
  String toString() => 'CollaborationsFailure: $message';
}

class CollaborationsValidationFailure extends CollaborationsFailure {
  const CollaborationsValidationFailure(super.message, [super.cause]);
}

class CollaborationsNetworkFailure extends CollaborationsFailure {
  const CollaborationsNetworkFailure(super.message, [super.cause]);
}

class CollaborationsServerFailure extends CollaborationsFailure {
  const CollaborationsServerFailure(super.message, [super.cause]);
}
