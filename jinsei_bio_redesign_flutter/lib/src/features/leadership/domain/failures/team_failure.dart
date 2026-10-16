import 'package:equatable/equatable.dart';

abstract class TeamFailure extends Equatable {
  final String message;

  const TeamFailure([this.message = 'An unexpected error occurred']);

  @override
  List<Object?> get props => [message];
}

class TeamServerFailure extends TeamFailure {
  const TeamServerFailure([super.message = 'Server failure encountered']);
}

class TeamCacheFailure extends TeamFailure {
  const TeamCacheFailure([super.message = 'Local cache retrieval failed']);
}

class TeamNetworkFailure extends TeamFailure {
  const TeamNetworkFailure([super.message = 'Network connectivity error']);
}

class TeamAssetLoadFailure extends TeamFailure {
  final StackTrace? stackTrace;
  const TeamAssetLoadFailure(super.message, [this.stackTrace]);
}

class TeamParseFailure extends TeamFailure {
  final Object? cause;
  const TeamParseFailure(super.message, [this.cause]);
}
