import 'package:flutter/material.dart';

import '../../constraints.dart';
import 'external_link_button.dart';

class InfoScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            ExternalLinkButton('Strona WWW',Colors.purple.shade900),
            ExternalLinkButton('Facebook',kFacebookColor),
            ExternalLinkButton('YouTube',Colors.red),
            Padding(
              padding: const EdgeInsets.only(top: 15),
              child: Text('Kontynuując akceptujesz nasz regulamin'),
            ),
            SizedBox(height: 70,)
          ],
        ),
      ),
    );
  }
}


