import 'dart:io';

void main() {
  bool wrong = false;
  String teacherEmail = "Teacher@gmail.com";
  String teacherPassword = "Teacher000";
  String studentEmail = "Student@gmail.com";
  String studentPassword = "Student000";
  String courseName = '';
  List<String> topics = [];
  print("\n===== WELCOME SMIT Flutter Course  =====");
  print("Login please");
  print("1:Teacher");
  print("2:Student");
  stdout.write("Enter your choice: ");
  var choice = stdin.readLineSync()!;
/*=============================(TEACHER LOGIN)=================================== */
  switch (choice) {
    case '1':
      while (!(wrong)) {
        print("Enter your Email:");
        String inputEmail = stdin.readLineSync()!;
        print("Enter your Password:");
        String inputPassword = stdin.readLineSync()!;
        if ((inputEmail == teacherEmail) &&
            (teacherPassword == inputPassword)) {
          while (true) {
            print("\n===== WELCOME SMIT Flutter Course  =====");
            print("1.Add Course Outline ");
            print("2.Class Timetable ");
            print("3.Add Assignment");
            print("4. Student Performance");
            print("5. Exit");
            stdout.write("Enter your choice: ");
            var choice = stdin.readLineSync();

            switch (choice) {
              case '1':
                while (true) {
                  print('\n============Course Ingformation=============');
                  print('Welcome! Please provide the course name:');
                  courseName = stdin.readLineSync() ?? '';

                  topics = [];
                  addTopic(topics);
                  print(
                      "Press (yes) for view Outline of courseand (no) for back");
                  var command = stdin.readLineSync() ?? '';
                  if (command.toLowerCase() == 'yes') {
                    displayOutline(courseName, topics);
                  } else if (command.toLowerCase() == 'no') {
                    break;
                  }
                }
                break;

              case '2':
                print('\n============Class Timetable=============');
                generateTimetable();
                print('=============END===========');
                break;
              case '3':
                print('\n============Assignment=============');
                bool a = true;
                while (a) {
                  print("\nAssignment Dashboard");
                  print("1. Add Assignment");
                  print("2. View Assignments");
                  print("3. Exit");

                  print("Enter your choice (1/2/3):");
                  String choice = stdin.readLineSync()!;

                  switch (choice) {
                    case '1':
                      addAssignment();
                      break;
                    case '2':
                      viewAssignments();
                      break;
                    case '3':
                      print("Exiting...");
                      a = false;

                    default:
                      print("Invalid choice. Please try again.");
                  }
                  break;
                }
              case '4':
                print('\n===========Student Performancet=============');
                // Adding some sample students initially
                students.add(Student("John Doe", 101, 0.0));
                students.add(Student("Alice Smith", 102, 0.0));
                students.add(Student("Bob Johnson", 103, 0.0));
                bool a = true;

                while (a) {
                  print("\nStudent Performance Dashboard");
                  print("1. Add Student");
                  print("2. Add Exam Score");
                  print("3. View Performance Dashboard");
                  print("4. Exit");

                  print("Enter your choice (1/2/3/4):");
                  String choice = stdin.readLineSync()!;

                  switch (choice) {
                    case '1':
                      addStudent();
                      break;
                    case '2':
                      if (students.isEmpty) {
                        print("No students found. Please add students first.");
                      } else {
                        viewPerformanceDashboard();
                        print("Enter student number to add exam score:");
                        int studentNumber =
                            int.parse(stdin.readLineSync()!) - 1;
                        if (studentNumber >= 0 &&
                            studentNumber < students.length) {
                          addExamScore(studentNumber);
                        } else {
                          print("Invalid student number.");
                        }
                      }
                      break;
                    case '3':
                      viewPerformanceDashboard();
                      break;
                    case '4':
                      print("Exiting...");
                      a = false;
                    default:
                      print("Invalid choice. Please try again.");
                  }
                }
              case '5':
                print('Thank you so much using SMIT LMS');
                print("Exiting...");

                return;
              default:
                print("Invalid choice. Please try again.");
            }
          }
        } else {
          print("Weong input");
          wrong = true;
        }
      }
      break;
/*=============================(STUDENT LOGIN)=================================== */

    case '2':
      while (!(wrong)) {
        print("Enter your Email:");
        String inputEmail = stdin.readLineSync()!;
        print("Enter your Password:");
        String inputPassword = stdin.readLineSync()!;
        if ((inputEmail == studentEmail) &&
            (studentPassword == inputPassword)) {
          while (true) {
            print("\n===== WELCOME SMIT Flutter Course  =====");
            print("1.Course information ");
            print("2.Class Timetable ");
            print("3.Assignment");
            print("4. Student Performance");
            print("5. Exit");
            stdout.write("Enter your choice: ");
            var choice = stdin.readLineSync();

            switch (choice) {
              case '1':
                print('\n============Course Ingformation=============');

                displayOutline(courseName, topics);

              case '2':
                print('\n============Class Timetable=============');
                generateTimetable();
                print('=============END===========');
                break;
              case '3':
                print('\n============Assignment=============');
                bool a = true;
                while (a) {
                  print("\nAssignment Dashboard");
                  print("1. Submit Assignment");
                  print("2. View Assignments");
                  print("3. Exit");

                  print("Enter your choice (1/2/3):");
                  String choice = stdin.readLineSync()!;

                  switch (choice) {
                    case '1':
                      addAssignment();
                      break;
                    case '2':
                      viewAssignments();
                      break;
                    case '3':
                      print("Exiting...");
                      a = false;

                    default:
                      print("Invalid choice. Please try again.");
                  }
                  break;
                }
              case '4':
                print('\n===========Student Performancet=============');
                // Adding some sample students initially
                students.add(Student("John Doe", 101, 0.0));
                students.add(Student("Alice Smith", 102, 0.0));
                students.add(Student("Bob Johnson", 103, 0.0));
                bool a = true;

                while (a) {
                  print("\nStudent Performance Dashboard");
                  print("1. Add Student");
                  print("2. Add Exam Score");
                  print("3. View Performance Dashboard");
                  print("4. Exit");

                  print("Enter your choice (1/2/3/4):");
                  String choice = stdin.readLineSync()!;

                  switch (choice) {
                    case '1':
                      addStudent();
                      break;
                    case '2':
                      if (students.isEmpty) {
                        print("No students found. Please add students first.");
                      } else {
                        viewPerformanceDashboard();
                        print("Enter student number to add exam score:");
                        int studentNumber =
                            int.parse(stdin.readLineSync()!) - 1;
                        if (studentNumber >= 0 &&
                            studentNumber < students.length) {
                          addExamScore(studentNumber);
                        } else {
                          print("Invalid student number.");
                        }
                      }
                      break;
                    case '3':
                      viewPerformanceDashboard();
                      break;
                    case '4':
                      print("Exiting...");
                      a = false;
                    default:
                      print("Invalid choice. Please try again.");
                  }
                }
              case '5':
                print('Thank you so much using SMIT LMS');
                print("Exiting...");

                return;
              default:
                print("Invalid choice. Please try again.");
            }
          }
        } else {
          print("Weong input");
          wrong = true;
        }
      }
      break;
  }
}
/*================================ (FUNCTIONs ) ================================= */

