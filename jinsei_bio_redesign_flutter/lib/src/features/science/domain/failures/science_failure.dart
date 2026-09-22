abstract class ScienceFailure {
  final String message;
  final dynamic cause;

  const ScienceFailure(this.message, [this.cause]);

  @override
  String toString() => 'ScienceFailure: $message';
}

class ScienceAssetLoadFailure extends ScienceFailure {
  const ScienceAssetLoadFailure(super.message, [super.cause]);
}

class ScienceParseFailure extends ScienceFailure {
  const ScienceParseFailure(super.message, [super.cause]);
}
