import 'package:flutter/material.dart';

import '../../../opportunities/models/opportunity.dart';
import '../../startup/models/startup.dart';
import '../widgets/opportunity_form.dart';

class OpportunityEditScreen extends StatelessWidget {
  const OpportunityEditScreen({super.key, required this.startup, this.opportunity});

  final Startup startup;
  final Opportunity? opportunity;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(opportunity == null ? 'New opportunity' : 'Edit opportunity')),
      body: OpportunityForm(
        startup: startup,
        opportunity: opportunity,
        onSaved: () => Navigator.of(context).pop(),
      ),
    );
  }
}
