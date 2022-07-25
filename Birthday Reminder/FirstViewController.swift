//
//  FirstViewController.swift
//  Birthday Reminder
//
//  Created by Владислав Лымарь on 25.07.2022.
//

import UIKit

class FirstViewController: UIViewController {

    var name = UILabel()
    var date = UILabel()
    var countToHB = UILabel()
    var image = UIImage()
    var addButton = UIButton()

    
    func objects(){
        name.frame = CGRect(x: 50, y: 100, width: 200, height: 20)
        name.text = "Jony Keidj"
        name.font = .boldSystemFont(ofSize: 22)
        
        date.frame = CGRect(x: 50, y: 121, width: 300, height: 20)
        date.text = "10 марта, в среду исполнится 25 лет"
        date.textColor = .gray
        date.font = UIFont(name: "Menlo", size: 14)
        
        countToHB.frame = CGRect(x: 300, y: 100, width: 200, height: 20)
        countToHB.text = "18 дней"
        countToHB.textColor = .gray
        countToHB.font = UIFont(name: "Menlo", size: 16)
        
        
        addButton.frame = CGRect(x: 335, y: 50, width: 25, height: 25)
        addButton.setTitle("+", for: .normal)
        addButton.backgroundColor = .blue
        addButton.addTarget(self, action: #selector(buttonAdd(sender:)), for: .touchUpInside)
        
        view.addSubview(name)
        view.addSubview(date)
        view.addSubview(countToHB)
        view.addSubview(addButton)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        objects()
        
    }
    
    @objc func buttonAdd(sender: UIButton!){
        if sender.titleLabel?.text == "+" {
            let vc = storyboard?.instantiateViewController(withIdentifier: "SecondVC")
            self.present(vc!, animated: true)
        }
   
    
    }
}
