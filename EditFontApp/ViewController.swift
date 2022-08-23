//
//  ViewController.swift
//  EditFontApp
//
//  Created by Владислав Лымарь on 23.08.2022.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var changeFontSlider: UISlider!
   
    @IBOutlet weak var textLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    

    func changeValueSlider(value: CGFloat){
        textLabel.font = UIFont.systemFont(ofSize: value)
        textLabel.textColor = .black
    }
    
    @IBAction func sliderChangeAction(_ sender: UISlider) {
        changeValueSlider(value: CGFloat(changeFontSlider.value))
    }
    
    @IBAction func addButton(_ sender: Any) {
        let alert = UIAlertController(title: "Добавление текста", message: "Введите текст", preferredStyle: .alert)
        let add = UIAlertAction(title: "Добавить", style: .default, handler: {_ in
            guard let textInTextField = alert.textFields?.first?.text else {return}
            self.textLabel.text = textInTextField
        })
        alert.addTextField()
        alert.addAction(add)
        present(alert, animated: true)
    }
    
}

