import 'package:flutter/material.dart';


class ScholarshipDetailsPage extends StatefulWidget {
  const ScholarshipDetailsPage({super.key});

  @override
  State<ScholarshipDetailsPage> createState() => _ScholarshipDetailsPageState();
}

class _ScholarshipDetailsPageState extends State<ScholarshipDetailsPage> {

  bool showDetails = true; // Toggle between DETAILS and REQUIREMENTS
  bool checklistMode = false; // Requirements → Checklist switch

  // Your sample requirements
  final List<String> requirements = [
    "Duly accomplished application form",
    "Certificate of Enrollment or latest Report Card",
    "Barangay Certificate of Indigency or ITR of parents",
    "Certificate of Good Moral Character",
    "Birth Certificate (PSA copy)",
    "2x2 ID photo",
    "Proof of residency or valid ID",
  ];

  // Checkbox states
  late List<bool> checked;

  @override
  void initState() {
    checked = List<bool>.filled(requirements.length, false);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF022760),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Back Button
            IconButton(
              icon: const Icon(Icons.arrow_back, color: Color(0xFFFFD147), size: 30),
              onPressed: () => Navigator.pop(context),
            ),

            // Title
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                "Incoming Freshmen\nScholarships",
                style: TextStyle(
                  color: Color(0xFFFFD147),
                  fontSize: 26,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),

            const SizedBox(height: 20),

            // TAB BUTTONS – Details | Requirements
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _tabButton(title: "Details", active: showDetails, onTap: () {
                  setState(() => showDetails = true);
                }),
                const SizedBox(width: 12),
                _tabButton(title: "Requirements", active: !showDetails, onTap: () {
                  setState(() => showDetails = false);
                }),
              ],
            ),

            const SizedBox(height: 15),

            // MAIN CARD AREA
            Expanded(
              child: AnimatedSwitcher(
                duration: const Duration(milliseconds: 300),
                child: showDetails
    ? Center(
        child: SingleChildScrollView(
          child: _detailsCard(),
        ),
      )
    : _requirementsCard(),
              ),
            ),
            SizedBox(height: 20),

            // APPLY BUTTON
            Center(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFFFD147),
                  padding: const EdgeInsets.symmetric(horizontal: 60, vertical: 14),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
                ),
                onPressed: () {},
                child: const Text(
                  "APPLY NOW",
                  style: TextStyle(
                      color: Color(0xFF022760),
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),

            const SizedBox(height: 15),
          ],
        ),
      ),
    );
  }

  // -------------------------------------------------------
  //  DETAILS TAB CARD
  // -------------------------------------------------------
  Widget _detailsCard() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: _cardDecoration(),
        child: const SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Details",
                  style: TextStyle(
                      color: Color(0xFF022760),
                      fontSize: 20,
                      fontWeight: FontWeight.w700)),

              SizedBox(height: 10),

              Text.rich(
                TextSpan(children: [
                  TextSpan(
                      text: "Scholarship Name: ",
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  TextSpan(text: "OLOPSC Educational Assistance Program\n\n"),

                  TextSpan(
                      text: "Offered by: ",
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  TextSpan(text: "Our Lady of Perpetual Succor College\n\n"),

                  TextSpan(
                      text: "Coverage: ",
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  TextSpan(
                      text: "Full tuition fee + ₱5,000 monthly allowance\n\n"),

                  TextSpan(
                      text: "Eligibility: ",
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  TextSpan(
                      text:
                          "Filipino citizen, resident of Marikina, enrolled in an accredited college/university, general average ≥ 85%, no failing grades\n\n"),

                  TextSpan(
                      text: "Application Period: ",
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  TextSpan(text: "June 1–30, 2025\n\n"),

                  TextSpan(
                      text: "Contact: ",
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  TextSpan(text: "olopscscholarshipoffice@gmail.com"),
                ]),
              )
            ],
          ),
        ),
      ),
    );
  }

  // -------------------------------------------------------
  //  REQUIREMENTS TAB CARD
  // -------------------------------------------------------
  Widget _requirementsCard() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: _cardDecoration(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Title + Checklist Switch
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text("Requirements:",
                    style: TextStyle(
                        color: Color(0xFF022760),
                        fontSize: 20,
                        fontWeight: FontWeight.w700)),
                Row(
                  children: [
                    const Text("Checklist",
                        style: TextStyle(
                          color: Color(0xFF022760),
                          fontWeight: FontWeight.bold,
                        )),
                    const SizedBox(width: 6),
                    Switch(
                      value: checklistMode,
                      activeColor: const Color(0xFFFFD147),
                      onChanged: (val) {
                        setState(() => checklistMode = val);
                      },
                    ),
                  ],
                )
              ],
            ),

            const SizedBox(height: 10),

            Expanded(
              child: ListView.builder(
                itemCount: requirements.length,
                itemBuilder: (context, index) {
                  return Row(
                    children: [
                      if (checklistMode)
                        Checkbox(
                          activeColor: const Color(0xFF022760),
                          checkColor: const Color(0xFFFFD147),
                          value: checked[index],
                          onChanged: (val) {
                            setState(() => checked[index] = val!);
                          },
                        )
                      else
                        const Padding(
                          padding: EdgeInsets.only(right: 8),
                          child: Text("•",
                              style: TextStyle(fontSize: 22, height: 1.3)),
                        ),
                      Expanded(
                        child: Text(
                          requirements[index],
                          style: const TextStyle(
                            fontSize: 15,
                            height: 1.4,
                            color: Colors.black87,
                          ),
                        ),
                      ),
                    ],
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }

  // -------------------------------------------------------
  // Reusable card decoration
  // -------------------------------------------------------
  BoxDecoration _cardDecoration() {
    return BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(12),
    );
  }

  // -------------------------------------------------------
  // TAB BUTTON WIDGET
  // -------------------------------------------------------
  Widget _tabButton(
      {required String title, required bool active, required VoidCallback onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
        decoration: BoxDecoration(
          color: active ? const Color(0xFFFFD147) : Colors.white.withOpacity(0.15),
          borderRadius: BorderRadius.circular(25),
          border: Border.all(
            color: const Color(0xFFFFD147),
            width: active ? 0 : 1.5,
          ),
        ),
        child: Text(
          title,
          style: TextStyle(
            color: active ? const Color(0xFF022760) : Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
