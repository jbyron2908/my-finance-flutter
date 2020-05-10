import 'package:my_finance_flutter/core/constants/operation_state/operation_state_constants.dart';
import 'package:my_finance_flutter/core/constants/operation_type/operation_type_constants.dart';
import 'package:my_finance_flutter/core/data_source/database/client/database_client.dart';
import 'package:my_finance_flutter/core/model/category/category_converter.dart';
import 'package:my_finance_flutter/core/model/payee/payee_converter.dart';
import 'package:my_finance_flutter/core/model/template_operation/template_operation_model.dart';

class TemplateOperationConverter {
  static TemplateOperationEntity toEntity(TemplateOperationModel model) {
    return TemplateOperationEntity(
      id: model.id,
      remoteId: model.remoteId,
      deleted: model.deleted,
      title: model.title,
      value: model.value,
      type: model.type.id,
      state: model.state.id,
      description: model.description,
      payee: model.payee?.id,
      category: model.category?.id,
    );
  }

  static TemplateOperationModel toModel(
    TemplateOperationEntity entity, {
    PayeeEntity payee,
    CategoryEntity category,
    CategoryEntity parentCategory,
  }) {
    return TemplateOperationModel(
      id: entity.id,
      remoteId: entity.remoteId,
      deleted: entity.deleted,
      title: entity.title,
      value: entity.value,
      type: OperationTypeConstants.getById(entity.type),
      state: OperationStateConstants.getById(entity.state),
      description: entity.description,
      payee: payee != null ? PayeeConverter.toModel(payee) : null,
      category: category != null
          ? CategoryConverter.toModel(category, parent: parentCategory)
          : null,
    );
  }
}
