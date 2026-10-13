abstract class SolutionsFailure {
  final String message;
  final dynamic cause;

  const SolutionsFailure(this.message, [this.cause]);

  @override
  String toString() => 'SolutionsFailure: $message';
}

class SolutionsAssetLoadFailure extends SolutionsFailure {
  const SolutionsAssetLoadFailure(super.message, [super.cause]);
}

class SolutionsParseFailure extends SolutionsFailure {
  const SolutionsParseFailure(super.message, [super.cause]);
}

class SolutionsNetworkFailure extends SolutionsFailure {
  const SolutionsNetworkFailure(super.message, [super.cause]);
}
