class ReportModel {
  final String judulResep;
  final String message;
  final String email;
  final String name;

  ReportModel(
      {required this.judulResep,
      required this.message,
      required this.email,
      required this.name});
  factory ReportModel.fromJson(Map<String, dynamic> json) => ReportModel(
      judulResep: json['judulResep'],
      message: json['message'],
      email: json['email'],
      name: json['name']);

  Map<String, dynamic> toJson() => {
        "judulResep": judulResep,
        "message": message,
        "email": email,
        "name": name
      };
}
