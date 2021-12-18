// ignore_for_file: camel_case_types

class human {
  late String name;
  late int age;
  late String hope;
  human(this.name, this.age, this.hope, this.score);
  human.fromhuman();
  late int score;
  @override
  String toString() {
    return '{ ${this.name}, ${this.age} ,${this.hope},${this.score}}';
  }
}
