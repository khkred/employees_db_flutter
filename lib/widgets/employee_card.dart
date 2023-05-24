import 'package:employees_db/models/employee.dart';
import 'package:flutter/material.dart';

class EmployeeCard extends StatelessWidget {
  final Employee employee;

  const EmployeeCard({super.key, required this.employee});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2.0,
      margin: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
      child: Container(
        decoration: const BoxDecoration(color: Colors.white),
        child: ListTile(
          contentPadding:
          const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
          leading: const Icon(Icons.account_circle, size: 50.0),
          title: Text(
            employee.name,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text('Role: ${employee.role}'),
              Text('Department: ${employee.department}'),
            ],
          ),
        ),
      ),
    );
  }
}