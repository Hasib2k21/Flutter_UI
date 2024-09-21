import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(
    BlocProvider(
      create: (context) => OnboardingCubit(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const OnboardingScreen(),
    );
  }
}

// Cubit to manage onboarding state
class OnboardingCubit extends Cubit<int> {
  OnboardingCubit() : super(0);

  void setCurrentPage(int page) => emit(page);
}

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            const Spacer(flex: 2),
            Expanded(
              flex: 14,
              child: PageView.builder(
                itemCount: demoData.length,
                onPageChanged: (value) {
                  // Use BLoC to update the current page
                  context.read<OnboardingCubit>().setCurrentPage(value);
                },
                itemBuilder: (context, index) => OnboardContent(
                  illustration: demoData[index]["illustration"],
                  title: demoData[index]["title"],
                  text: demoData[index]["text"],
                ),
              ),
            ),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                demoData.length,
                    (index) => BlocBuilder<OnboardingCubit, int>(
                  builder: (context, currentPage) {
                    return DotIndicator(isActive: index == currentPage);
                  },
                ),
              ),
            ),
            const Spacer(flex: 2),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: BlocBuilder<OnboardingCubit, int>(
                builder: (context, currentPage) {
                  return ElevatedButton(
                    onPressed: currentPage == demoData.length - 1
                        ? () {
                      // Navigate to the next page
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const NextPage(),
                        ),
                      );
                    }
                        : null, // Disable button if not on the last page
                    style: ElevatedButton.styleFrom(
                      backgroundColor: currentPage == demoData.length - 1
                          ? const Color(0xFF22A45D)
                          : Colors.grey, // Change color based on page
                      foregroundColor: Colors.white,
                      minimumSize: const Size(double.infinity, 40),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: Text("Get Started".toUpperCase()),
                  );
                },
              ),
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}

class OnboardContent extends StatelessWidget {
  const OnboardContent({
    super.key,
    required this.illustration,
    required this.title,
    required this.text,
  });

  final String? illustration, title, text;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: AspectRatio(
            aspectRatio: 1,
            child: Image.network(
              illustration!,
              fit: BoxFit.contain,
            ),
          ),
        ),
        const SizedBox(height: 16),
        Text(
          title!,
          style: Theme.of(context)
              .textTheme
              .titleLarge!
              .copyWith(fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        Text(
          text!,
          style: Theme.of(context).textTheme.bodyMedium,
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}

class DotIndicator extends StatelessWidget {
  const DotIndicator({
    super.key,
    this.isActive = false,
    this.activeColor = const Color(0xFF22A45D),
    this.inActiveColor = const Color(0xFF868686),
  });

  final bool isActive;
  final Color activeColor, inActiveColor;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 250),
      margin: const EdgeInsets.symmetric(horizontal: 16 / 2),
      height: 5,
      width: 8,
      decoration: BoxDecoration(
        color: isActive ? activeColor : inActiveColor.withOpacity(0.25),
        borderRadius: const BorderRadius.all(Radius.circular(20)),
      ),
    );
  }
}

// Demo data for our Onboarding screen
List<Map<String, dynamic>> demoData = [
  {
    "illustration": "https://i.postimg.cc/L43CKddq/Illustrations.png",
    "title": "All your favorites",
    "text":
    "Order from the best local restaurants \nwith easy, on-demand delivery.",
  },
  {
    "illustration": "https://i.postimg.cc/xTjs9sY6/Illustrations-1.png",
    "title": "Free delivery offers",
    "text":
    "Free delivery for new customers via Apple Pay\nand others payment methods.",
  },
  {
    "illustration": "https://i.postimg.cc/6qcYdZVV/Illustrations-2.png",
    "title": "Choose your food",
    "text":
    "Easily find your type of food craving and\nyou’ll get delivery in wide range.",
  },
];

class NextPage extends StatelessWidget {
  const NextPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Next Page')),
      body: const Center(
        child: Text('You are on the next page now!'),
      ),
    );
  }
}
