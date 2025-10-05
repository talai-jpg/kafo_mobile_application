import '../model/complaint_model.dart';

class ComplaintData {
  static List<Complaint> getComplaints() {
    return [
      Complaint(
        title: "انقطاع في الكهرباء",
        subtitle: "شقة 10، عمارة النفل",
        tags: ["كهرباء", "عاجل"],
        imageUrl: "assets/images/Cimage2.png",
        time: "منذ ساعة",
      ),
      Complaint(
        title: "تسريب في المياه",
        subtitle: "شقة 1 ، عمارة النرجس",
        tags: ["مياه"],
        imageUrl: "assets/images/Cimage1.png",
        time: "منذ 3 ساعات",
      ),
      Complaint(
        title: "ضوضاء الشقة المجاورة",
        subtitle: "شقة 3، عمارة سلطان",
        tags: ["آخر"],
        imageUrl: "assets/images/Cimage4.png",
        time: "منذ يوم واحد",
      ),
      Complaint(
        title: "رطوبة في الجدران",
        subtitle: "شقة 5، عمارة النرجس",
        tags: ["مياه"],
        imageUrl: "assets/images/Cimage3.png",
        time: "منذ يومين",
      ),
    ];
  }
}
