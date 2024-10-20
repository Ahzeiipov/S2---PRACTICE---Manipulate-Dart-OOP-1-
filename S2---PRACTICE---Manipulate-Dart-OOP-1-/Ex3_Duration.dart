

class Duration {
  final _milliSecond;

  factory Duration.fromHours(int hours) {
    if (hours < 0) {
      throw ArgumentError("Hours should greater than 0");
    }
    return Duration._internal(hours * 3600000);
  }
  factory Duration.fromMinutes(int minutes) {
    if (minutes < 0) {
      throw ArgumentError("Minutes should greater than 0");
    }
    return Duration._internal(minutes * 60000);
  }
  factory Duration.fromSecond(int second) {
    if (second < 0) {
      throw ArgumentError("second should greater than 0");
    }
    return Duration._internal(second * 1000);
  }
  //  expose the millisecond value
  int get inMillionSeconds => _milliSecond;

  //  get the value that user want

  double get inHours => _milliSecond / 3600000;
  double get inMinutes => _milliSecond / 60000;
  double get inSecond => _milliSecond / 1000;

  const Duration._internal(this._milliSecond);
//  compare operator
  bool operator >(Duration other) {
    return _milliSecond > other._milliSecond;
  }

  // sum
  Duration operator +(Duration other) {
    return Duration._internal(_milliSecond + other._milliSecond);
  }

  // minus
  Duration operator -(Duration other) {
    return Duration._internal(_milliSecond - other._milliSecond);
  }

  @override
  String toString() {
    return 'Duration: $_milliSecond ms';
  }
}

void main() {
  Duration duration1 = Duration.fromHours(2);
  Duration duration2 = Duration.fromMinutes(3);
  Duration duration3 = Duration.fromSecond(5);
  print(duration1 > duration2);
  var total = duration3 + duration1;
  print("the total is : ${total.inMillionSeconds}");
  
}

