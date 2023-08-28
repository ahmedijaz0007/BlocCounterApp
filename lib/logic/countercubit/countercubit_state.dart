
part of 'countercubit_cubit.dart';


class CounterState {
  CounterState({required this.counterValue, this.isIncremented});
  int counterValue;
  bool? isIncremented;

  Map<String, dynamic> toMap() {
    return {
      'counterValue': counterValue,
      'isIncremented': isIncremented,
    };
  }

  factory CounterState.fromMap(Map<String, dynamic> map) {
    return CounterState(
      counterValue: map['counterValue'] as int,
      isIncremented: map['isIncremented'] as bool,
    );
  }
  String toJson()=> jsonEncode(toMap()); //encode data into json

  factory CounterState.fromJson(String source) => CounterState.fromMap(jsonDecode(source));// decode data from json to map, then make a counter state from that same map
}