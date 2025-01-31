import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:fl_chart/fl_chart.dart';

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
                decoration: InputDecoration(
                  labelText: 'Date',
                  suffixIcon: IconButton(
                    icon: Icon(Icons.calendar_today),
                    onPressed: () async {
                      DateTime? pickedDate = await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(2000),
                        lastDate: DateTime(2100),
                      );
                      if (pickedDate != null) {
                        dateController.text = "${pickedDate.toLocal()}"
                            .split(' ')[0]; // Formatting Date
                      }
                    },
                  ),
                ),
                readOnly: true, // Prevents manual input
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
    TimeOfDay? selectedTime;

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
              TextButton(
                onPressed: () async {
                  final time = await showTimePicker(
                    context: context,
                    initialTime: TimeOfDay.now(),
                  );
                  if (time != null) {
                    selectedTime = time;
                  }
                },
                child: Text('Select Time'),
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
                if (selectedTime != null) {
                  setState(() {
                    medicines.add({
                      'name': nameController.text,
                      'doctor name': doctornameController.text,
                      'mg': mgController.text,
                      'time': selectedTime!.format(context),
                    });
                  });
                }
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
                            doctorname: medicine['name'],
                            time: medicine['time']),
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
                          medicine['doctor name']!,
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
                        Text(
                          medicine['time'],
                        )
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

class DetailedViewPage extends StatefulWidget {
  final String medicineName;
  final String doctorname;
  final String mg;
  final String time;

  const DetailedViewPage(
      {super.key,
      required this.medicineName,
      required this.mg,
      required this.doctorname,
      required this.time});

  @override
  _DetailedViewPageState createState() => _DetailedViewPageState();
}

class _DetailedViewPageState extends State<DetailedViewPage> {
  List<Map<String, String>> medicationRecords = [];

  void addMedicationRecord() {
    final String fullTimestamp =
        DateFormat('yyyy-MM-dd HH:mm:ss').format(DateTime.now());
    final String date = fullTimestamp.split(' ')[0];
    final String time = fullTimestamp.split(' ')[1];

    setState(() {
      medicationRecords.add({'date': date, 'time': time});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detailed View'),
      ),
      body: Column(
        children: [
          // Upper Section: Scrollable Timestamp Details
          Expanded(
            flex: 1,
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Medication Details',
                    style: const TextStyle(
                        fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  ElevatedButton(
                    onPressed: addMedicationRecord,
                    child: const Text('Add Current Timestamp'),
                  ),
                  const SizedBox(height: 20),
                  const SizedBox(height: 20),
                  DataTable(
                    columns: const [
                      DataColumn(
                        label: Text(
                          'Date',
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                      ),
                      DataColumn(
                        label: Text(
                          'Time',
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                    rows: medicationRecords
                        .map(
                          (record) => DataRow(cells: [
                            DataCell(Text(record['date']!)),
                            DataCell(Text(record['time']!)),
                          ]),
                        )
                        .toList(),
                  ),
                ],
              ),
            ),
          ),
          const Divider(),
          // Lower Section: Graph Display
          Expanded(
            flex: 1,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: LineChart(
                LineChartData(
                  gridData: FlGridData(show: true),
                  titlesData: FlTitlesData(
                    leftTitles: AxisTitles(
                      sideTitles: SideTitles(
                        showTitles: true,
                        reservedSize: 40,
                        getTitlesWidget: (value, meta) {
                          return Text(
                            '${value.toInt()}h',
                            style: const TextStyle(fontSize: 12),
                          );
                        },
                      ),
                    ),
                    bottomTitles: AxisTitles(
                      sideTitles: SideTitles(
                        showTitles: true,
                        reservedSize: 30,
                        getTitlesWidget: (value, meta) {
                          if (value.toInt() < medicationRecords.length) {
                            return Text(
                              medicationRecords[value.toInt()]['date']!,
                              style: const TextStyle(fontSize: 12),
                            );
                          }
                          return const Text('');
                        },
                      ),
                    ),
                  ),
                  borderData: FlBorderData(show: true),
                  lineBarsData: [
                    LineChartBarData(
                      spots: medicationRecords
                          .asMap()
                          .entries
                          .map(
                            (entry) => FlSpot(
                              entry.key.toDouble(),
                              double.parse(entry.value['time']!.split(':')[0]),
                            ),
                          )
                          .toList(),
                      isCurved: true,
                      gradient: LinearGradient(
                        colors: [Colors.blue, Colors.blueAccent],
                      ),
                      barWidth: 4,
                      belowBarData: BarAreaData(show: false),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
