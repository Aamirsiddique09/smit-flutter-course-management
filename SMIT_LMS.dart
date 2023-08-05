import 'dart:io';
import 'dart:convert';

void main() {
  bool wrong = false; // Flag to track login attempts
  String teacherEmail = "Teacher@gmail.com";
  String teacherPassword = "Teacher000";
  String studentEmail = "Student@gmail.com";
  String studentPassword = "Student000";
  // Display welcome message and login options
  print("\n===== WELCOME SMIT Flutter Course  =====");
  print("Login please");
  print("1:Teacher");
  print("2:Student");
  stdout.write("Enter your choice: ");
  var choice = stdin.readLineSync()!;
/*=============================(TEACHER LOGIN)=================================== */

  // Teacher and Student login branches
  switch (choice) {
    case '1':
      // Teacher Login
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
            print("4. Add Quiz");
            print("5. Exit");
            stdout.write("Enter your choice: ");
            var choice = stdin.readLineSync();

            switch (choice) {
              case '1':
                while (true) {
                  print('\n============Course Ingformation=============');
                  runCourseManagement();

                  break;
                }

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
                print('\n===========QUIZ SECTION=============');
                List<Quiz> quizzes = loadQuizzes();
                addQuiz(quizzes);
                saveQuizzes(quizzes);
                print('Quiz added and saved successfully!');
              case '5':
                print('Thank you so much using SMIT LMS');
                print("Exiting...");

                break;
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
            print("4. Quiz");
            print("5. Exit");
            stdout.write("Enter your choice: ");
            var choice = stdin.readLineSync();

            switch (choice) {
              case '1':
                print('\n============Course Ingformation=============');
                loadCourses();
                displayCourses();
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
                print('\n===========QUIZ SECTION=============');
                print('Welcome to Quiz  Section');
                Student student = loadStudentDetails();
                List<Quiz> quizzes = loadQuizzes();
                takeQuiz(student, quizzes);
                saveStudentDetails(student);
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

class Course {
  String name;
  List<Outline> outlines;

  Course(this.name, this.outlines);

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'outlines': outlines.map((outline) => outline.toJson()).toList(),
    };
  }

  factory Course.fromJson(Map<String, dynamic> json) {
    return Course(
      json['name'],
      (json['outlines'] as List<dynamic>)
          .map((outlineJson) => Outline.fromJson(outlineJson))
          .toList(),
    );
  }

  void display() {
    print('Course: $name');
    print('Outlines:');
    outlines.forEach((outline) {
      print('  - ${outline.title}: ${outline.description}');
    });
  }
}

class Outline {
  String title;
  String description;

  Outline(this.title, this.description);

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'description': description,
    };
  }

  factory Outline.fromJson(Map<String, dynamic> json) {
    return Outline(json['title'], json['description']);
  }
}

List<Course> courses = []; // Global list to store courses

void runCourseManagement() {
  while (true) {
    print('\nMenu:');
    print('1. Load existing data');
    print('2.Add a new course and its outlines ');
    print('3. Display loaded courses and outlines');
    print('4. Save data and exit');
    print('Enter your choice (1/2/3/4):');

    String choice = stdin.readLineSync()?.trim() ?? '';

    switch (choice) {
      case '1':
        loadCourses();

        break;

      case '2':
        addCourse();
        print('Course and outlines added successfully.\n');

        break;
      case '3':
        displayCourses();
        break;

      case '4':
        saveCourses();
        print('Data saved to data.json.\n');
        break;

      default:
        print('Invalid choice. Please try again.\n');
        break;
    }
  }
}

void loadCourses() {
  String filePath = 'data.json';

  try {
    String jsonData = File(filePath).readAsStringSync();
    List<dynamic> jsonList = json.decode(jsonData);
    courses = jsonList.map((json) => Course.fromJson(json)).toList();
  } catch (e) {
    print('Error loading data from data.json: $e');
  }
}

void saveCourses() {
  String filePath = 'data.json';
  List<Map<String, dynamic>> coursesJson =
      courses.map((course) => course.toJson()).toList();

  String jsonString = json.encode(coursesJson);

  try {
    File(filePath).writeAsStringSync(jsonString);
  } catch (e) {
    print('Error saving data to data.json: $e');
  }
}

void addCourse() {
  print('Enter the name of the course:');
  String courseName = stdin.readLineSync() ?? '';

  List<Outline> outlines = [];

  while (true) {
    print(
        'Enter the title of the outline (or type "done" to finish adding outlines):');
    String title = stdin.readLineSync() ?? '';

    if (title.toLowerCase() == 'done') {
      break;
    }

    print('Enter the description of the outline:');
    String description = stdin.readLineSync() ?? '';

    outlines.add(Outline(title, description));
  }

  Course newCourse = Course(courseName, outlines);
  courses.add(newCourse);
}

void displayCourses() {
  if (courses.isNotEmpty) {
    print('\nLoaded Courses and Outlines:');
    courses.forEach((course) {
      course.display();
      print('\n');
    });
  } else {
    print('No data loaded yet.\n');
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
class Question {
  String prompt;
  List<String> options;
  int correctAnswer;

  Question(this.prompt, this.options, this.correctAnswer);

  Map<String, dynamic> toJson() {
    return {
      'prompt': prompt,
      'options': options,
      'correctAnswer': correctAnswer,
    };
  }

  factory Question.fromJson(Map<String, dynamic> json) {
    return Question(
      json['prompt'],
      List<String>.from(json['options']),
      json['correctAnswer'],
    );
  }
}

class Quiz {
  String title;
  List<Question> questions;

  Quiz(this.title, this.questions);

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'questions': questions.map((question) => question.toJson()).toList(),
    };
  }

  factory Quiz.fromJson(Map<String, dynamic> json) {
    return Quiz(
      json['title'],
      (json['questions'] as List<dynamic>)
          .map((questionJson) => Question.fromJson(questionJson))
          .toList(),
    );
  }
}

