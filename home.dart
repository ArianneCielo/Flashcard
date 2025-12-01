import 'package:flutter/material.dart';
import 'ScholarshipDetailsPage.dart';


class AiSkolarChat extends StatelessWidget {
  const AiSkolarChat({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff022760),

      appBar: AppBar(
  backgroundColor: const Color(0xff022760),
  elevation: 0,
  automaticallyImplyLeading: false, // Disable default back button
  leading: IconButton(
    icon: const Icon(Icons.menu, color: Colors.white),
    onPressed: () {
      // Add your drawer or menu logic here
      Scaffold.of(context).openDrawer(); // Optional: if you have a Drawer
    },
  ),
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
  actions: [
    IconButton(
      icon: const Icon(Icons.person, color: Colors.white),
      onPressed: () {
        // Add navigation to profile page here
      },
    ),
  ],
),
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
                            const Text("Incoming Freshmen Scholarships",
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                              ),
                            ),

                            const SizedBox(height: 10),
                            const Text("These are recommended based on your profile:"),
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

  // ✔ Updated to be a real clickable button
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

  // ✔ Updated to open Requirements page
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
