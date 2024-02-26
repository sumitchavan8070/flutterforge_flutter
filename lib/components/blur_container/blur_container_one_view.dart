import 'package:flutter/material.dart';
import 'package:flutterfore_app/components/blur_container/blur_container.dart';

class BlurContainerOneView extends StatelessWidget {
  const BlurContainerOneView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff639bd8),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(height: 20),
            BlurContainer(
              blur: 5,
              height: 100,
              width: 200,
              color: Colors.white10,
              padding: const EdgeInsets.all(8),
              borderRadius: const BorderRadius.all(Radius.circular(20)),
              child: Center(
                child: Text(
                  'Rectangle',
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: Colors.white),
                ),
              ),
            ),
            const SizedBox(height: 20),
            BlurContainer.square(
              blur: 5,
              dimension: 100,
              color: Colors.white10,
              padding: const EdgeInsets.all(8),
              borderRadius: const BorderRadius.all(Radius.circular(20)),
              child: Center(
                child: Text(
                  'Square',
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: Colors.white),
                ),
              ),
            ),
            const SizedBox(height: 20),
            BlurContainer.square(
              blur: 5,
              dimension: 100,
              color: Colors.white10,
              padding: const EdgeInsets.all(8),
              borderRadius: const BorderRadius.all(Radius.circular(50)),
              child: Center(
                child: Text(
                  'Circle',
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
