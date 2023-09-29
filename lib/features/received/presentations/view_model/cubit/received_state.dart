part of 'received_cubit.dart';

sealed class ReceivedState {}

final class ReceivedInitial extends ReceivedState {}
final class GetReceivedDataSuccess extends ReceivedState {}
final class GetReceivedDataFailere extends ReceivedState {}
final class GetReceivedDataLoading extends ReceivedState {}
