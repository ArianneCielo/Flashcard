import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';

void main() => runApp(const App());

class App extends StatelessWidget {
  const App({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(useMaterial3: false),
      home: const PersonalInformationPage(),
    );
  }
}

// personal information page
class PersonalInformationPage extends StatefulWidget {
  const PersonalInformationPage({super.key});
  @override
  State<PersonalInformationPage> createState() =>
      _PersonalInformationPageState();
}

class _PersonalInformationPageState extends State<PersonalInformationPage> {
  final _formKey = GlobalKey<FormState>();
  final Map<String, dynamic> data = {};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF022760),
      appBar: AppBar(
        backgroundColor: const Color(0xFFFFD047),
        title: const Text('Application Form – Personal Info',
            style: TextStyle(color: Colors.black)),
        centerTitle: true,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 45, vertical: 24),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                _roundedField("Contact Number*", onSaved: (v) {
                  data["contactNumber"] = v;
                }, keyboard: TextInputType.phone),
                const SizedBox(height: 16),
                _roundedField("Civil Status*", onSaved: (v) {
                  data["civilStatus"] = v;
                }),
                const SizedBox(height: 16),
                _roundedField("Nationality*", onSaved: (v) {
                  data["nationality"] = v;
                }),
                const SizedBox(height: 16),
                _roundedField("Email Address*", onSaved: (v) {
                  data["emailAddress"] = v;
                }, keyboard: TextInputType.emailAddress),
                const SizedBox(height: 16),
                _countryDropdown(),
                const SizedBox(height: 32),
                _nextButton(() {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) =>
                            EducationalBackgroundPage(applicationData: data),
                      ),
                    );
                  }
                }),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _roundedField(String hint,
      {TextInputType? keyboard, required FormFieldSetter<String> onSaved}) {
    return TextFormField(
      decoration: _inputDeco(hint),
      keyboardType: keyboard,
      validator: (v) => v!.isEmpty ? "Required" : null,
      onSaved: onSaved,
    );
  }

  InputDecoration _inputDeco(String hint) => InputDecoration(
        hintText: hint,
        filled: true,
        fillColor: const Color(0xFFF5FCF9),
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(50),
            borderSide: BorderSide.none),
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
      );

  Widget _countryDropdown() {
    return DropdownButtonFormField<String>(
      items: _countries
          .map((e) => DropdownMenuItem(value: e, child: Text(e)))
          .toList(),
      onChanged: (_) {},
      onSaved: (v) => data["country"] = v,
      validator: (v) => v == null ? "Required" : null,
      decoration: _inputDeco("Country"),
    );
  }

  Widget _nextButton(VoidCallback onTap) => SizedBox(
        width: double.infinity,
        height: 50,
        child: ElevatedButton(
          onPressed: onTap,
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFFFFD047),
            foregroundColor: const Color(0xFF022760),
            shape: const StadiumBorder(),
            elevation: 20,
          ),
          child: const Text("NEXT"),
        ),
      );

  final List<String> _countries = [
    'Bangladesh',
    'Switzerland',
    'Canada',
    'Japan',
    'Germany',
    'Australia',
    'Sweden',
    'Philippines'
  ];
}

// educational background page
class EducationalBackgroundPage extends StatefulWidget {
  final Map<String, dynamic> applicationData;
  const EducationalBackgroundPage({super.key, required this.applicationData});

  @override
  State<EducationalBackgroundPage> createState() =>
      _EducationalBackgroundPageState();
}