List<Quiz> loadQuizzes() {
  String filePath = 'quizzes.json';
  List<Quiz> quizzes = [];

  try {
    String jsonData = File(filePath).readAsStringSync();
    List<dynamic> jsonList = json.decode(jsonData);

    quizzes = jsonList.map((json) => Quiz.fromJson(json)).toList();
  } catch (e) {
    print('Error loading quizzes from quizzes.json: $e');
  }

  return quizzes;
}

void saveQuizzes(List<Quiz> quizzes) {
  String filePath = 'quizzes.json';
  List<Map<String, dynamic>> quizzesJson =
      quizzes.map((quiz) => quiz.toJson()).toList();

  String jsonString = json.encode(quizzesJson);

  try {
    File(filePath).writeAsStringSync(jsonString);
  } catch (e) {
    print('Error saving quizzes to quizzes.json: $e');
  }
}

void addQuiz(List<Quiz> quizzes) {
  print('Enter the title of the new quiz:');
  String title = stdin.readLineSync()?.trim() ?? '';

  List<Question> questions = [];

  while (true) {
    print(
        'Enter the question prompt (or type "done" to finish adding questions):');
    String prompt = stdin.readLineSync()?.trim() ?? '';

    if (prompt.toLowerCase() == 'done') {
      break;
    }

    List<String> options = [];
    int correctAnswer;

    for (int i = 1; i <= 4; i++) {
      print('Enter option $i:');
      String option = stdin.readLineSync()?.trim() ?? '';
      options.add(option);
    }

    while (true) {
      print('Enter the index of the correct answer (1-4):');
      String input = stdin.readLineSync()?.trim() ?? '';
      correctAnswer = int.tryParse(input)!;

      if (correctAnswer != null && correctAnswer >= 1 && correctAnswer <= 4) {
        break;
      }
      print('Invalid input. Please enter a number between 1 and 4.');
    }

    questions.add(Question(prompt, options, correctAnswer - 1));
  }

  Quiz newQuiz = Quiz(title, questions);
  quizzes.add(newQuiz);
}
/*================================ (FUNCTIONs ) ================================= */

/*========================= (Student)  Case 1 =============================== */

class Student {
  String name;
  String rollNumber;
  List<Map<String, dynamic>> quizResults = [];

  Student(this.name, this.rollNumber);

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'rollNumber': rollNumber,
      'quizResults': quizResults,
    };
  }

  factory Student.fromJson(Map<String, dynamic> json) {
    var student = Student(json['name'], json['rollNumber']);
    student.quizResults = List<Map<String, dynamic>>.from(json['quizResults']);
    return student;
  }
}

Student loadStudentDetails() {
  print('Enter your name:');
  String name = stdin.readLineSync()?.trim() ?? '';

  print('Enter your roll number:');
  String rollNumber = stdin.readLineSync()?.trim() ?? '';

  return Student(name, rollNumber);
}

void takeQuiz(Student student, List<Quiz> quizzes) {
  print('Choose a quiz to take:');
  for (int i = 0; i < quizzes.length; i++) {
    print('${i + 1}. ${quizzes[i].title}');
  }

  int selectedQuiz;
  while (true) {
    String input = stdin.readLineSync()?.trim() ?? '';
    selectedQuiz = int.tryParse(input)!;
    if (selectedQuiz != null &&
        selectedQuiz >= 1 &&
        selectedQuiz <= quizzes.length) {
      break;
    }
    print(
        'Invalid input. Please enter a number between 1 and ${quizzes.length}.');
  }

  Quiz quiz = quizzes[selectedQuiz - 1];
  int totalQuestions = quiz.questions.length;
  int correctAnswers = 0;

  for (int i = 0; i < totalQuestions; i++) {
    Question question = quiz.questions[i];
    print('\nQuestion ${i + 1}: ${question.prompt}');

    for (int j = 0; j < question.options.length; j++) {
      print('${j + 1}. ${question.options[j]}');
    }

    int selectedAnswer;
    while (true) {
      String input = stdin.readLineSync()?.trim() ?? '';
      selectedAnswer = int.tryParse(input)!;
      if (selectedAnswer != null &&
          selectedAnswer >= 1 &&
          selectedAnswer <= 4) {
        break;
      }
      print('Invalid input. Please enter a number between 1 and 4.');
    }

    if (selectedAnswer - 1 == question.correctAnswer) {
      print('Correct!\n');
      correctAnswers++;
    } else {
      print(
          'Incorrect. The correct answer is: ${question.options[question.correctAnswer]}\n');
    }
  }

  double score = (correctAnswers / totalQuestions) * 100;
  print('Quiz completed. Your score: ${score.toStringAsFixed(2)}%\n');

  Map<String, dynamic> quizResult = {
    'quiz': quiz.title,
    'score': score.toStringAsFixed(2),
  };
  student.quizResults.add(quizResult);
}

void saveStudentDetails(Student student) {
  String filePath = 'student_details.json';
  Map<String, dynamic> studentJson = student.toJson();

  try {
    File(filePath).writeAsStringSync(json.encode(studentJson));
    print('Student details saved to student_details.json.');
  } catch (e) {
    print('Error saving student details to student_details.json: $e');
  }
}
