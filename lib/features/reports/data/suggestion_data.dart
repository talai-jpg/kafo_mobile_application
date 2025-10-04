import '../model/suggestion_model.dart';

class SuggestionData {
  static List<Suggestion> getSuggestions() {
    return [
      Suggestion(
        title: "مقبض متوائل",
        subtitle: "مبنى 12، شقة 8",
        status: "تحسين",
        imageUrl: "assets/images/Simage1.png",
        time: "منذ ساعتين",
      ),
      Suggestion(
        title: "فرن قديم",
        subtitle: "مبنى 6، شقة 2",
        status: "تجديد",
        imageUrl: "assets/images/Simage2.png",
        time: "منذ 5 ساعات",
      ),
      Suggestion(
        title: "أدراج قديمة",
        subtitle: "مبنى 7، شقة 3",
        status: "تجديد",
        imageUrl: "assets/images/Simage3.png",
        time: "منذ يوم واحد",
      ),
    ];
  }
}
