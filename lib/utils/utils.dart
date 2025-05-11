class AppUtils {
  static final commonTypos = [
    "gamil.com",
    "gnail.com",
    "gmaill.com",
    "gamail.com",
    "hotnail.com",
    "yahho.com",
    "yaho.com",
  ];
  static String suggestDomain(String wrongDomain) {
    switch (wrongDomain) {
      case "gamil.com":
      case "gnail.com":
      case "gmaill.com":
      case "gamail.com":
        return "gmail.com";
      case "hotnail.com":
        return "hotmail.com";
      case "yahho.com":
      case "yaho.com":
        return "yahoo.com";
      default:
        return "a valid email domain";
    }
  }
}
