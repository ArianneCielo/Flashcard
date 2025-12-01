import 'package:flutter/material.dart';
import 'ScholarshipDetailsPage.dart';

class AiSkolarChat extends StatelessWidget {
  const AiSkolarChat({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff022760),

      // --------------------------------------------------
      // 1. DRAWER (slides in from left)
      // --------------------------------------------------
      drawer: Drawer(
        backgroundColor: const Color(0xff022760),
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(color: Color(0xff001E4D)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CircleAvatar(
                    radius: 30,
                    backgroundColor: Colors.white,
                    child: Icon(Icons.person,
                        size: 40, color: Color(0xff022760)),
                  ),
                  SizedBox(height: 10),
                  Text(
                    "Arianne Cielo",
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "Student",
                    style: TextStyle(color: Colors.white70),
                  ),
                ],
              ),
            ),
            _drawerItem(Icons.notifications, "Notifications"),
            _drawerItem(Icons.chat, "Chat History"),
            _drawerItem(Icons.assignment, "Checklist"),
            _drawerItem(Icons.settings, "Settings"),
            _drawerItem(Icons.privacy_tip, "Privacy"),
            _drawerItem(Icons.article, "Terms and Conditions"),
            _drawerItem(Icons.exit_to_app, "Logout"),
          ],
        ),
      ),

      // --------------------------------------------------
      // 2. APPBAR with menu (left) & profile (right)
      // --------------------------------------------------
      appBar: AppBar(
        backgroundColor: const Color(0xff022760),
        elevation: 0,
        automaticallyImplyLeading: false,
        leading: Builder(
          builder: (context) => IconButton(
            icon: const Icon(Icons.menu, color: Colors.white),
            onPressed: () => Scaffold.of(context).openDrawer(),
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.person, color: Colors.white),
            onPressed: () {
              // TODO: go to profile page or show dialog
            },
          ),
        ],
        title: Container(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(30),
          ),
          child: const TextField(
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: "Search for scholarships..",
              icon: Icon(Icons.search, color: Color(0xffFCD24F)),
            ),
          ),
        ),
      ),

      // --------------------------------------------------
      // 3. BODY (your original content)
      // --------------------------------------------------
      body: Column(
        children: [
          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(16),
              children: [
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: const Color(0xff001E4D),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Recommended Scholarships",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 12),
                      Container(
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(18),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "Incoming Freshmen Scholarships",
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 10),
                            const Text(
                                "These are recommended based on your profile:"),
                            const Text("Scholarship 1"),
                            const Text("Scholarship 2"),
                            const SizedBox(height: 12),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                _yellowButton(context, "Details"),
                                _blueButton(context, "Requirements"),
                              ],
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                Align(
                  alignment: Alignment.centerRight,
                  child: Container(
                    padding: const EdgeInsets.all(14),
                    margin: const EdgeInsets.only(bottom: 12),
                    decoration: BoxDecoration(
                      color: const Color(0xffFCD24F),
                      borderRadius: BorderRadius.circular(14),
                    ),
                    child: const Text(
                      "Where can I get the Certificate of Indigency?",
                      style: TextStyle(
                        color: Color(0xff022760),
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    const SizedBox(width: 8),
                    Flexible(
                      child: Container(
                        padding: const EdgeInsets.all(14),
                        decoration: BoxDecoration(
                          color: const Color(0xff5A7FBF),
                          borderRadius: BorderRadius.circular(14),
                        ),
                        child: const Text(
                          "You can get a Certificate of Indigency from your local Barangay Hall by presenting a valid ID and stating your purpose.",
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
          _bottomInput(),
        ],
      ),
    );
  }

  // --------------------------------------------------
  // Helper: drawer list tile
  // --------------------------------------------------
  Widget _drawerItem(IconData icon, String title) {
    return ListTile(
      leading: Icon(icon, color: Colors.white),
      title: Text(title, style: const TextStyle(color: Colors.white)),
      onTap: () {
        // TODO: handle navigation / action
      },
    );
  }

  // --------------------------------------------------
  // Yellow button (Details)
  // --------------------------------------------------
  Widget _yellowButton(BuildContext context, String text) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => ScholarshipDetailsPage()),
        );
      },
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 20),
        decoration: BoxDecoration(
          color: const Color(0xffFCD24F),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Text(text, style: const TextStyle(color: Color(0xff022760))),
      ),
    );
  }

  // --------------------------------------------------
  // Blue button (Requirements)
  // --------------------------------------------------
  Widget _blueButton(BuildContext context, String text) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => ScholarshipDetailsPage()),
        );
      },
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 20),
        decoration: BoxDecoration(
          color: const Color(0xff022760),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Text(text, style: const TextStyle(color: Colors.white)),
      ),
    );
  }

  // --------------------------------------------------
  // Bottom input bar
  // --------------------------------------------------
  Widget _bottomInput() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: const BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black26,
            offset: Offset(0, -2),
            blurRadius: 8,
          )
        ],
      ),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              decoration: InputDecoration(
                hintText: "Ask anything..",
                filled: true,
                fillColor: const Color(0xffF2F2F2),
                contentPadding: const EdgeInsets.symmetric(horizontal: 20),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
          ),
          const SizedBox(width: 8),
          CircleAvatar(
            backgroundColor: const Color(0xff022760),
            child: const Icon(Icons.send, color: Colors.white),
          )
        ],
      ),
    );
  }
}
