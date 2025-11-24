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
