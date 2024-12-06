import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

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

  factory Company.fromJson(Map<String, dynamic> json) {
    return Company(
      id: json['id'],
      name: json['name'],
      industry: json['industry'],
      employees: json['employees'],
    );
  }
}

Future<List<Company>> fetchCompanies() async {
  final response =
      await http.get(Uri.parse('https://jsonplaceholder.typicode.com/users'));

  if (response.statusCode == 200) {
    List<dynamic> jsonList = json.decode(response.body);
    return jsonList.map((json) => Company.fromJson(json)).toList();
  } else {
    throw Exception('Failed to load companies');
  }
}

class DataPage extends StatefulWidget {
  @override
  _DataPageState createState() => _DataPageState();
}

class _DataPageState extends State<DataPage> {
  late Future<List<Company>> companies;

  @override
  void initState() {
    super.initState();
    companies = fetchCompanies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Company Data')),
      body: FutureBuilder<List<Company>>(
        future: companies,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text('No companies available.'));
          } else {
            List<Company> companyList = snapshot.data!;
            return ListView.builder(
              itemCount: companyList.length,
              itemBuilder: (context, index) {
                final company = companyList[index];
                return Card(
                  child: ListTile(
                    title: Text(company.name),
                    subtitle: Text('Industry: ${company.industry}'),
                    trailing: Text('${company.employees} employees'),
                    onLongPress: () {
                      // You can implement a function to delete a company here
                      setState(() {
                        companyList.removeAt(index); // Remove company
                      });
                    },
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}
