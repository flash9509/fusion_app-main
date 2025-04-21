import 'package:flutter/material.dart';
import '../utils/sidebar.dart';
import '../utils/gesture_sidebar.dart';
import '../utils/bottom_bar.dart';
import 'Programme_Curriculum/programme_curriculum_dashboard.dart';

class ModuleScreen extends StatefulWidget {
  const ModuleScreen({Key? key}) : super(key: key);

  @override
  State<ModuleScreen> createState() => _ModuleScreenState();
}

class _ModuleScreenState extends State<ModuleScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return GestureSidebar(
      scaffoldKey: _scaffoldKey,
      edgeWidthFactor: 1.0,
      child: Scaffold(
        key: _scaffoldKey,
        appBar: AppBar(
          title: const Text(
            'Modules',
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
          ),
          backgroundColor: Colors.blue.shade700,
          elevation: 0,
          leading: IconButton(
            icon: const Icon(Icons.menu, color: Colors.white),
            onPressed: () {
              _scaffoldKey.currentState!.openDrawer();
            },
          ),
        ),
        drawer: Sidebar(onItemSelected: (index) {}),
        body: Column(
          children: [
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.blue.shade700,
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(80),
                  bottomRight: Radius.circular(80),
                ),
              ),
              padding: const EdgeInsets.only(
                  left: 20.0, right: 20.0, bottom: 20.0, top: 10.0),
              child: const Center(
                child: Text(
                  'Available Modules',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            Expanded(
              child: GridView.count(
                padding: const EdgeInsets.all(16.0),
                crossAxisCount: 2,
                crossAxisSpacing: 16.0,
                mainAxisSpacing: 16.0,
                children: [
                  _buildModuleCard(
                    icon: Icons.menu_book,
                    title: 'Programme & Curriculum',
                    backgroundColor: Colors.blue,
                    onTap: () {
                      // Navigate to Programme & Curriculum Dashboard
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              const ProgrammeCurriculumDashboard(),
                        ),
                      );
                    },
                  ),
                  _buildModuleCard(
                    icon: Icons.school,
                    title: 'Examination',
                    backgroundColor: Colors.green,
                    onTap: () {
                      // Placeholder for Examination module navigation
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                            content: Text('Examination module coming soon')),
                      );
                    },
                  ),
                  _buildModuleCard(
                    icon: Icons.file_copy,
                    title: 'File Tracking',
                    backgroundColor: Colors.orange,
                    onTap: () {
                      // Placeholder for File Tracking module navigation
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                            content: Text('File Tracking module coming soon')),
                      );
                    },
                  ),
                  _buildModuleCard(
                    icon: Icons.shopping_cart,
                    title: 'Purchase',
                    backgroundColor: Colors.purple,
                    onTap: () {
                      // Placeholder for Purchase module navigation
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                            content: Text('Purchase module coming soon')),
                      );
                    },
                  ),
                  // Add more modules as needed
                ],
              ),
            ),
          ],
        ),
        bottomNavigationBar: const BottomBar(),
      ),
    );
  }

  Widget _buildModuleCard({
    required IconData icon,
    required String title,
    required Color backgroundColor,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(16.0),
          boxShadow: [
            BoxShadow(
              color: backgroundColor.withOpacity(0.3),
              blurRadius: 8,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              size: 48,
              color: Colors.white,
            ),
            const SizedBox(height: 12),
            Text(
              title,
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
