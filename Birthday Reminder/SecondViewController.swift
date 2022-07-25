//
//  SecondViewController.swift
//  Birthday Reminder
//
//  Created by Владислав Лымарь on 25.07.2022.
//

import UIKit

class SecondViewController: UIViewController {

    var pickerViewMale = UIPickerView()
    var labelName = UILabel()
    var labelDate = UILabel()
    var labelAge = UILabel()
    var labelMale = UILabel()
    var labelInst = UILabel()
 
    var textFieldName = UITextField()
    var textFieldAge = UITextField()
    var textFieldDate = UITextField()
    var textFieldMale = UITextField()
    var textFieldInst = UITextField()
    
    var datepickerDate = UIDatePicker()
    var pickerAge = UIPickerView()
    var pickerMale = UIPickerView()
      var alertInst = UIAlertController(title: "Укажите ваш Instagram", message: "", preferredStyle: .alert)

    
    var addButton = UIButton()
    var cancelButton = UIButton()
    var editPhotoButton = UIButton()
    var instButton = UIButton()
    
    var arrayMale = ["Male", "Female"]
    
    func objectsButtonAndTextField(){
   
        addButton.frame = CGRect(x: 280, y: 50, width: 100, height: 25)
        addButton.setTitleColor(.blue, for: .normal)
        addButton.setTitle("Добавить", for: .normal)
        //  addButton.addTarget(self, action: #selector(buttonAdd(sender:)), for: .touchUpInside)

        cancelButton.frame = CGRect(x: 10, y: 50, width: 100, height: 25)
        cancelButton.setTitleColor(.blue, for: .normal)
        cancelButton.setTitle("Отмена", for: .normal)
        
        editPhotoButton.frame = CGRect(x: 90, y: 250, width: 200, height: 25)
        editPhotoButton.setTitleColor(.blue, for: .normal)
        editPhotoButton.setTitle("Изменить фото", for: .normal)
        
        
        textFieldCoordinate(textField: textFieldName, x: 30, y: 340, placeholder: "Введите имя")
        textFieldCoordinate(textField: textFieldAge, x: 30, y: 400, placeholder: "Укажите возраст")
        textFieldCoordinate(textField: textFieldDate, x: 30, y: 450, placeholder: "Укажите дату рождения")
        textFieldCoordinate(textField: textFieldMale, x: 30, y: 505, placeholder: "Укажите пол")
        textFieldCoordinate(textField: textFieldInst, x: 30, y: 560, placeholder: "Добавить")
        
        
        let ok = UIAlertAction(title: "ok", style: .default) { action in
            let text = self.alertInst.textFields?.first
            self.textFieldInst.text = text?.text
        }
        let cancel = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        
        alertInst.addAction(ok)
        alertInst.addAction(cancel)
        
        
        self.view.addSubview(addButton)
        self.view.addSubview(cancelButton)
        self.view.addSubview(editPhotoButton)
        self.view.addSubview(instButton)

        present(alertInst, animated: true)

        
    }
    
    func objectsLabel(){
        labelCoordinate(label: labelName, x: 130, y: 325, text: "Имя", color: .blue)
        labelCoordinate(label: labelAge, x: 130, y: 380, text: "Возраст", color: .blue)
        labelCoordinate(label: labelDate, x: 130, y: 435, text: "Дата", color: .blue)
        labelCoordinate(label: labelMale, x: 130, y: 490, text: "Пол", color: .blue)
        labelCoordinate(label: labelInst, x: 130, y: 545, text: "Instagram", color: .blue)
    }
    
    
    func textFieldCoordinate(textField: UITextField, x: Int, y: Int, placeholder: String){
        textField.frame = CGRect(x: x, y: y, width: 300, height: 20)
        textField.placeholder = placeholder
        self.view.addSubview(textField)

    }
    
    func labelCoordinate(label: UILabel, x: Int, y: Int, text: String, color: UIColor){
        label.frame = .init(x: x, y: y, width: 200, height: 30)
        label.center = CGPoint(x: x, y: y)
        label.text = text
        label.textColor = color
        self.view.addSubview(label)
    }
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        objectsButtonAndTextField()
        objectsLabel()
        
        pickerAge.tag = 0
        pickerAge.delegate = self
        pickerAge.dataSource = self
        textFieldAge.inputAccessoryView = pickerAge

        
        pickerMale.tag = 1
        pickerMale.dataSource = self
        pickerMale.delegate = self
        textFieldMale.inputAccessoryView = pickerMale

    }
}

extension SecondViewController: UIPickerViewDataSource, UIPickerViewDelegate{
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
       return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        switch pickerView.tag{
        case 0: return 100
        case 1: return arrayMale.count
        default: return 1
        }
}
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        switch pickerView.tag{
        case 0: return String(row)
        case 1: return arrayMale[row]
        default: return ""
        }
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        switch pickerView.tag{
        case 0: return textFieldAge.text = String(row)
        case 1: return textFieldMale.text = arrayMale[row]
        default: break
            
    }
}
}
