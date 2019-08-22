import 'package:flutter/material.dart';
import 'package:hardware_definition_app/screens/profile/profile_list_parts.dart';
import 'package:hardware_definition_app/constraints.dart';
import 'package:hardware_definition_app/constraints.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: kProfileScreenBackgroundColor,
      body: ListView(
        shrinkWrap: true,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(20),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(40),
              child: Container(
                height: media.height * 0.4,
                color: kProfileOverallBackgroundColor,
                child: Stack(
                  alignment: AlignmentDirectional.topEnd,
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(top: 15, right: 15),
                      child: Icon(
                        Icons.settings,
                        size: 35,
                        color: Colors.white,
                      ),
                    ),
                    Column(
                      children: <Widget>[
                        SizedBox(
                          width: media.width,
                          height: 30,
                        ),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(90),
                          child: Container(
                            constraints: BoxConstraints.tightFor(
                                width: media.width * 0.22,
                                height: media.width * 0.22),
                            color: Colors.black,
                            child: FittedBox(
                              child: Image.network(
                                'https://i.kym-cdn.com/entries/icons/original/000/016/546/hidethepainharold.jpg',
                              ),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8),
                          child: Text(
                            'Gość',
                            style: kProfileUserNameTextStyle,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 5),
                          child: Text(
                            'adres@email.com',
                            style: kProfileUserMailTextStyle,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 35),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: Container(
                              constraints: BoxConstraints.tightFor(
                                  width: media.width * 0.7, height: 15),
                              color: Color(0xFF858BA1),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 20),
                          child: OutlineButton(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                            borderSide: BorderSide(
                                width: 1,
                                style: BorderStyle.solid,
                                color: Colors.white),
                            onPressed: () =>
                                Navigator.pushNamed(context, '/info'),
                            child: Container(
                              child: Center(
                                child: Text(
                                  'Informacje',
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                              constraints: BoxConstraints.tightFor(
                                  width: media.width * 0.55, height: 50),
                            ),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(40),
                boxShadow: [
                  BoxShadow(
                      color: Colors.grey.shade300,
                      spreadRadius: 20,
                      blurRadius: 30,
                      offset: Offset(0, 5)),
                ],
                color: Colors.white
              ),
              child: Column(
                children: <Widget>[
                  ProfileListElement(
                      'Zapisane', '/saved', Icons.collections_bookmark),
                  ProfileListSeparator(),
                  ProfileListElement(
                      'Newsletter', '/newsletter', Icons.calendar_today),
                  ProfileListSeparator(),
                  ProfileListElement(
                      'Pomoc techniczna', '/support', Icons.headset_mic),
                  ProfileListSeparator(),
                  ProfileListElement(
                      'Twoje artykuły', '/your_articles', Icons.message),
                  ProfileListSeparator(),
                  ProfileListElement(
                      'Powiadomienia', '/notifications', Icons.notifications),
                  ProfileListSeparator(),
                  ProfileListElement(
                      'Konkursy', '/contests', Icons.card_giftcard),
                  ProfileListSeparator(),
                  ProfileListElement(
                      'Wesprzyj nas', '/donate', Icons.credit_card),
                  ProfileListSeparator(),
                  ProfileListElement(
                      'Rabaty dla użytkowników', '/promo', Icons.priority_high),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 50,
          )
        ],
      ),
    );
  }
}
