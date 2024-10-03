import 'package:flutter/material.dart';

class DOBSelector extends StatefulWidget {
  const DOBSelector({super.key});

  @override
  State<DOBSelector> createState() => _DOBSelectorState();
}

class _DOBSelectorState extends State<DOBSelector> {
  DateTime? selectedDate;
  bool isUserMale = true;

  _selectDate() async {
    DateTime? pickedDate = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        // firstDate: !isUserMale ? DateTime(2006) : DateTime(2002),
        firstDate: !isUserMale ? DateTime(2006) : DateTime(2002),
        lastDate: DateTime.now());

    if (pickedDate != null && pickedDate != selectedDate) {
      setState(() {
        selectedDate = pickedDate;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "DOB Selector",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 20,
            ),
            const Text(
              "Select Gender",
              style: TextStyle(fontSize: 15),
            ),
            ElevatedButton(
                onPressed: () {
                  setState(() {
                    isUserMale = !isUserMale;
                  });
                },
                child: Text(isUserMale ? 'Male' : 'Female')),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
                onPressed: () {
                  _selectDate();
                },
                child: const Text('Select DOB')),
            const SizedBox(
              height: 20,
            ),
            Text(selectedDate == null
                ? "No Date is selected"
                : "Selected Date is ${selectedDate!.toLocal()}")
          ],
        ),
      ),
    );
  }
}
