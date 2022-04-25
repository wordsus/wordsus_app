import 'package:flutter/material.dart';

class ProjectCard extends StatelessWidget {
  const ProjectCard({
    Key? key,
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.onTap,
  }) : super(key: key);

  final Widget icon;
  final String title;
  final String subtitle;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(minWidth: 300, maxWidth: 300),
      decoration: BoxDecoration(
        border: Border.all(color: const Color(0xFFC7C7C7)),
        borderRadius: BorderRadius.circular(5),
      ),
      child: Material(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(5),
        child: InkWell(
          borderRadius: BorderRadius.circular(5),
          highlightColor: Colors.transparent,
          splashColor: Colors.blue.withOpacity(.03),
          onTap: onTap,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 21,
                  ),
                ),
                const SizedBox(height: 9),
                Text(subtitle),
                const SizedBox(height: 100),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
