class Company {
  final int id;
  final String name;
  final String industry;
  final int employees;

  Company({
    required this.id,
    required this.name,
    required this.industry,
    required this.employees,
  });

  // Factory constructor to create a Company instance from JSON
  factory Company.fromJson(Map<String, dynamic> json) {
    return Company(
      id: json['id'],
      name: json['name'],
      industry: json['industry'],
      employees: json['employees'],
    );
  }
}
