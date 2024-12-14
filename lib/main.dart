import 'package:flutter/material.dart';
import 'package:path_prctice/TicketClipper.dart';

void main() {
  runApp(const MaterialApp(home: TicketExample()));
}

class TicketExample extends StatelessWidget {
  const TicketExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ClipPath(
          clipper: TicketClipper(position: 100, radius: 20),
          child: Container(
            width: 300,
            height: 200,
            color: Colors.amber,
            child: const Center(
              child: Text(
                'Ticket Content',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
