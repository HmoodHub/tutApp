/// On Boarding Models

class OnBoardingModel {
  String title, subTitle, image;

  OnBoardingModel({
    required this.title,
    required this.subTitle,
    required this.image,
  });
}

class OnBordingObjectModel {
  OnBoardingModel model;
  int numOfPageView;
  int currentIndex;

  OnBordingObjectModel({
    required this.model,
    required this.numOfPageView,
    required this.currentIndex,
  });
}

/// Login Models
class CustomerModel {
  String id, name;
  int numOfNotification;

  CustomerModel(this.id, this.name, this.numOfNotification);
}
class ContactModel {
  String link, phone, email;

  ContactModel(this.link, this.phone, this.email);
}
class AuthenticationModel {
  CustomerModel? customerOb;
  ContactModel? contactOb;

  AuthenticationModel(this.customerOb, this.contactOb);
}
