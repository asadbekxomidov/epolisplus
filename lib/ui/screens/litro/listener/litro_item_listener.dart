import '../../../../models/models_export.dart';

abstract class OnLitroItemListener {
  void onTapItemInfo(
    LitroRiskLst model,
    int index,
    bool isExpress, {
    bool isBuy = false,
  });

  void onTapLitroInfo(LitroRiskLst model, int index);
}
