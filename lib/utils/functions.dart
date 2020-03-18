import 'package:flutter/material.dart';

void resetFields(TextEditingController weight,TextEditingController height){
  height.text = "";
  weight.text = "";
}

String calculate(TextEditingController widthController, TextEditingController heightController){
  double weight = double.parse(widthController.text);
  double height = (heightController.text.contains(".") || heightController.text.contains(","))? double.parse(heightController.text.replaceAll(",", ".")):double.parse(heightController.text)/100;
  double imc = weight/(height*height);

  if(imc<18.6){
    return "Abaixo do peso (${imc.toStringAsPrecision(4)})";
  }
  else if(imc<24.9){
    return "Peso ideal (${imc.toStringAsPrecision(4)})";
  }
  else if(imc<29.9){
    return "Levemente acima do peso (${imc.toStringAsPrecision(4)})";
  }
  else if(imc<34.9){
    return "Obesidade grau I (${imc.toStringAsPrecision(4)})";
  }
  else if(imc<39.9){
    return "Obesidade grau II (${imc.toStringAsPrecision(4)})";
  }
  else if(imc>=40){
    return "Obesidade grau III (${imc.toStringAsPrecision(4)})";
  }
  else{
    return "Informe seus dados";
  }
}