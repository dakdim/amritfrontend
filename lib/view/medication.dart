import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class MedicationPage extends StatefulWidget {
  const MedicationPage({super.key});

  @override
  State<MedicationPage> createState() => _MedicationPageState();
}

class _MedicationPageState extends State<MedicationPage> {
  final List<Map<String, String>> medications = [];

  void _addMedication(String disease, String hospital, String date) {
    setState(() {
      medications.add({
        'disease': disease,
        'hospital': hospital,
        'date': date,
      });
    });
  }

  void _showAddMedicationDialog() {
    final TextEditingController diseaseController = TextEditingController();
    final TextEditingController hospitalController = TextEditingController();
    final TextEditingController dateController = TextEditingController();

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Add Medication'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: diseaseController,
                decoration: InputDecoration(labelText: 'Disease Name'),
              ),
              TextField(
                controller: hospitalController,
                decoration: InputDecoration(labelText: 'Hospital Name'),
              ),
              TextField(
                controller: dateController,
                decoration: InputDecoration(labelText: 'Date'),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                _addMedication(
                  diseaseController.text,
                  hospitalController.text,
                  dateController.text,
                );
                Navigator.of(context).pop();
              },
              child: Text('Add'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Medication Page'),
      ),
      body: medications.isEmpty
          ? Center(
              child: Text(
                'No Medications Added',
                style: TextStyle(fontSize: 18, color: Colors.grey),
              ),
            )
          : ListView.builder(
              padding: const EdgeInsets.all(8.0),
              itemCount: medications.length,
              itemBuilder: (context, index) {
                final medication = medications[index];
                return Card(
                  margin: const EdgeInsets.symmetric(vertical: 8.0),
                  elevation: 4,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundColor: Colors.blueAccent,
                      child: Icon(Icons.medical_services, color: Colors.white),
                    ),
                    title: Text(
                      medication['disease'] ?? '',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                    ),
                    subtitle: Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Hospital: ${medication['hospital']}',
                            style: TextStyle(
                                fontSize: 14, color: Colors.grey[700]),
                          ),
                          SizedBox(height: 4),
                          Text(
                            'Date: ${medication['date']}',
                            style: TextStyle(
                                fontSize: 14, color: Colors.grey[700]),
                          ),
                        ],
                      ),
                    ),
                    trailing: Icon(Icons.arrow_forward_ios, color: Colors.grey),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => MedicinePrescribedPage(
                            disease: medication['disease'] ?? '',
                          ),
                        ),
                      );
                    },
                  ),
                );
              },
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: _showAddMedicationDialog,
        child: Icon(Icons.add),
      ),
    );
  }
}

class MedicinePrescribedPage extends StatefulWidget {
  final String disease;

  const MedicinePrescribedPage({super.key, required this.disease});

  @override
  State<MedicinePrescribedPage> createState() => _MedicinePrescribedPageState();
}

class _MedicinePrescribedPageState extends State<MedicinePrescribedPage> {
  final List<Map<String, dynamic>> medicines = [];

  void _showAddMedicineDialog() {
    final TextEditingController doctornameController = TextEditingController();
    final TextEditingController nameController = TextEditingController();
    final TextEditingController mgController = TextEditingController();

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Add Medicine'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                height: 100,
                width: double.infinity,
                color: Colors.grey[200],
                child: Icon(Icons.add_a_photo, size: 50, color: Colors.grey),
              ),
              SizedBox(height: 10),
              TextField(
                controller: nameController,
                decoration: InputDecoration(labelText: 'Medicine Name'),
              ),
              TextField(
                controller: doctornameController,
                decoration: InputDecoration(labelText: 'Doctor Name'),
              ),
              TextField(
                controller: mgController,
                decoration: InputDecoration(labelText: 'Mg'),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                setState(() {
                  medicines.add({
                    'name': nameController.text,
                    'doctor name': doctornameController.text,
                    'mg': mgController.text,
                  });
                });
                Navigator.of(context).pop();
              },
              child: Text('Add'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Medicine Prescribed'),
      ),
      body: medicines.isEmpty
          ? Center(
              child: Text(
                'No Medicines Added',
                style: TextStyle(fontSize: 18, color: Colors.grey),
              ),
            )
          : GridView.builder(
              padding: const EdgeInsets.all(8.0),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: 8,
                mainAxisSpacing: 8,
              ),
              itemCount: medicines.length,
              itemBuilder: (context, index) {
                final medicine = medicines[index];
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DetailedViewPage(
                          medicineName: medicine['name']!,
                          mg: medicine['mg']!,
                        ),
                      ),
                    );
                  },
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          child: Container(
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: Colors.grey[200],
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child:
                                Icon(Icons.image, size: 50, color: Colors.grey),
                          ),
                        ),
                        SizedBox(height: 5),
                        Text(
                          medicine['name']!,
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          '${medicine['mg']} mg',
                          style:
                              TextStyle(fontSize: 12, color: Colors.grey[600]),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: _showAddMedicineDialog,
        child: Icon(Icons.add),
      ),
    );
  }
}

class DetailedViewPage extends StatelessWidget {
  final String medicineName;
  final String mg;

  const DetailedViewPage({
    super.key,
    required this.medicineName,
    required this.mg,
  });

  @override
  Widget build(BuildContext context) {
    final String timeStamp =
        DateFormat('yyyy-MM-dd HH:mm:ss').format(DateTime.now());

    return Scaffold(
      appBar: AppBar(
        title: Text('Detailed View'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Medicine: $medicineName',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              'Dosage: $mg mg',
              style: TextStyle(fontSize: 18, color: Colors.grey[700]),
            ),
            SizedBox(height: 20),
            Text(
              'Viewed At: $timeStamp',
              style: TextStyle(fontSize: 16, color: Colors.grey[500]),
            ),
          ],
        ),
      ),
    );
  }
}
