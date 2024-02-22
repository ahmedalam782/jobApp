import 'package:flutter/material.dart';

class AboutProfile extends StatelessWidget {
  const AboutProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12),
          child: Row(
            children: [
              Text(
                'About',
                style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                      fontSize: 18,
                    ),
              ),
              const Spacer(),
              TextButton(
                onPressed: () {},
                child: Text(
                  'Edit',
                  style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                      fontSize: 14, color: Theme.of(context).primaryColor),
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12),
          child: Text(
            "I'm Rafif Dian Axelingga, I’m UI/UX Designer, "
            "I have experience designing UI Design for approximately 1 year. I am currently joining the Vektora studio team based in Surakarta, "
            "Indonesia.I am a person who has a high spirit and likes to work to achieve what I dream of.",
            style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                  fontSize: 14,
                ),
          ),
        ),
      ],
    );
  }
}
