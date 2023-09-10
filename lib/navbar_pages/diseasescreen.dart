// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:pawcare/cards/disease_card.dart';

class VaccineScreen extends StatefulWidget {
  const VaccineScreen({super.key});

  @override
  State<VaccineScreen> createState() => _VaccineScreenState();
}

class _VaccineScreenState extends State<VaccineScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Vacccines for your Pet'),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              SizedBox(
                height: 10,
              ),
              Text(
                'For Dogs',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
              DiseaseCard(
                  title: "Rabies Vaccine",
                  details:
                      "The rabies vaccine is essential for dogs as it protects them from this deadly viral disease. Rabies can be transmitted to humans through bites, making it crucial to vaccinate dogs to prevent its spread."),
              DiseaseCard(
                  title: "Distemper Vaccine",
                  details:
                      "The distemper vaccine guards against canine distemper, a highly contagious virus that affects a dog's respiratory, gastrointestinal, and nervous systems. It is a core vaccine recommended for all dogs."),
              DiseaseCard(
                  title: "Parvovirus Vaccine",
                  details:
                      "The parvovirus vaccine prevents parvoviral enteritis, a severe and often fatal disease affecting the gastrointestinal tract. Puppies are particularly susceptible to this virus."),
              DiseaseCard(
                  title: "Canine Adenovirus Vaccine",
                  details:
                      "This vaccine protects dogs from adenoviral infections, including infectious canine hepatitis and respiratory disease. It's especially crucial for dogs in high-risk environments."),
              DiseaseCard(
                  title: "Leptospirosis Vaccine",
                  details:
                      "Leptospirosis is a bacterial disease that can be transmitted to dogs and humans. The vaccine safeguards against various Leptospira serovars and is recommended in areas with high prevalence."),
              Text('For Cats',
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  )),
              DiseaseCard(
                  title: "Feline Calicivirus (FCV) Vaccine",
                  details:
                      "The FCV vaccine prevents calicivirus infections, a common cause of respiratory and oral disease in cats. It is often included in the core vaccine regimen."),
              DiseaseCard(
                  title: "Feline Herpesvirus (FHV) Vaccine",
                  details:
                      "Also known as the feline rhinotracheitis vaccine, this protects against a highly contagious respiratory disease caused by the herpesvirus in cats."),
              DiseaseCard(
                  title: "Feline Panleukopenia Vaccine",
                  details:
                      "Feline panleukopenia, often referred to as feline distemper, is a severe and potentially fatal disease. The vaccine provides crucial protection."),
            ],
          ),
        ),
      ),
    );
  }
}
