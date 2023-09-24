// ignore_for_file: constant_identifier_names

enum Languages {
  ARABIC,
  ENGLISH,
}

const arabic = 'ar';
const english = 'en';

extension SetLanguageApp on Languages {
  String getValue() {
    switch (this) {
      case Languages.ARABIC:
        return arabic;
      case Languages.ENGLISH:
        return english;
    }
  }
}