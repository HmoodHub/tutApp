import 'package:test_app_mvvm/app/extensions.dart';

import '../../app/constants.dart';
import '../../domain/models/models.dart';
import '../response/responses.dart';

extension CustomerResponseToModel on CustomerResponse? {
  CustomerModel toCustomerModel() {
    return CustomerModel(
      this?.id.toNotNullStr() ?? Constants.empty,
      this?.name.toNotNullStr() ?? Constants.empty,
      this?.numOfNotification.toNotNullInt() ?? Constants.zero,
    );
  }
}

extension ContactResponseToModel on ContactResponse? {
  ContactModel toContactModel() {
    return ContactModel(
      this?.phone.toNotNullStr() ?? Constants.empty,
      this?.email.toNotNullStr() ?? Constants.empty,
      this?.link.toNotNullStr() ?? Constants.empty,
    );
  }
}

extension AuthResponseToModel on AuthResponse? {
  AuthenticationModel toAuthenticationModel() {
    return AuthenticationModel(
      this?.customerResponse.toCustomerModel(),
      this?.contactResponse.toContactModel(),
    );
  }
}
