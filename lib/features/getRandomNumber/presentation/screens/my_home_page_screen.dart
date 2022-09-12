import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:random_number_trivia/features/getRandomNumber/presentation/bloc/random_number_bloc/random_number_bloc.dart';
import 'package:random_number_trivia/features/getRandomNumber/presentation/bloc/random_number_bloc/random_number_state.dart';
import 'package:random_number_trivia/shared_preferences/shared_prefrences.dart';

import '../bloc/random_number_bloc/random_number_event.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  SharedPref sharedPref = SharedPref();
  TextEditingController numberController = TextEditingController();
  String text = "";
  @override
  void initState() {
    super.initState();
    checkValue();
  }

  checkValue() async {
    String value = await sharedPref.getValue();
    setState(() {
      text = value;
    });

    print(value);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: const Text("Number Trivia"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: 150,
            child: Align(
              alignment: Alignment.center,
              child: BlocBuilder<RandomNumberBloc, RandomNumberState>(
                builder: (context, state) {
                  if (state is InitialRandomNumberState) {
                    return text.isEmpty
                        ? const Padding(
                            padding: EdgeInsets.only(left: 8.0, right: 8),
                            child: Text(
                              "Start searching",
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.w500),
                            ),
                          )
                        : Padding(
                            padding: const EdgeInsets.only(left: 8.0, right: 8),
                            child: Text(
                              text,
                              style: const TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.w500),
                            ),
                          );
                  } else if (state is LoadedRandomNumberState) {
                    SharedPref().setValue(state.numberData);
                    return Padding(
                      padding: const EdgeInsets.only(left: 8.0, right: 8),
                      child: Text(
                        state.numberData,
                        style: const TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w500),
                      ),
                    );
                  } else if (state is SearchLoadedNumberState) {
                    SharedPref().setValue(state.searchedData);
                    return Padding(
                      padding: const EdgeInsets.only(left: 8.0, right: 8),
                      child: Text(
                        state.searchedData,
                        style: const TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w500),
                      ),
                    );
                  } else {
                    return const Text(" ");
                  }
                },
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey.shade500),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  decoration: const InputDecoration(
                      hintText: "Input a number", border: InputBorder.none),
                  controller: numberController,
                  onChanged: (value) {
                    numberController.text = value;
                  },
                ),
              ),
            ),
          ),
          Row(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                      onPressed: () {
                        BlocProvider.of<RandomNumberBloc>(context).add(
                            GetSearchingRandomEvent(
                                number: int.parse(numberController.text)));

                        numberController.text = "";
                      },
                      child: const Text("Search")),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(Colors.grey.shade400)),
                      onPressed: () {
                        BlocProvider.of<RandomNumberBloc>(context)
                            .add(GetRandomNumberEvent());
                      },
                      child: const Text(
                        "Get random trivia",
                        style: TextStyle(color: Colors.black),
                      )),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
