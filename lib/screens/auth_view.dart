import 'package:duet/providers/auth_view_provider.dart';
import 'package:flutter/material.dart';
import 'package:stacked/_viewmodel_builder.dart';

class AuthView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<AuthViewProvider>.reactive(
      viewModelBuilder: () =>AuthViewProvider(),
      onModelReady: (model) => model.handleAuthLogin(),
      builder: (_,model,__)=> Scaffold(
        body:Center(child: CircularProgressIndicator(),)
      ),
    );
  }
}