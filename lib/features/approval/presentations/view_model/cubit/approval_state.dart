part of 'approval_cubit.dart';

sealed class ApprovalState {}

final class ApprovalInitial extends ApprovalState {}

final class GetApproveDataSuccess extends ApprovalState {}
final class GetApproveDataFailere extends ApprovalState {}
final class GetApproveDataLoading extends ApprovalState {}


final class ApproveOrderSuccess extends ApprovalState {}
final class ApproveOrderFailere extends ApprovalState {}
final class ApproveOrderLoading extends ApprovalState {}
