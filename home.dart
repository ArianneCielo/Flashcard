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
