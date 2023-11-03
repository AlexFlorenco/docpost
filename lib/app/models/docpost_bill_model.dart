class DocpostBillModel {
  final String? logo;
  final String nameRecipient;
  final String dueDate;
  final double value;

  DocpostBillModel({
    this.logo,
    required this.nameRecipient,
    required this.dueDate,
    required this.value,
  });
}
