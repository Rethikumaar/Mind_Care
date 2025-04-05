import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class PatientDashboard extends StatefulWidget {
  @override
  _PatientDashboardState createState() => _PatientDashboardState();
}

class _PatientDashboardState extends State<PatientDashboard> {
  DateTime? _selectedDate;
  String? _selectedTime;
  String? _selectedDoctor;

  final List<String> _timeSlots = [
    "09:00 AM",
    "10:30 AM",
    "11:00 AM",
    "02:00 PM",
    "04:00 PM"
  ];
  final List<String> _doctorList = [
    "Dr. Smith",
    "Dr. John",
    "Dr. Patel",
    "Dr. Lee",
    "Dr. Brown"
  ];

  // Function to open date picker
  Future<void> _selectDate(BuildContext context) async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2100),
    );

    if (pickedDate != null) {
      setState(() {
        _selectedDate = pickedDate;
      });
    }
  }

  // Function to schedule an appointment
  void _scheduleAppointment() {
    showDialog(
      context: context,
      builder: (context) {
        String? selectedTime;
        String? selectedDoctor;

        return AlertDialog(
          title: Text("Schedule Appointment"),
          content: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Date Selection
                Text("Select Date",
                    style: TextStyle(fontWeight: FontWeight.bold)),
                SizedBox(height: 5),
                InkWell(
                  onTap: () => _selectDate(context),
                  child: Container(
                    width: double.infinity,
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Text(
                      _selectedDate == null
                          ? "Choose a date"
                          : DateFormat('MMMM dd, yyyy').format(_selectedDate!),
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                ),
                SizedBox(height: 15),

                // Time Dropdown
                Text("Select Time",
                    style: TextStyle(fontWeight: FontWeight.bold)),
                DropdownButton<String>(
                  isExpanded: true,
                  hint: Text("Select Time"),
                  onChanged: (value) {
                    setState(() {
                      selectedTime = value;
                    });
                  },
                  items: _timeSlots.map((time) {
                    return DropdownMenuItem<String>(
                      value: time,
                      child: Text(time),
                    );
                  }).toList(),
                ),
                SizedBox(height: 15),

                // Doctor Dropdown
                Text("Select Doctor",
                    style: TextStyle(fontWeight: FontWeight.bold)),
                DropdownButton<String>(
                  isExpanded: true,
                  hint: Text("Select Doctor"),
                  onChanged: (value) {
                    setState(() {
                      selectedDoctor = value;
                    });
                  },
                  items: _doctorList.map((doctor) {
                    return DropdownMenuItem<String>(
                      value: doctor,
                      child: Text(doctor),
                    );
                  }).toList(),
                ),
                SizedBox(height: 15),
              ],
            ),
          ),
          actions: [
            TextButton(
                onPressed: () => Navigator.pop(context), child: Text("Cancel")),
            ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: Colors.black),
              onPressed: () {
                setState(() {
                  _selectedTime = selectedTime;
                  _selectedDoctor = selectedDoctor;
                });
                Navigator.pop(context);
              },
              child: Text("Save Appointment"),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100], // Light background
      appBar: AppBar(
        backgroundColor: Colors.blue,
        elevation: 1,
        title: Row(
          children: [
            Icon(Icons.health_and_safety, color: Colors.black),
            SizedBox(width: 8),
            Text('MindCare',
                style: TextStyle(
                    color: Colors.black, fontWeight: FontWeight.bold)),
          ],
        ),
        actions: [
          IconButton(
              icon: Icon(Icons.notifications, color: Colors.black),
              onPressed: () {}),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(16.0),
          child: Column(
            children: [
              _buildCard(_buildHeader()),

              // Dashboard Cards
              _buildCard(_buildDashboardCard(
                  "Next Appointment", "No upcoming appointments",
                  boldText: false)),
              _buildCard(_buildDashboardCard("Prescriptions", "3",
                  subtitle: "1 needs refill")),
              _buildCard(_buildDashboardCard("Lab Results", "2",
                  subtitle: "1 new result")),
              _buildCard(
                  _buildDashboardCard("Messages", "5", subtitle: "2 unread")),

              // Upcoming Appointments
              _buildCard(_buildUpcomingAppointments()),

              // Quick Actions
              _buildCard(_buildQuickActions()),

              SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: Text(
        "Welcome,",
        style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget _buildCard(Widget child) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.only(bottom: 15),
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 5)],
      ),
      child: child,
    );
  }

  Widget _buildUpcomingAppointments() {
    if (_selectedDate == null ||
        _selectedTime == null ||
        _selectedDoctor == null) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Upcoming Appointments",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          SizedBox(height: 10),
          Text("No upcoming appointments",
              style: TextStyle(color: Colors.black54)),
          SizedBox(height: 10),
          ElevatedButton(
            style: ElevatedButton.styleFrom(backgroundColor: Colors.black),
            onPressed: _scheduleAppointment,
            child: Text("Schedule New Appointment"),
          ),
        ],
      );
    }

    return Column(
      children: [
        Text("Upcoming Appointments",
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
        SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Dr. $_selectedDoctor",
                    style: TextStyle(fontWeight: FontWeight.bold)),
                Text(
                    "${DateFormat('dd MMMM yyyy').format(_selectedDate!)} at $_selectedTime"),
              ],
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              decoration: BoxDecoration(
                  color: Colors.black, borderRadius: BorderRadius.circular(20)),
              child: Text("Scheduled", style: TextStyle(color: Colors.white)),
            ),
          ],
        ),
        SizedBox(height: 10),
        ElevatedButton(
          style: ElevatedButton.styleFrom(backgroundColor: Colors.black),
          onPressed: _scheduleAppointment,
          child: Text("Schedule New Appointment"),
        ),
      ],
    );
  }

  Widget _buildDashboardCard(String title, String mainText,
      {String? subtitle, bool boldText = true}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: TextStyle(fontWeight: FontWeight.bold)),
        SizedBox(height: 8),
        Text(mainText,
            style: TextStyle(
                fontWeight: boldText ? FontWeight.bold : FontWeight.normal)),
        if (subtitle != null)
          Text(subtitle, style: TextStyle(color: Colors.black54)),
      ],
    );
  }

  Widget _buildQuickActions() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Quick Actions",
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
        SizedBox(height: 10),
        GridView.count(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          crossAxisCount: 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          childAspectRatio: 2.5,
          children: [
            _buildQuickAction("Book an AI Call", Icons.chat),
            _buildQuickAction("Request Refill", Icons.edit),
            _buildQuickAction("View Test Results", Icons.insert_drive_file),
            _buildQuickAction("Manage Appointments", Icons.calendar_today),
          ],
        ),
      ],
    );
  }

  Widget _buildQuickAction(String text, IconData icon) {
    return ElevatedButton.icon(
      style: ElevatedButton.styleFrom(
          backgroundColor: Colors.black, foregroundColor: Colors.white),
      onPressed: () {},
      icon: Icon(icon),
      label: Text(text),
    );
  }
}
