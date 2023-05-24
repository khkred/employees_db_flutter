import 'package:employees_db/models/employee.dart';
import 'package:employees_db/screens/add_employee.dart';
import 'package:employees_db/widgets/employee_card.dart';
import 'package:flutter/material.dart';

class EmployeeList extends StatefulWidget {
  const EmployeeList({Key? key}) : super(key: key);

  @override
  State<EmployeeList> createState() => _EmployeeListState();
}

class _EmployeeListState extends State<EmployeeList> {
  List<Employee> employees = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Employee List')),
      body: ListView.builder(
        itemCount: employees.length,
        itemBuilder: (context, index) {
          Employee employee = employees[index];
          return EmployeeCard(employee: employee);
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final newEmployee = await Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const AddEmployee()),
          );

          if (newEmployee != null) {
            setState(() {
              employees.add(newEmployee);
            });
          }
        },
        child: const Icon(Icons.person_add_alt_rounded),
      ),
    );
  }
}
