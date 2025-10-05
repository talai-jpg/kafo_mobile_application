import 'package:flutter/material.dart';
import 'package:kafo_app/app_color.dart';
import 'package:kafo_app/features/reports/data/suggestion_data.dart';
import 'package:kafo_app/features/reports/data/complaint_data.dart';
// تأكد أن الموديلز موجودة
import 'package:kafo_app/features/reports/model/complaint_model.dart';
import 'package:kafo_app/features/reports/model/suggestion_model.dart';
// تأكد من المسارات الصحيحة
import 'package:kafo_app/features/reports/screen/widget/gride_card.dart';
import 'package:kafo_app/features/reports/screen/widget/report_card.dart';

class ReportsScreen extends StatefulWidget {
  const ReportsScreen({super.key});

  @override
  State<ReportsScreen> createState() => _ReportsScreenState();
}

class _ReportsScreenState extends State<ReportsScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tab;
  int selectedChip = 1;
  final chipLabels = ["جديدة", "قيد التنفيذ", "منتهية"];

  @override
  void initState() {
    super.initState();
    _tab = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tab.dispose();
    super.dispose();
  }

  // دالة لجلب القائمة (للتصفية)
  List _getFilteredList(bool isComplaints) {
    final baseList = isComplaints
        ? ComplaintData.getComplaints()
        : SuggestionData.getSuggestions();
    // (منطق التصفية الفعلي يجب أن يُطبق هنا بناءً على 'selectedChip')
    return baseList;
  }

  @override
  Widget build(BuildContext context) {
    // حساب ارتفاع الشاشة المتبقي (أو ارتفاع كبير جداً)
    final screenHeight = MediaQuery.of(context).size.height;
    // تقدير الارتفاع الثابت للأعلى (AppBar + Filter Chips) حوالي 180 بكسل
    const double fixedTopHeight = 180.0;

    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'التقارير',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        bottom: TabBar(
          controller: _tab,
          labelColor: AppColor.primary_400,
          unselectedLabelColor: Colors.grey[500],
          labelStyle: const TextStyle(fontWeight: FontWeight.bold),
          tabs: const [
            Tab(text: 'الشكاوى'),
            Tab(text: 'الاقتراحات'),
          ],
        ),
      ),

      // **تغليف المحتوى بالكامل بـ SingleChildScrollView**
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end, // تم التعديل إلى اليمين
          children: [
            _buildFilterChips(),

            // **استخدام SizedBox بدلاً من Expanded مع تحديد ارتفاع**
            SizedBox(
              // تحديد الارتفاع المتبقي من الشاشة + قيمة إضافية تسمح بالتمرير
              height: screenHeight - fixedTopHeight + 1.0,
              child: TabBarView(
                // منع الـ TabBarView من التمرير الداخلي لمنع تداخل التمرير
                physics: const NeverScrollableScrollPhysics(),
                controller: _tab,
                children: [
                  GrideScreen(list: _getFilteredList(true)),
                  GrideScreen(list: _getFilteredList(false)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFilterChips() => Padding(
    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      textDirection: TextDirection.rtl, // لضمان ترتيب العناصر بالشكل الصحيح
      children: [
        Expanded(
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            reverse: true,
            child: Row(
              children: List.generate(
                chipLabels.length,
                (i) => Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: ChoiceChip(
                    showCheckmark: false,
                    label: Text(
                      chipLabels[i],
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    selected: selectedChip == i,
                    selectedColor: AppColor.chipColor,
                    backgroundColor: Colors.white,
                    side: BorderSide(
                      color: selectedChip == i
                          ? AppColor.primary_400
                          : Colors.grey.shade300,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    onSelected: (_) => setState(() => selectedChip = i),
                  ),
                ),
              ),
            ),
          ),
        ),

        const SizedBox(width: 30),

        Row(
          children: [
            Icon(Icons.filter_list, color: AppColor.primary_400, size: 22),
            const SizedBox(width: 4),
            Text(
              "فرز",
              style: TextStyle(
                color: AppColor.primary_400,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ],
    ),
  );
}
