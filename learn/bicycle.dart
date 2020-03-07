class Bicycle {
  Bicycle(this.cadence, this.gear);

  int cadence;
  int _speed = 0;
  int gear;

  int get speed => _speed;

  void applyBrake(int decrement) {
    _speed -= decrement;
  }

  void speedUp(int increment) {
    _speed += increment;
  }

  @override
  String toString() => 'Bicycle: $_speed mph';
}
