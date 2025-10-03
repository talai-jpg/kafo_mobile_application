class Validators {
  static String? validateName(String? value) {
    if (value == null || value.isEmpty) {
      return "الرجاء إدخال الاسم";
    }
    if (value.length < 3) {
      return "الاسم يجب أن يكون 3 أحرف على الأقل";
    }
    return null;
  }

  static String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return "الرجاء إدخال الإيميل";
    }
    if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
      return "الرجاء إدخال إيميل صحيح";
    }
    return null;
  }

  static String? validatePhone(String? value) {
    if (value == null || value.isEmpty) {
      return "الرجاء إدخال رقم الجوال";
    }
    if (!RegExp(r'^\+9665[0-9]{8}$').hasMatch(value)) {
      return "رقم الجوال غير صحيح";
    }
    return null;
  }

  static String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return "الرجاء إدخال كلمة المرور";
    }
    if (value.length < 6) {
      return "كلمة المرور يجب أن تكون 6 أحرف على الأقل";
    }
    if (!RegExp(r'[A-Z]').hasMatch(value)) {
      return "كلمة المرور يجب أن تحتوي على حرف كبير واحد على الأقل";
    }
    return null;
  }
}
