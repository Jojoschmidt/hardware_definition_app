class StringManipulation {

  static String prepareString(String stringToPrepare, int numberOfCharacters) {
    String ellipsis = "...";
    String finalString = "";
    stringToPrepare.trim();
    if (stringToPrepare.startsWith('\n')) {
      stringToPrepare = stringToPrepare.substring(1);
    }
    if (stringToPrepare.endsWith('\n')) {
      stringToPrepare = stringToPrepare.substring(0, stringToPrepare.length - 1);
    }
    stringToPrepare = stringToPrepare.replaceAll('<p>', "");
    stringToPrepare = stringToPrepare.replaceAll('</p>', "");

    stringToPrepare.trim();
    if (stringToPrepare.length > numberOfCharacters - ellipsis.length) {
      finalString = stringToPrepare.substring(0, numberOfCharacters - ellipsis.length)  + ellipsis;
    } else {
      finalString = stringToPrepare;
    }
    return finalString;
  }
  static String prepareTitle(String title){
    return prepareString(title,50);
  }
  static String prepareContent(String content){
    return prepareString(content,83);
  }
}
