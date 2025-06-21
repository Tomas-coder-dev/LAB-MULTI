import 'package:flutter/cupertino.dart';
import 'register_user_screen.dart';
import 'register_task_screen.dart';
import 'task_list_screen.dart';

class HomeScreen extends StatelessWidget {
  final String username;
  final String password;

  const HomeScreen({
    super.key, 
    required this.username, 
    required this.password
  });

  @override
  Widget build(BuildContext context) {
    return CupertinoTabScaffold(
      backgroundColor: const Color(0xFFF8F9FA),
      tabBar: CupertinoTabBar(
        backgroundColor: CupertinoColors.white,
        activeColor: const Color(0xFF667EEA),
        inactiveColor: const Color(0xFF718096),
        border: const Border(
          top: BorderSide(
            color: Color(0xFFE2E8F0),
            width: 0.5,
          ),
        ),
        items: const [
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.person_fill),
            label: 'Usuario',
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.add_circled_solid),
            label: 'Nueva Tarea',
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.list_bullet),
            label: 'Mis Tareas',
          ),
        ],
      ),
      tabBuilder: (context, index) {
        return CupertinoTabView(
          builder: (context) {
            switch (index) {
              case 0:
                return RegisterUserScreen(
                  username: username, 
                  password: password
                );
              case 1:
                return const RegisterTaskScreen();
              case 2:
                return const TaskListScreen();
              default:
                return const Center(
                  child: Text(
                    'Pantalla no encontrada',
                    style: TextStyle(
                      fontSize: 18,
                      color: Color(0xFF718096),
                    ),
                  ),
                );
            }
          },
        );
      },
    );
  }
}