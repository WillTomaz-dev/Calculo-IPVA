//
//  ViewController.swift
//  Calculo ipva
//
//  Created by William Tomaz on 10/12/19.
//  Copyright © 2019 William Tomaz. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var valueVehicle: UITextField!
    @IBOutlet weak var vehicleTypeLabel: UILabel!
    @IBOutlet weak var StackResult: UIStackView!
    @IBOutlet weak var tipoDeVeiculo: UITextField!
    @IBOutlet weak var totalValue: UILabel!
    
    var convert = String()
    var priceCar = Float()
    var vehicleType = String()
    var result = Float()
    @IBAction func calculate(_ sender: Any) {
        func calculate(_ sender: UIButton) { self.valueVehicle.resignFirstResponder() }
    calcularvalores()
        
    }
    
    private let dataSource =
    ["Passeio, Gasolina/Flex", "Passeio, Alcool/Elétrico/Gás", "Picape, Cabine dupla", "Picape, cabine simples", "Ônibus/Micro-ônibus", "Motocicleta/Motoneta/Quadriciclo", "Caminhão"]
   
    override func viewDidLoad() {
        super.viewDidLoad()
        StackResult.isHidden = true
        tipoDeVeiculo.inputView = picker
        addtoolbar()
        picker.dataSource = self
        picker.delegate = self
    }
    
    var picker = UIPickerView()
    func addtoolbar() {
        let toolbar = UIToolbar()
        let okButton = UIBarButtonItem(title: "OK", style: .done, target: self, action: #selector(okTapped))
        okButton.tintColor = .black
        toolbar.items = [okButton]
        tipoDeVeiculo.inputAccessoryView = toolbar
    }
    
    @objc func okTapped(){
        print("ok")
    }
}
    extension ViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return dataSource.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return dataSource[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
            tipoDeVeiculo.text = dataSource[row]
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) { self.view.endEditing(true)
    }
    
    func calcularvalores(){
        
        priceCar = (valueVehicle.text! as NSString).floatValue
        vehicleType = tipoDeVeiculo.text!
        
        if valueVehicle.text!.isEmpty {
            let vazio = UIAlertController(title: "Campo vazio!", message: "Digite o valor do seu carro calcular o IPVA", preferredStyle: .alert)
            let confirmar = UIAlertAction(title: "Confirmar", style: .destructive, handler: nil)
            present(vazio, animated: true, completion: nil)
            vazio.addAction(confirmar)
            
        } else if tipoDeVeiculo.text!.isEmpty {
            let vazio = UIAlertController(title: "Campo vazio!", message: "Selecione o tipo de carro para calcular o IPVA", preferredStyle: .alert)
            let confirmar = UIAlertAction(title: "Confirmar", style: .destructive, handler: nil)
            present(vazio, animated: true, completion: nil)
            vazio.addAction(confirmar)
            
        } else if tipoDeVeiculo.text == "Passeio, Gasolina/Flex"{
            StackResult.isHidden = false
            result = priceCar * 0.04
            vehicleTypeLabel.text = "Tipo de carro: Passeio, Gasolina/Flex"
            convert = String(format: "%.2f", result)
            let convertido = convert.replacingOccurrences(of: ".", with: ",")
            totalValue.text = ("Valor a pagar: R$:" + convertido)
            
        } else if tipoDeVeiculo.text == "Tipo de carro: Passeio, Alcool/Elétrico/Gás"{
            StackResult.isHidden = false
            result = priceCar * 0.03
            vehicleTypeLabel.text = "Tipo de carro: Passeio, Alcool/Elétrico/Gás"
            convert = String(format: "%.2f", result)
            let convertido = convert.replacingOccurrences(of: ".", with: ",")
            totalValue.text = ("Valor a pagar: R$:" + convertido)
            
        } else if tipoDeVeiculo.text == "Picape, Cabine dupla"{
            StackResult.isHidden = false
            result = priceCar * 0.04
            vehicleTypeLabel.text = "Tipo de carro: Picape, Cabine dupla"
            convert = String(format: "%.2f", result)
            let convertido = convert.replacingOccurrences(of: ".", with: ",")
            totalValue.text = ("Valor a pagar: R$:" + convertido)
            
        } else if tipoDeVeiculo.text == "Picape, cabine simples"{
            StackResult.isHidden = false
            result = priceCar * 0.02
            vehicleTypeLabel.text = "Tipo de carro: Picape, cabine simples"
            convert = String(format: "%.2f", result)
            let convertido = convert.replacingOccurrences(of: ".", with: ",")
            totalValue.text = ("Valor a pagar: R$:" + convertido)
            
        } else if tipoDeVeiculo.text == "Ônibus/Micro-ônibus"{
            StackResult.isHidden = false
            result = priceCar * 0.02
            vehicleTypeLabel.text = "Tipo de carro: Ônibus/Micro-ônibus"
            convert = String(format: "%.2f", result)
            let convertido = convert.replacingOccurrences(of: ".", with: ",")
            totalValue.text = ("Valor a pagar: R$:" + convertido)
            
        } else if tipoDeVeiculo.text == "Motocicleta/Motoneta/Quadriciclo"{
            StackResult.isHidden = false
            result = priceCar * 0.02
            vehicleTypeLabel.text = "Tipo de carro: Motocicleta/Motoneta/Quadriciclo"
            convert = String(format: "%.2f", result)
            let convertido = convert.replacingOccurrences(of: ".", with: ",")
            totalValue.text = ("Valor a pagar: R$:" + convertido)
            
        } else { //caminhão
            StackResult.isHidden = false
            result = priceCar * 0.015
            vehicleTypeLabel.text = "Tipo de carro: Caminhão"
            convert = String(format: "%.2f", result)
            let convertido = convert.replacingOccurrences(of: ".", with: ",")
            totalValue.text = ("Valor a pagar: R$:" + convertido)
        }
    }
}
