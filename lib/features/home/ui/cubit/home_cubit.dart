import 'package:delivery_app/core/helper/app_context.dart';
import 'package:delivery_app/core/helper/session_manager.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/usecases/get_delivery_bills.dart';
import '../../domain/entities/delivery_bill_entity.dart';

part 'home_states.dart';

class HomeCubit extends Cubit<HomeState> {
  final GetDeliveryBills getDeliveryBills;

  List<DeliveryBillEntity> _bills = [];
  List<DeliveryBillEntity> newBills = [];
  List<DeliveryBillEntity> otherBills = [];

  bool isNewSelected = true;

  HomeCubit({required this.getDeliveryBills}) : super(HomeInitial());

  Future<void> fetchDeliveryBills({
    required String dlvryNo,
    required String langNo,
    required String billSrl,
    required String prcssdFlg,
  }) async {
    debugPrint('Fetching delivery bills...');

    emit(HomeLoading());
    try {
      final billsData = await getDeliveryBills(
        dlvryNo: dlvryNo,
        langNo: langNo,
        billSrl: billSrl,
        prcssdFlg: prcssdFlg,
      );
      _bills = billsData;
      debugPrint('Fetched ${_bills.length} bills');
      _categorizeBills();
      if (AppContext.context != null) {
        SessionManager().resetSessionTimer(AppContext.context!);
      }
      emit(HomeSuccess(bills: _bills));
    } catch (e) {
      debugPrint('Error fetching delivery bills: $e');
      emit(HomeFailure(error: e.toString()));
      rethrow;
    }
  }

  _categorizeBills() {
    newBills = _bills.where((bill) => bill.dlvryStatusFlg == '0').toList();
    otherBills = _bills.where((bill) => bill.dlvryStatusFlg != '0').toList();
  }

  void changeNewBillState(bool isSelected) {
    emit(ChangeNewBillStateLoading());
    isNewSelected = isSelected;
    _categorizeBills();
    if (AppContext.context != null) {
      SessionManager().resetSessionTimer(AppContext.context!);
    }
    emit(ChangeNewBillStateSuccess());
  }
}
