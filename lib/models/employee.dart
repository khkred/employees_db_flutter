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
}
