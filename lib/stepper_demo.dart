import 'package:flutter/material.dart';

class StepperDemo extends StatefulWidget {
  @override
  _StepperDemoState createState() => _StepperDemoState();
}

class _StepperDemoState extends State<StepperDemo> {
  int _currentStep = 0;
  StepperType stepperType = StepperType.vertical;
  bool isChecked = false;
  bool isCheckeddos = false;
  bool isCheckedtres = false;

  @override
  Widget build(BuildContext context) {
    List _list = ["carro", "moto"];
    String _vista = "Guia de remision";
    String _vistados = "Serie";
    String _departamento = "Departamento       ";
    String _provincia = "Provincia";
    String _distrito = "Distrito";

    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text('Flutter Stepper Demo'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Stack(children: <Widget>[
          Column(
            children: [
              Stepper(
                type: stepperType,
                physics: const ClampingScrollPhysics(),
                currentStep: _currentStep,
                onStepTapped: (step) => tapped(step),
                onStepContinue: continued,
                onStepCancel: cancel,
                steps: <Step>[
                  Step(
                    title: const Text('Primer paso'),
                    content: Column(
                      children: <Widget>[
                        Row(
                          children: [
                            DropdownButton(
                              items: _list.map((name) {
                                return DropdownMenuItem(
                                  child: Text(name),
                                  value: name,
                                );
                              }).toList(),
                              onChanged: (value) {
                                print(value);
                              },
                              hint: Text(_vista),
                            ),
                            const SizedBox(width: 60),
                            DropdownButton(
                              items: null,
                              onChanged: null,
                              hint: Text(_vistados),
                            ),
                          ],
                        ),
                        TextFormField(
                          decoration: InputDecoration(
                              labelText: 'Direccion de partida'),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            DropdownButton(
                              items: null,
                              onChanged: null,
                              hint: Text(_departamento),
                            ),
                            SizedBox(
                              width: 60,
                            ),
                            DropdownButton(
                              items: null,
                              onChanged: null,
                              hint: Text(_provincia),
                            ),
                          ],
                        ),
                        DropdownButton(
                          items: null,
                          onChanged: null,
                          hint: Text(_distrito),
                        ),
                      ],
                    ),
                    isActive: _currentStep >= 0,
                    state: _currentStep >= 0
                        ? StepState.complete
                        : StepState.disabled,
                  ),
                  Step(
                    title: new Text('Segundo paso'),
                    content: Column(
                      children: <Widget>[
                        Row(
                          children: [
                            DropdownButton(
                              items: null,
                              onChanged: null,
                              hint: Text(_vista),
                            ),
                          ],
                        ),
                        TextFormField(
                          decoration: InputDecoration(
                              labelText: 'Cliente destinatario'),
                        ),
                        TextFormField(
                          decoration:
                              InputDecoration(labelText: 'Razon social RUC'),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            DropdownButton(
                              items: null,
                              onChanged: null,
                              hint: Text("Departamento"),
                            ),
                            SizedBox(
                              width: 60,
                            ),
                            DropdownButton(
                              items: null,
                              onChanged: null,
                              hint: Text("Provincia"),
                            ),
                          ],
                        ),
                        DropdownButton(
                          items: null,
                          onChanged: null,
                          hint: Text("Distrito"),
                        ),
                      ],
                    ),
                    isActive: _currentStep >= 0,
                    state: _currentStep >= 1
                        ? StepState.complete
                        : StepState.disabled,
                  ),
                  Step(
                    title: new Text('Tercer paso'),
                    content: Column(
                      children: <Widget>[
                        Row(
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: const [
                                Text("Transporte con vehículo M1 o L?"),
                                SizedBox(
                                  height: 15,
                                ),
                                Text("El traslado de la importación o    "),
                                Text("exportación es el total de la DAM"),
                                Text("o DS?")
                              ],
                            ),
                            Column(
                              children: [
                                Checkbox(
                                  value: isChecked,
                                  onChanged: (bool? value) {
                                    setState(() {
                                      isChecked = value!;
                                    });
                                  },
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 30),
                                  child: Checkbox(
                                    value: isCheckeddos,
                                    onChanged: (bool? value) {
                                      setState(() {
                                        isCheckeddos = value!;
                                      });
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            DropdownButton(
                              items: null,
                              onChanged: null,
                              hint: Text("Motivo traslado"),
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            DropdownButton(
                              items: null,
                              onChanged: null,
                              hint: Text("Modalidad traslado"),
                            ),
                          ],
                        ),
                        Visibility(
                          visible: isChecked,
                          child: Column(
                            children: [
                              TextFormField(
                                decoration: InputDecoration(
                                    labelText: 'RUC transportista'),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              TextFormField(
                                decoration: InputDecoration(
                                    labelText: 'Razon social transportista'),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              TextFormField(
                                decoration: InputDecoration(
                                    labelText: '# Registro MTC'),
                              )
                            ],
                          ),
                        ),
                        Visibility(
                          visible: isCheckeddos,
                          child: Column(
                            children: [
                              DropdownButton(
                                items: null,
                                onChanged: null,
                                hint: Text("Tipo documento"),
                              ),
                              TextFormField(
                                decoration:
                                    InputDecoration(labelText: '# Documento'),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              TextFormField(
                                decoration: InputDecoration(
                                    labelText: 'Nombre conductor'),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              TextFormField(
                                decoration:
                                    InputDecoration(labelText: '# Licencia'),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              TextFormField(
                                decoration: InputDecoration(
                                    labelText: 'Placa vehiculo'),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                    isActive: _currentStep >= 0,
                    state: _currentStep >= 2
                        ? StepState.complete
                        : StepState.disabled,
                  ),
                  Step(
                    title: new Text('Cuarto paso'),
                    content: Column(
                      children: <Widget>[
                        Row(
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: const [
                                Text("Trasbordo programado"),
                              ],
                            ),
                            Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 40),
                                  child: Checkbox(
                                    value: isCheckedtres,
                                    onChanged: (bool? value) {
                                      setState(() {
                                        isCheckedtres = value!;
                                      });
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        TextFormField(
                          decoration:
                              InputDecoration(labelText: 'Observaciones'),
                        ),
                        SizedBox(height: 10,),
                        TextFormField(
                          decoration:
                              InputDecoration(labelText: 'Peso bruto total KG'),
                        )
                      ],
                    ),
                    isActive: _currentStep >= 0,
                    state: _currentStep >= 3
                        ? StepState.complete
                        : StepState.disabled,
                  )
                ],
              ),
            ],
          ),
        ]),
      ),
      //  floatingActionButton: FloatingActionButton(
      // child: Icon(Icons.list),
      // onPressed: switchStepsType,
      //),
    );
  }

  switchStepsType() {
    setState(() => stepperType == StepperType.vertical
        ? stepperType = StepperType.horizontal
        : stepperType = StepperType.vertical);
  }

  tapped(int step) {
    setState(() => _currentStep = step);
  }

  continued() {
    _currentStep < 3 ? setState(() => _currentStep += 1) : null;
  }

  cancel() {
    _currentStep > 0 ? setState(() => _currentStep -= 1) : null;
  }
}