class _EducationalBackgroundPageState
    extends State<EducationalBackgroundPage> {
  final _formKey = GlobalKey<FormState>();
  late Map<String, dynamic> data;

  @override
  void initState() {
    super.initState();
    data = Map.from(widget.applicationData);
  }

  @override
  Widget build(BuildContext context) {
    return _scaffold(
      title: "Educational Background",
      body: Form(
        key: _formKey,
        child: Column(
          children: [
            _field("Name of School*", (v) => data["schoolName"] = v),
            const SizedBox(height: 16),
            _field("Year Level/Grade*", (v) => data["yearLevel"] = v),
            const SizedBox(height: 16),
            _field("Cluster*", (v) => data["cluster"] = v),
            const SizedBox(height: 16),
            _field("General Weighted Average*",
                (v) => data["gwa"] = v,
                keyboard: TextInputType.number),
            const SizedBox(height: 32),
            _nextButton(() {
              if (_formKey.currentState!.validate()) {
                _formKey.currentState!.save();
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (_) =>
                          FamilyBackgroundPage(applicationData: data)),
                );
              }
            })
          ],
        ),
      ),
    );
  }

  Widget _field(String hint, FormFieldSetter<String> onSaved,
      {TextInputType? keyboard}) {
    return TextFormField(
      decoration: _inputDeco(hint),
      keyboardType: keyboard,
      validator: (v) => v!.isEmpty ? "Required" : null,
      onSaved: onSaved,
    );
  }

  InputDecoration _inputDeco(String hint) => InputDecoration(
        hintText: hint,
        filled: true,
        fillColor: const Color(0xFFF5FCF9),
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(50),
            borderSide: BorderSide.none),
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
      );

  Widget _nextButton(VoidCallback onTap) => SizedBox(
        width: double.infinity,
        height: 50,
        child: ElevatedButton(
          onPressed: onTap,
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFFFFD047),
            foregroundColor: const Color(0xFF022760),
            shape: const StadiumBorder(),
            elevation: 20,
          ),
          child: const Text("NEXT"),
        ),
      );

  Scaffold _scaffold({required String title, required Widget body}) {
    return Scaffold(
      backgroundColor: const Color(0xFF022760),
      appBar: AppBar(
        title: Text(title, style: const TextStyle(color: Colors.black)),
        backgroundColor: const Color(0xFFFFD047),
        centerTitle: true,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 45, vertical: 24),
            child: body),
      ),
    );
  }
}

// family background page
class FamilyBackgroundPage extends StatefulWidget {
  final Map<String, dynamic> applicationData;
  const FamilyBackgroundPage({super.key, required this.applicationData});
  @override
  State<FamilyBackgroundPage> createState() => _FamilyBackgroundPageState();
}

class _FamilyBackgroundPageState extends State<FamilyBackgroundPage> {
  final _formKey = GlobalKey<FormState>();
  late Map<String, dynamic> data;

  @override
  void initState() {
    super.initState();
    data = Map.from(widget.applicationData);
  }

  @override
  Widget build(BuildContext context) {
    return _scaffold(
      title: "Family Background",
      body: Form(
        key: _formKey,
        child: Column(
          children: [
            _field("Father's Name*", (v) => data["fatherName"] = v),
            const SizedBox(height: 16),
            _field("Father's Occupation*", (v) => data["fatherOccupation"] = v),
            const SizedBox(height: 16),
            _field("Mother's Name*", (v) => data["motherName"] = v),
            const SizedBox(height: 16),
            _field("Mother's Occupation*", (v) => data["motherOccupation"] = v),
            const SizedBox(height: 16),
            _field("Number of Siblings*", (v) => data["siblingsCount"] = v,
                keyboard: TextInputType.number),
            const SizedBox(height: 16),
            _field("Family Monthly Income*", (v) => data["familyIncome"] = v,
                keyboard: TextInputType.number),
            const SizedBox(height: 32),
            _nextButton(() {
              if (_formKey.currentState!.validate()) {
                _formKey.currentState!.save();
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (_) =>
                          FinancialInformationPage(applicationData: data)),
                );
              }
            }),
          ],
        ),
      ),
    );
  }

  Widget _field(String hint, FormFieldSetter<String> onSaved,
      {TextInputType? keyboard}) {
    return TextFormField(
      decoration: _inputDeco(hint),
      keyboardType: keyboard,
      validator: (v) => v!.isEmpty ? "Required" : null,
      onSaved: onSaved,
    );
  }

  InputDecoration _inputDeco(String hint) => InputDecoration(
        hintText: hint,
        filled: true,
        fillColor: const Color(0xFFF5FCF9),
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(50),
            borderSide: BorderSide.none),
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
      );

  Widget _nextButton(VoidCallback onTap) => SizedBox(
        width: double.infinity,
        height: 50,
        child: ElevatedButton(
          onPressed: onTap,
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFFFFD047),
            foregroundColor: const Color(0xFF022760),
            shape: const StadiumBorder(),
            elevation: 20,
          ),
          child: const Text("NEXT"),
        ),
      );

  Scaffold _scaffold({required String title, required Widget body}) {
    return Scaffold(
      backgroundColor: const Color(0xFF022760),
      appBar: AppBar(
        title: Text(title, style: const TextStyle(color: Colors.black)),
        backgroundColor: const Color(0xFFFFD047),
        centerTitle: true,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 45, vertical: 24),
            child: body),
      ),
    );
  }
}

