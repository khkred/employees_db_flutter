import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:employees_db/models/employee.dart';
import 'package:employees_db/screens/add_employee.dart';
import 'package:employees_db/widgets/employee_card.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class EmployeeList extends StatefulWidget {
  const EmployeeList({Key? key}) : super(key: key);

  @override
  State<EmployeeList> createState() => _EmployeeListState();
}

class _EmployeeListState extends State<EmployeeList> {

  Stream<List<Employee>> readEmployees() => FirebaseFirestore.instance
      .collection('employees')
      .snapshots()
      .map((snapshot) => snapshot.docs.map((doc) => Employee.fromJson(doc.data())).toList());


  Widget employeeCard(Employee employee) => EmployeeCard(employee: employee);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        title: const Text('Employee List'),
        actions: [
          IconButton(
            onPressed: () {
              FirebaseAuth.instance.signOut();
            },
            icon: Icon(
              Icons.logout,
              color: Colors.deepPurple[200],
            ),
          ),
        ],
      ),
      body: StreamBuilder(
        stream: readEmployees(),
        builder: (context,snapshot){
          if(snapshot.hasData) {
            final users = snapshot.data!;
            return ListView(
              children: users.map(employeeCard).toList(),
            );
          }
          if(snapshot.hasData){
            return Center(child: Text('Something went wrong! ${snapshot.error}'),);
          }
          else {
            return const Center(child: CircularProgressIndicator(),);
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: ()  {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const AddEmployee()),
          );

        },
        child: const Icon(Icons.person_add_alt_rounded),
      ),
    );
  }
}
