
class StringsUtil {
  static enumName(String value) {
    return value.toString().substring(value.toString().indexOf('.')+1);
  }
}