// financial information page

class FinancialInformationPage extends StatefulWidget {
  final Map<String, dynamic> applicationData;
  const FinancialInformationPage({super.key, required this.applicationData});
  @override
  State<FinancialInformationPage> createState() =>
      _FinancialInformationPageState();
}

class _FinancialInformationPageState extends State<FinancialInformationPage> {
  final _formKey = GlobalKey<FormState>();
  late Map<String, dynamic> data;

  @override
  void initState() {
    super.initState();
    data = Map.from(widget.applicationData);
  }

  @override
  Widget build(BuildContext context) {
    return _scaffold(
      title: "Financial Information",
      body: Form(
        key: _formKey,
        child: Column(
          children: [
            _field("Source of Financial Support*", (v) {
              data["financialSource"] = v;
            }),
            const SizedBox(height: 16),
            _field("Estimated Monthly Expenses*", (v) {
              data["monthlyExpenses"] = v;
            }, keyboard: TextInputType.number),
            const SizedBox(height: 16),
            _field("Reason for Needing Assistance*", (v) {
              data["reason"] = v;
            }, maxLines: 3),
            const SizedBox(height: 32),
            _nextButton(() {
              if (_formKey.currentState!.validate()) {
                _formKey.currentState!.save();
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) =>
                        AdditionalDocumentsPage(applicationData: data),
                  ),
                );
              }
            }),
          ],
        ),
      ),
    );
  }

  Widget _field(String hint, FormFieldSetter<String> onSaved,
      {TextInputType? keyboard, int maxLines = 1}) {
    return TextFormField(
      decoration: _inputDeco(hint),
      keyboardType: keyboard,
      maxLines: maxLines,
      validator: (v) => v!.isEmpty ? "Required" : null,
      onSaved: onSaved,
    );
  }

  InputDecoration _inputDeco(String hint) => InputDecoration(
        hintText: hint,
        filled: true,
        fillColor: const Color(0xFFF5FCF9),
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide: BorderSide.none),
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
      );

  Widget _nextButton(VoidCallback onTap) => SizedBox(
        width: double.infinity,
        height: 50,
        child: ElevatedButton(
          onPressed: onTap,
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFFFFD047),
            foregroundColor: const Color(0xFF022760),
            shape: const StadiumBorder(),
            elevation: 20,
          ),
          child: const Text("NEXT"),
        ),
      );

  Scaffold _scaffold({required String title, required Widget body}) {
    return Scaffold(
      backgroundColor: const Color(0xFF022760),
      appBar: AppBar(
        title: Text(title, style: const TextStyle(color: Colors.black)),
        backgroundColor: const Color(0xFFFFD047),
        centerTitle: true,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 45, vertical: 24),
            child: body),
      ),
    );
  }
}

// additional documents page
class AdditionalDocumentsPage extends StatefulWidget {
  final Map<String, dynamic> applicationData;
  const AdditionalDocumentsPage({super.key, required this.applicationData});

  @override
  State<AdditionalDocumentsPage> createState() =>
      _AdditionalDocumentsPageState();
}

