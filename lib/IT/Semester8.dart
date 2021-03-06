import 'package:flutter/material.dart';
import 'package:gpa_calculator/Utils.dart';
import 'package:gpa_calculator/WithoutOverScrollShadowBehaviour.dart';

// ignore: must_be_immutable
class Semester8 extends StatefulWidget {
  Function(String) updatePointerCallback;

  Semester8(this.updatePointerCallback);

  @override
  State<StatefulWidget> createState() => _Semester8State();
}

class _Semester8State extends State<Semester8> {
  String _posTheory = '';
  String _elective = '';
  String _miniProject = '';

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: ScrollConfiguration(
          behavior: WithoutOverScrollShadowBehaviour(),
          child: ListView(
            shrinkWrap: false,
            children: <Widget>[
              createGradeInput(
                context,
                'Philosophy of Science',
                onChangeTheory: _updatePOSTheoryGrade,
              ),
              createGradeInput(
                context,
                'Elective',
                onChangeTheory: _updateElectiveGrade,
              ),
              createGradeInput(
                context,
                'Mini Project',
                hintString: 'Project Grade',
                onChangeTheory: _updateMiniProjectGrade,
              )
            ],
          ),
        ),
      ),
    );
  }

  void _updatePOSTheoryGrade(dynamic grade) {
    _posTheory = grade as String;
    _updateFinalPointer();
  }

  void _updateElectiveGrade(dynamic grade) {
    _elective = grade as String;
    _updateFinalPointer();
  }

  void _updateMiniProjectGrade(dynamic grade) {
    _miniProject = grade as String;
    _updateFinalPointer();
  }

  void _updateFinalPointer() {
    String fp = calculateITSemEightGPA(
        posLab: _posTheory, elective: _elective, miniProject: _miniProject);

    widget.updatePointerCallback(fp);
  }
}
