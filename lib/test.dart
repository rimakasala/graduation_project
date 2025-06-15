// models/program_model.dart
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ProgramModel {
  final int id;
  final String name;

  ProgramModel({required this.id, required this.name});
}

// models/academic_year_model.dart
class AcademicYearModel {
  final int id;
  final String name;

  AcademicYearModel({required this.id, required this.name});
}

// models/semester_model.dart
class SemesterModel {
  final int id;
  final String name;

  SemesterModel({required this.id, required this.name});
}

// models/department_model.dart
class DepartmentModel {
  final int id;
  final String name;

  DepartmentModel({required this.id, required this.name});
}

// screens/program_screen.dart

class ProgramScreen extends StatelessWidget {
  final List<ProgramModel> programs = [
    ProgramModel(id: 1, name: 'البرنامج العام'),
    ProgramModel(id: 2, name: 'البرامج الخاصة'),
  ];

  main (){
    runApp(ProgramScreen());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('اختر البرنامج')),
      body: ListView.builder(
        itemCount: programs.length,
        itemBuilder: (context, index) {
          final program = programs[index];
          return ListTile(
            title: Text(program.name),
            onTap: () {
              context.go('/academic_years', extra: program);
            },
          );
        },
      ),
    );
  }
}

// screens/academic_year_screen.dart


class AcademicYearScreen extends StatelessWidget {
  final ProgramModel program;
  AcademicYearScreen({required this.program});

  final List<AcademicYearModel> academicYears = [
    AcademicYearModel(id: 1, name: 'الفرقة الأولى'),
    AcademicYearModel(id: 2, name: 'الفرقة الثانية'),
    AcademicYearModel(id: 3, name: 'الفرقة الثالثة'),
    AcademicYearModel(id: 4, name: 'الفرقة الرابعة'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('اختر الفرقة - ${program.name}')),
      body: ListView.builder(
        itemCount: academicYears.length,
        itemBuilder: (context, index) {
          final year = academicYears[index];
          return ListTile(
            title: Text(year.name),
            onTap: () {
              context.go('/semesters', extra: {
                'program': program,
                'year': year,
              });
            },
          );
        },
      ),
    );
  }
}

// screens/semester_screen.dart

class SemesterScreen extends StatelessWidget {
  final ProgramModel program;
  final AcademicYearModel year;

  SemesterScreen({required this.program, required this.year});

  final List<SemesterModel> semesters = [
    SemesterModel(id: 1, name: 'الفصل الدراسي الأول'),
    SemesterModel(id: 2, name: 'الفصل الدراسي الثاني'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('اختر الفصل الدراسي - ${year.name}')),
      body: ListView.builder(
        itemCount: semesters.length,
        itemBuilder: (context, index) {
          final semester = semesters[index];
          return ListTile(
            title: Text(semester.name),
            onTap: () {
              context.go('/departments', extra: {
                'program': program,
                'year': year,
                'semester': semester,
              });
            },
          );
        },
      ),
    );
  }
}

// screens/department_screen.dart

class DepartmentScreen extends StatelessWidget {
  final ProgramModel program;
  final AcademicYearModel year;
  final SemesterModel semester;

  DepartmentScreen({required this.program, required this.year, required this.semester});

  final List<DepartmentModel> departments = [
    DepartmentModel(id: 1, name: 'قسم 1'),
    DepartmentModel(id: 2, name: 'قسم 2'),
    DepartmentModel(id: 3, name: 'قسم 3'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('اختر القسم - ${semester.name}')),
      body: ListView.builder(
        itemCount: departments.length,
        itemBuilder: (context, index) {
          final department = departments[index];
          return ListTile(
            title: Text(department.name),
            onTap: () {
              // Next screen (e.g., subjects) or backend call
            },
          );
        },
      ),
    );
  }
}

// router.dart

final GoRouter router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => ProgramScreen(),
    ),
    GoRoute(
      path: '/academic_years',
      builder: (context, state) {
        final program = state.extra as ProgramModel;
        return AcademicYearScreen(program: program);
      },
    ),
    GoRoute(
      path: '/semesters',
      builder: (context, state) {
        final data = state.extra as Map;
        final program = data['program'] as ProgramModel;
        final year = data['year'] as AcademicYearModel;
        return SemesterScreen(program: program, year: year);
      },
    ),
    GoRoute(
      path: '/departments',
      builder: (context, state) {
        final data = state.extra as Map;
        final program = data['program'] as ProgramModel;
        final year = data['year'] as AcademicYearModel;
        final semester = data['semester'] as SemesterModel;
        return DepartmentScreen(program: program, year: year, semester: semester);
      },
    ),
  ],
);
