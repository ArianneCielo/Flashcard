appBar: AppBar(
  backgroundColor: const Color(0xff022760),
  elevation: 0,
  automaticallyImplyLeading: false,
  leading: IconButton(
    icon: const Icon(Icons.menu, color: Colors.white),
    onPressed: () => _key.currentState?.openDrawer(),
  ),
  actions: [
    IconButton(
      icon: const Icon(Icons.person, color: Colors.white),
      onPressed: () {/* TODO profile */},
    ),
  ],
  // ⬇️  put the search field in flexibleSpace instead of title
  flexibleSpace: Padding(
    padding: const EdgeInsets.only(left: 56, right: 56, top: 10, bottom: 10),
    child: Container(
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
),
