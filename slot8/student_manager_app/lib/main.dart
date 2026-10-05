import 'package:flutter/material.dart';

import 'models/student.dart';
import 'models/student_store.dart';
import 'routes/app_routes.dart';
import 'screens/home_screen.dart';
import 'screens/student_detail_screen.dart';
import 'screens/student_edit_screen.dart';
import 'screens/student_form_screen.dart';
import 'screens/student_list_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  // Normal launch: '/'.
  // Android deep link: Flutter receives the external route from the platform.
  final initialRoute =
      WidgetsBinding.instance.platformDispatcher.defaultRouteName;

  runApp(
    StudentManagerApp(
      initialRoute:
          initialRoute.isEmpty ? AppRoutes.home : initialRoute,
    ),
  );
}

class StudentManagerApp extends StatelessWidget {
  final String initialRoute;

  const StudentManagerApp({
    super.key,
    required this.initialRoute,
  });

  Route<dynamic> _errorRoute(String message) {
    return MaterialPageRoute(
      builder: (_) {
        return Scaffold(
          appBar: AppBar(title: const Text('Navigation Error')),
          body: Center(
            child: Padding(
              padding: const EdgeInsets.all(24),
              child: Text(
                message,
                textAlign: TextAlign.center,
              ),
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Student Manager',
      debugShowCheckedModeBanner: false,
      initialRoute: initialRoute,
      routes: {
        AppRoutes.home: (_) => const HomeScreen(),
        AppRoutes.studentList: (_) => const StudentListScreen(),
        AppRoutes.studentDetail: (_) => const StudentDetailScreen(),
        AppRoutes.studentForm: (_) => const StudentFormScreen(),
      },
      onGenerateRoute: (settings) {
        // Internal Edit route: /students/edit + Student argument.
        if (settings.name == AppRoutes.studentEdit) {
          final student = settings.arguments;

          if (student is Student) {
            return MaterialPageRoute(
              builder: (_) => EditStudentScreen(student: student),
              settings: settings,
            );
          }

          return _errorRoute(
            'Không có Student argument để mở màn hình Edit.',
          );
        }

        // External Android deep link.
        final routeName = settings.name ?? '';
        final uri = Uri.tryParse(routeName);

        if (uri != null &&
            uri.scheme == 'studentapp' &&
            uri.host == 'student') {
          final studentId = uri.queryParameters['id'];
          final student =
              studentId == null ? null : StudentStore.instance.findById(studentId);

          if (student == null) {
            return _errorRoute(
              'Không tìm thấy sinh viên với id: ${studentId ?? "null"}.',
            );
          }

          if (uri.path == '/detail') {
            return MaterialPageRoute(
              builder: (_) => const StudentDetailScreen(),
              settings: RouteSettings(
                name: AppRoutes.studentDetail,
                arguments: student,
              ),
            );
          }

          if (uri.path == '/edit') {
            return MaterialPageRoute(
              builder: (_) => EditStudentScreen(student: student),
              settings: RouteSettings(
                name: AppRoutes.studentEdit,
                arguments: student,
              ),
            );
          }
        }

        return _errorRoute('Route không tồn tại: $routeName');
      },
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
    );
  }
}
