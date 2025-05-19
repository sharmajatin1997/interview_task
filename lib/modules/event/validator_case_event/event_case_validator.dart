
class EventCaseValidator {
  EventCaseValidator._();

  static String? validatorEvent(String value, String? validationType, [String? comp1, String? comp2]) {
    switch (validationType) {
      case "name":
        {
          if (value.isEmpty) {
            return "Please enter event name";
          }
        }
      case "date":
        {
          if (value.isEmpty) {
            return "Please enter event date";
          }
        }
      case "time":
        {
          if (value.isEmpty) {
            return "Please enter event time";
          }
        }
      case "description":
        {
          if (value.isEmpty) {
            return "Please enter event description";
          }

        }
    }
    return null;
  }
}
