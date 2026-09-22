abstract class HomeFailure {
  final String message;
  final dynamic cause;

  const HomeFailure(this.message, [this.cause]);

  @override
  String toString() => 'HomeFailure: $message';
}

class HomeAssetLoadFailure extends HomeFailure {
  const HomeAssetLoadFailure(super.message, [super.cause]);
}

class HomeParseFailure extends HomeFailure {
  const HomeParseFailure(super.message, [super.cause]);
}
