import 'package:administration/Logics/Const.dart';
import 'package:administration/Logics/Controller.dart';
import 'package:administration/Logics/Data/Ville.dart';
import 'package:administration/Logics/TimesDateFunctions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:autocomplete_textfield/autocomplete_textfield.dart';

TextEditingController _ctrlLocalite;
TextEditingController _ctrlDestination = TextEditingController();
Controller _controller = Get.put(Controller());

class AddDemand extends StatelessWidget {
  const AddDemand({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Obx(
          () => Container(
            width: 400,
            height: 400,
            child: Card(
              elevation: 20,
              child: Padding(
                padding: const EdgeInsets.all(60.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Flexible(
                      child: DropdownButton<String>(
                        items: actionDemande.map((String value) {
                          return new DropdownMenuItem<String>(
                            child: Text(value),
                            value: value,
                          );
                        }).toList(),
                        isDense: true,
                        hint: Text(
                          "Adeel Déménagement",
                          style: TextStyle(
                              color: Colors.black, fontWeight: FontWeight.bold),
                        ),
                        onChanged: (value) {
                          _controller.addCategorie.value = value;
                          print(_controller.addCategorie.value);
                        },
                      ),
                    ),
                    AutoCompleteTextField(
                      controller: _ctrlLocalite,
                      itemSubmitted: (item) {
                        _ctrlLocalite.text = item;
                      },
                      key: null,
                      clearOnSubmit: false,
                      decoration: InputDecoration(labelText: "Localité"),
                      suggestions: ville,
                      itemBuilder: (context, item) => Container(
                        padding: EdgeInsets.all(15),
                        child: Row(
                          children: [
                            Text(item),
                          ],
                        ),
                      ),
                      itemSorter: (a, b) => a.compareTo(b),
                      itemFilter: (item, query) =>
                          item.toLowerCase().startsWith(query.toLowerCase()),
                    ),
                    AutoCompleteTextField(
                      controller: _ctrlDestination,
                      itemSubmitted: (item) {
                        _ctrlDestination.text = item;
                      },
                      key: null,
                      clearOnSubmit: false,
                      decoration: InputDecoration(labelText: "Destination"),
                      suggestions: ville,
                      itemBuilder: (context, item) => Container(
                        padding: EdgeInsets.all(15),
                        child: Row(
                          children: [
                            Text(item),
                          ],
                        ),
                      ),
                      itemSorter: (a, b) => a.compareTo(b),
                      itemFilter: (item, query) =>
                          item.toLowerCase().startsWith(query.toLowerCase()),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Date des le.."),
                        Text(convertPickedToString(
                            _controller.addDateDesLe.value)),
                        IconButton(
                          icon: Icon(Icons.date_range),
                          onPressed: () {
                            selectDate(context);
                          },
                        )
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Date Jusqu'a"),
                        Text(convertPickedToString(
                            _controller.addDateJusqua.value)),
                        IconButton(
                          icon: Icon(Icons.date_range),
                          onPressed: () {
                            selectDate(context, isJusqua: true);
                          },
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
