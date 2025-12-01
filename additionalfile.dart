return Scaffold(
  backgroundColor: const Color(0xff022760),
  drawer: _buildDrawer(context), // <-- Add this
  appBar: AppBar(...),
  body: Column(...),
);


Widget _buildDrawer(BuildContext context) {
  return Drawer(
    backgroundColor: const Color(0xff001E4D),
    child: ListView(
      padding: EdgeInsets.zero,
      children: [
        DrawerHeader(
          decoration: const BoxDecoration(
            color: Color(0xff001E4D),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              CircleAvatar(
                radius: 30,
                backgroundColor: Colors.white,
                child: Icon(Icons.person, size: 30, color: Color(0xff001E4D)),
              ),
              SizedBox(height: 10),
              Text(
                "Arianne Cielo",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                "Student",
                style: TextStyle(
                  color: Colors.white70,
                  fontSize: 14,
                ),
              ),
            ],
          ),
        ),

        _drawerItem(Icons.notifications, "Notifications", () {}),
        _drawerItem(Icons.history, "Chat History", () {}),
        _drawerItem(Icons.checklist, "Checklist", () {}),
        _drawerItem(Icons.settings, "Settings", () {}),
        _drawerItem(Icons.privacy_tip, "Privacy", () {}),
        _drawerItem(Icons.description, "Terms and Conditions", () {}),
        const Divider(color: Colors.white24),
        _drawerItem(Icons.logout, "Logout", () {
          // Add logout logic here
        }),
      ],
    ),
  );
}

Widget _drawerItem(IconData icon, String title, VoidCallback onTap) {
  return ListTile(
    leading: Icon(icon, color: Colors.white),
    title: Text(
      title,
      style: const TextStyle(color: Colors.white),
    ),
    onTap: onTap,
  );
}
