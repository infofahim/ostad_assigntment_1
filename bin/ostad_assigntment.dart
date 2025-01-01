//A.Define an  abstract named Role:
abstract class Role {
  void displayRole();
}

//B.Create a class Person:
class Person implements Role {
  String name;
  int age;
  String address;

  Person(this.name, this.age, this.address);

  @override
  void displayRole() {
    print('Role: Person');
  }
}

//C.Create a class Student that extends Person:
class Student extends Person {
  String studentID;
  String grade;
  List<int> courseScores;

  Student(String name, int age, String address, this.studentID, this.grade, this.courseScores)
      : super(name, age, address);

  @override
  void displayRole() {
    print('Role: Student');
  }

  double calculateAverageScore() {
    if (courseScores.isEmpty) return 0.0;
    return courseScores.reduce((a, b) => a + b) / courseScores.length;
  }
}

//D.Create another class Teacher that extends Person:
class Teacher extends Person {
  String teacherID;
  List<String> coursesTaught;

  Teacher(String name, int age, String address, this.teacherID, this.coursesTaught)
      : super(name, age, address);

  @override
  void displayRole() {
    print('Role: Teacher');
  }

  void displayCoursesTaught() {
    print('Courses Taught:');
    for (var course in coursesTaught) {
      print('- $course');
    }
  }
}

void main() {
  // Student Instance
  Student student = Student('John Doe', 20, '123 Main St', 'S001', 'A', [90, 85, 82]);
  print('Student Information:');
  student.displayRole();
  print('Name: ${student.name}');
  print('Age: ${student.age}');
  print('Address: ${student.address}');
  print('Average Score: ${student.calculateAverageScore()}');
  print('');

  // Teacher Instance
  Teacher teacher = Teacher('Mrs. Smith', 35, '456 Oak St', 'T001', ['Math', 'English', 'Bangla']);
  print('Teacher Information:');
  teacher.displayRole();
  print('Name: ${teacher.name}');
  print('Age: ${teacher.age}');
  print('Address: ${teacher.address}');
  teacher.displayCoursesTaught();
}