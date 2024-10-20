import 'dart:async';

enum Skill { FLUTTER, DART, OTHER }

class Address {
  String street;
  String city;
  int zipCode;
  Address(this.street, this.city, this.zipCode);
}

class Employee {
  final String _name;
  final double _baseSalary;
  final List<Skill> _skills;
  final Address _address;
  final int _yearsOfExperience;

  Employee(
      {required String name,
      required double baseSalary,
      required List<Skill> skills,
      required Address address,
      required int yearsOfExperience})
      : _name = name,
        _baseSalary = baseSalary,
        _skills = skills,
        _address = address,
        _yearsOfExperience = yearsOfExperience;
//  Name constructor for Mobiledeveloper
  Employee.Mobiledeveloper(
      {required String name,
      required String street,
      required String city,
      required String zipCode,
      required int yearsOfExperience})
      : _name = name,
        _baseSalary = 30000,
        _skills = [Skill.FLUTTER, Skill.DART],
        _address = Address(street, city, zipCode as int),
        _yearsOfExperience = yearsOfExperience;
// get the value
  String get name => _name;
  double get baseSalary => _baseSalary;
  List<Skill> get skill => _skills;
  Address get address => _address;
  int get yearsofExperience => _yearsOfExperience;

  //  Print the detail information
  void printDetail() {
    print('Employee : $_name and \$$_baseSalary');
    print('Skill : $_skills');
    print(
        'address : ${_address.street}, ${_address.city}, ${_address.zipCode}');
    print('years of Experience: $_yearsOfExperience');
  }

  double computeSalary() {
    //  bonus 1000 per year of experience
    double Experience = _yearsOfExperience * 1000;
    return Experience + _baseSalary;
  }
}

void main() {
//   var emp1 = Employee('Sokea', 40000);
//   emp1.printDetails();

//   var emp2 = Employee('Ronan', 45000);
//   emp2.printDetails();
  var emp1 = Employee(
      name: "sreypov",
      baseSalary: 20000,
      skills: [Skill.DART],
      address: (Address("5a", "pp", 12345)),
      yearsOfExperience: 5);
  emp1.printDetail();

  print("print total salary : \$${emp1.computeSalary()}");
}