class _AdditionalDocumentsPageState extends State<AdditionalDocumentsPage> {
  final Map<String, PlatformFile?> uploadedDocs = {
    "Certificate of Enrolment / Report Card": null,
    "Barangay Certificate of Indigency": null,
    "Certificate of Good Moral Character": null,
    "Birth Certificate (PSA)": null,
  };

  Future<void> pickFile(String key) async {
    final result = await FilePicker.platform.pickFiles(
      allowMultiple: false,
      type: FileType.custom,
      allowedExtensions: ['pdf', 'jpg', 'jpeg', 'png'],
    );

    if (result != null) {
      setState(() => uploadedDocs[key] = result.files.first);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF022760),
      appBar: AppBar(
        title: const Text("Additional Documents",
            style: TextStyle(color: Colors.black)),
        backgroundColor: const Color(0xFFFFD047),
        centerTitle: true,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 45, vertical: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text("Please upload the following documents:",
                  style: TextStyle(color: Colors.white, fontSize: 16)),
              const SizedBox(height: 24),

              // Upload Cards
              ...uploadedDocs.keys.map((key) {
                final file = uploadedDocs[key];
                return Column(
                  children: [
                    GestureDetector(
                      onTap: () => pickFile(key),
                      child: Container(
                        height: 130,
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(.95),
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Row(
                          children: [
                            const Icon(Icons.upload_file,
                                size: 48, color: Color(0xFF022760)),
                            const SizedBox(width: 12),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.center,
                                children: [
                                  Text(
                                    key,
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black),
                                  ),
                                  const SizedBox(height: 4),
                                  Text(
                                    file == null
                                        ? "Tap to upload"
                                        : file.name,
                                    style: TextStyle(
                                        color: file == null
                                            ? Colors.grey
                                            : Colors.green.shade700,
                                        fontSize: 14),
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),
                  ],
                );
              }).toList(),

              const SizedBox(height: 32),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    final attached = uploadedDocs.values.where((f) => f != null);
                    if (attached.isEmpty) {
                      ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                              content: Text("Please upload at least one document.")));
                      return;
                    }

                    final Map<String, dynamic> data =
                        Map<String, dynamic>.from(widget.applicationData);
                    data["documents"] = uploadedDocs;

                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => SubmitPage(applicationData: data),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFFFD047),
                    foregroundColor: const Color(0xFF022760),
                    elevation: 20,
                    shape: const StadiumBorder(),
                    minimumSize: const Size(double.infinity, 50),
                  ),
                  child: const Text("NEXT"),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

// submit page
class SubmitPage extends StatelessWidget {
  final Map<String, dynamic> applicationData;
  const SubmitPage({super.key, required this.applicationData});

  Future<void> _submit(BuildContext context) async {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text("Application submitted — thank you!")),
    );
    Navigator.popUntil(context, (route) => route.isFirst);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF022760),
      appBar: AppBar(
        title: const Text("Review & Submit",
            style: TextStyle(color: Colors.black)),
        centerTitle: true,
        backgroundColor: const Color(0xFFFFD047),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 45, vertical: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text("2x2 ID Photo",
                  style: TextStyle(color: Colors.white, fontSize: 16)),
              const SizedBox(height: 8),
              Container(
                height: 140,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: Colors.white.withOpacity(.9),
                ),
                alignment: Alignment.center,
                child: const Icon(Icons.add_a_photo,
                    size: 48, color: Color(0xFF022760)),
              ),
              const SizedBox(height: 24),
              const Text("Proof of Residency / Valid ID",
                  style: TextStyle(color: Colors.white, fontSize: 16)),
              const SizedBox(height: 8),
              Container(
                height: 140,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: Colors.white.withOpacity(.9),
                ),
                alignment: Alignment.center,
                child: const Icon(Icons.upload_file,
                    size: 48, color: Color(0xFF022760)),
              ),
              const SizedBox(height: 32),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () => _submit(context),
                  style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFFFD047),
                      foregroundColor: const Color(0xFF022760),
                      elevation: 20,
                      shape: const StadiumBorder(),
                      minimumSize: const Size(double.infinity, 50)),
                  child: const Text("SUBMIT"),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
