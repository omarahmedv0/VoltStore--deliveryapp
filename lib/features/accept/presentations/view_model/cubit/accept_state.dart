part of 'accept_cubit.dart';

sealed class AcceptState {}

final class AcceptInitial extends AcceptState {}
final class GetAcceptDataSuccess extends AcceptState {}
final class GetAcceptDataFailere extends AcceptState {}
final class GetAcceptDataLoading extends AcceptState {}

final class AcceptOrderSuccess extends AcceptState {}
final class AcceptOrderFailere extends AcceptState {}
final class AcceptOrderLoading extends AcceptState {}
