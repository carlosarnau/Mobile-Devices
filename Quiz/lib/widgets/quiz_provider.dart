import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quiz/model/quiz.dart';

class QuizProvider extends StatefulWidget {
  final Widget child;
  const QuizProvider({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  State<QuizProvider> createState() => _QuizProviderState();
}

class _QuizProviderState extends State<QuizProvider> {
  @override
  void initState() {
    dbQuizConnect();
    super.initState();
  }

  @override
  void dispose() {
    dbQuizDisconnect();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: dbGetQuiz(),
      builder: (_, AsyncSnapshot<Quiz> snapshot) {
        if (snapshot.hasError) {
          return ErrorWidget(snapshot.error.toString());
        }
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }
        return Provider<Quiz>.value(
          value: snapshot.data!,
          child: widget.child,
        );
      },
    );
  }
}
