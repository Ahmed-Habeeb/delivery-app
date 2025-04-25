part of 'home_cubit.dart';


sealed  class HomeState {}

class HomeInitial extends HomeState {}

class HomeLoading extends HomeState {}

class HomeSuccess extends HomeState {
  final List<DeliveryBillEntity> bills;

  HomeSuccess({required this.bills});
}

class HomeFailure extends HomeState {
  final String error;

  HomeFailure({required this.error});
}

 class ChangeNewBillStateLoading extends HomeState {
 }
class ChangeNewBillStateSuccess extends HomeState {
}

