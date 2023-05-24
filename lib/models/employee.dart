class Employee {
  final String name;
  final String role;
  final String department;

  Employee({
    required this.name,
    required this.role,
    required this.department,
  });


  @override
  String toString() {
    return 'Employee{name: $name, role: $role, department: $department}';
  }

  factory Employee.fromJson(Map<String, dynamic> json) {
    return Employee(
      name: json['name'] as String,
      role: json['role'] as String,
      department: json['department'] as String,
    );
  }
}
