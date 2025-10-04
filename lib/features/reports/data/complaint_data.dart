import '../model/complaint_model.dart';

class ComplaintData {
  static List<Complaint> getComplaints() {
    return [
      Complaint(
        title: "انقطاع في الكهرباء",
        subtitle: "مبنى 4، عمارة الشمل",
        tags: ["كهرباء", "عاجل"],
        imageUrl: "assets/images/Cimage1.png",
        time: "منذ ساعة",
      ),
      Complaint(
        title: "تسرب في المياه",
        subtitle: "مبنى 8، عمارة النرجس",
        tags: ["مياه"],
        imageUrl: "assets/images/Cimage2.png",
        time: "منذ 3 ساعات",
      ),
      Complaint(
        title: "ضوضاء الشقة المجاورة",
        subtitle: "مبنى 3، عمارة سلطان",
        tags: ["آخر"],
        imageUrl: "assets/images/Cimage3.png",
        time: "منذ يوم واحد",
      ),
      Complaint(
        title: "رطوبة في الجدران",
        subtitle: "مبنى 5، عمارة النرجس",
        tags: ["مياه"],
        imageUrl: "assets/images/Cimage4.png",
        time: "منذ يومين",
      ),
      Complaint(
        title: "رطوبة في الجدران",
        subtitle: "مبنى 5، عمارة النرجس",
        tags: ["مياه"],
        imageUrl: "assets/images/Cimage4.png",
        time: "منذ يومين",
      ),
    ];
  }
}
