import 'package:ventura_hr/shared/helper/result.helper.dart';
import 'package:ventura_hr/shared/stores/states/store.states.dart';

import '../enums/result-type.enum.dart';

class SuccessResult<TData> extends Result<TData> {
  final TData data;

  const SuccessResult(this.data, [ResultTypes status = ResultTypes.ok]) : super(status);
}

extension DataStateExtension<TData> on Result<TData> {
  DataState<TData> toDataState() {
    if (isSuccess()) {
      return DataLoadedState(getSuccessData());
    } else {
      return DataErrorState(toErrorResult());
    }
  }
}
