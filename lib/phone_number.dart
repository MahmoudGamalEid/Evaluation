class PhoneNumber {
  String clean(String number) {
    if (number.contains(RegExp(r'[a-zA-Z]'))) {
      throw new FormatException("letters not permitted");
    }
    if (number.contains(RegExp(r'[@:!]'))) {
      throw new FormatException("punctuations not permitted");
    }

    String cleanNumber = "";

    for (var i = 0; i < number.length; i++) {
      if ("0123456789".contains(number[i])) {
        cleanNumber = cleanNumber + number[i];
      }
    }
    if (cleanNumber.length < 10) {
      throw new FormatException("incorrect number of digits");
    } else if (cleanNumber.length > 11) {
      throw new FormatException("more than 11 digits");
    } else if (cleanNumber.length == 11) {
      if (cleanNumber[0] == "1") {
        cleanNumber = cleanNumber.substring(1, cleanNumber.length);
      } else if (cleanNumber[0] == "+" && cleanNumber[1] == "1") {
        cleanNumber = cleanNumber.substring(2, cleanNumber.length);
      } else {
        throw new FormatException("11 digits must start with 1");
      }
    }
    if (cleanNumber[0] == "0") {
      throw new FormatException("area code cannot start with zero");
    } else if (cleanNumber[0] == "1") {
      throw new FormatException("area code cannot start with one");
    } else if (cleanNumber[3] == "0") {
      throw new FormatException("exchange code cannot start with zero");
    } else if (cleanNumber[3] == "1") {
      throw new FormatException("exchange code cannot start with one");
    }
    return cleanNumber;
  }
}
