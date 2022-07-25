//
//  ViewController.swift
//  Birthday Reminder
//
//  Created by Владислав Лымарь on 25.07.2022.
//

import UIKit

class ViewController: UIViewController {

    var labelName = UILabel()
    var labelSignIn = UILabel()
    var labelEmail = UILabel()
    var labelPassword = UILabel()
    var textFieldEmail = UITextField()
    var textFieldPassword = UITextField()
    var labelFaceID = UILabel()
    var switchFaceID = UISwitch()
    
    var buttonSignIn = UIButton()
    
    func labelCoordinate(label: UILabel, x: Int, y: Int, text: String, color: UIColor){
        label.frame = .init(x: x, y: y, width: 200, height: 30)
    
        label.center = CGPoint(x: x, y: y)
        label.text = text
        label.textColor = color
        self.view.addSubview(label)
    }
    
    func textFieldCoordinate(textField: UITextField, x: Int, y: Int, playceholder: String){
        textField.frame = .init(x: x, y: y, width: 400, height: 35)
        textField.placeholder = playceholder
        self.view.addSubview(textField)
    }
    
    func objects(){
        labelCoordinate(label: labelName, x: 200, y: 150, text: "Birthday Reminder",color: .blue )
        labelName.font = .boldSystemFont(ofSize: 20)
        labelCoordinate(label: labelSignIn, x: 150, y: 250, text: "Sign In", color: .black)
        labelSignIn.font = .boldSystemFont(ofSize: 30)
        labelCoordinate(label: labelEmail, x: 150, y: 300, text: "Email", color: .blue)
        textFieldCoordinate(textField: textFieldEmail, x: 50, y: 320, playceholder: "example@email.com")
        labelCoordinate(label: labelPassword, x: 150, y: 400, text: "Password", color: .blue)
        textFieldCoordinate(textField: textFieldPassword, x: 50, y: 420, playceholder: "Password")
        labelCoordinate(label: labelFaceID, x: 230, y: 500, text: "Вход по Face ID", color: .black)
        switchFaceID.frame = CGRect(x: 280, y: 486, width: .max, height: .max)
        switchFaceID.isOn = true
        buttonSignIn.frame = CGRect(x: 50, y: 550, width: 300, height: 50)
        buttonSignIn.backgroundColor = .blue
        buttonSignIn.setTitle("Войти", for: .normal)
        buttonSignIn.layer.cornerRadius = 10
        buttonSignIn.addTarget(self, action: #selector(signIn(sender:)), for: .allTouchEvents)
        
        view.addSubview(switchFaceID)
        view.addSubview(buttonSignIn)
    }
    @objc func signIn(sender: UIButton!){
        if sender.titleLabel?.text == "Войти"{
            let vc = storyboard?.instantiateViewController(withIdentifier: "FirstVC")
            self.present(vc!, animated: true)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        objects()
    
    }
    

}