/*========================= (Teacher)  Case 1 =============================== */
//Here we add Course Outlines
void addTopic(List<String> topics) {
  print('Enter a topic to add to the course outline (or "exit" to quit):');
  String input = stdin.readLineSync() ?? '';

  if (input.toLowerCase() != 'exit') {
    topics.add(input);
    print('Topic added successfully!\n');
    addTopic(topics);
  }
}

//Here we add Display Course Outlines
void displayOutline(String courseName, List<String> topics) {
  print('Course: $courseName');
  print('Topics:');
  for (int i = 0; i < topics.length; i++) {
    print('${i + 1}. ${topics[i]}');
  }
}

/*============================ (Teacher) Case 2 =================================== */
void generateTimetable() {
  // Define the starting date
  DateTime startDate = DateTime.now();

  // Set the current date to the beginning of the month
  startDate = startDate.subtract(Duration(days: startDate.day - 1));

  // Define the class days (Thursday and Saturday)
  final classDays = [DateTime.thursday, DateTime.saturday];

  // Function to calculate the next class date
  DateTime getNextClassDate(DateTime date, int week, int dayOfWeek) {
    DateTime classDate = date.add(Duration(days: (week - 1) * 7));
    while (classDate.weekday != dayOfWeek) {
      classDate = classDate.add(Duration(days: 1));
    }
    return classDate;
  }

  // Generate the timetable for 6 months (24 weeks)
  for (var i = 0; i < 6; i++) {
    print("Month: ${startDate.month}");

    // Iterate over the weeks in the month
    for (var week = 1; week <= 4; week++) {
      print("Week $week:");

      // Iterate over the class days
      for (var day in classDays) {
        DateTime classDate = getNextClassDate(startDate, week, day);
        // Print the class date
        print("${classDate.toLocal()}");
      }
    }

    // Move to the next month
    startDate = startDate.add(Duration(days: 30));
    print("\n");
  }
}

/*=============================== (Teacher) Case 3 ================================ */
class Assignment {
  final String name;
  final String description;
  final DateTime dueDate;

  Assignment(this.name, this.description, this.dueDate);
}

List<Assignment> assignments = [];

void addAssignment() {
  print("Enter assignment name:");
  String name = stdin.readLineSync()!;

  print("Enter assignment description:");
  String description = stdin.readLineSync()!;

  print("Enter due date (YYYY-MM-DD):");
  String dueDateStr = stdin.readLineSync()!;
  DateTime dueDate = DateTime.parse(dueDateStr);

  assignments.add(Assignment(name, description, dueDate));
  print("Assignment submitted successfully!");
}

void viewAssignments() {
  if (assignments.isEmpty) {
    print("No assignments found.");
  } else {
    print("Assignments:");
    for (var i = 0; i < assignments.length; i++) {
      var assignment = assignments[i];
      print("Assignment ${i + 1}:");
      print("Name: ${assignment.name}");
      print("Description: ${assignment.description}");
      print("Due Date: ${assignment.dueDate.toLocal()}");
      print("-------------");
    }
  }
}

/*============================= (Teacher) Case 4 ============================== */
class Student {
  final String name;
  final int rollNumber;
  double examScore;

  Student(this.name, this.rollNumber, this.examScore);
}

List<Student> students = [];

void addStudent() {
  print("Enter student name:");
  String name = stdin.readLineSync()!;

  print("Enter student roll number:");
  int rollNumber = int.parse(stdin.readLineSync()!);

  students.add(Student(name, rollNumber, 0.0));
  print("Student added successfully!");
}

void addExamScore(int studentIndex) {
  print("Enter exam score for ${students[studentIndex].name}:");
  double score = double.parse(stdin.readLineSync()!);

  students[studentIndex].examScore = score;
  print("Exam score added successfully!");
}

void viewPerformanceDashboard() {
  if (students.isEmpty) {
    print("No students found.");
  } else {
    print("Performance Dashboard:");
    for (var i = 0; i < students.length; i++) {
      var student = students[i];
      print("Student ${i + 1}:");
      print("Name: ${student.name}");
      print("Roll Number: ${student.rollNumber}");
      print("Exam Score: ${student.examScore}");
      print("-------------");
    }
  }
}
