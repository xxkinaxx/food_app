part of 'transaction_cubit.dart';

sealed class TransactionState extends Equatable {
  const TransactionState();
}

final class TransactionInitial extends TransactionState {
  @override
  List<Object> get props => [];
}

final class TransactionLoaded extends TransactionState{
  final List<Transaction> transaction;

  TransactionLoaded(this.transaction);

  @override
  // TODO: implement props
  List<Object?> get props => [transaction];
}

final class TransactionLoadingFailed extends TransactionState{
  final String message;

  TransactionLoadingFailed(this.message);

  @override
  // TODO: implement props
  List<Object?> get props => [message];
}
