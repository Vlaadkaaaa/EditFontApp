//
//  ViewController.swift
//  EditFontApp
//
//  Created by Владислав Лымарь on 23.08.2022.
//

import UIKit

class ViewController: UIViewController {
  

    @IBOutlet weak var textColorButtonOutlet: UIButton!
    @IBOutlet weak var changeFontSlider: UISlider!
      
    var arrayColor = [("black", UIColor.black),
                      ("blue", UIColor.blue),
                      ("red", UIColor.red),
                      ("green", UIColor.green),
                      ("pink", UIColor.systemPink)]
    var arrayFont = ["Arial", "Zapfino", "Apple SD Gothic Neo"
    ]
    @IBOutlet weak var textLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
     
       // createSwitch()
    }
    
    

   
    func changeValueSlider(value: CGFloat){
        textLabel.font = textLabel.font.withSize(value)
    }
    
    @IBAction func sliderChangeAction(_ sender: UISlider) {
        changeValueSlider(value: CGFloat(changeFontSlider.value))
    }
    
    
    @IBAction func chooseFontButton(_ sender: UIButton) {
        let fontPickerView = UIPickerView()
        fontPickerView.frame = CGRect(x: 20, y: 550, width: 146, height: 150)
        fontPickerView.dataSource = self
        fontPickerView.delegate = self
        fontPickerView.tag = 0

        self.view.addSubview(fontPickerView)
    }
    
    
    @IBAction func choseColorBotton(_ sender: UIButton) {
        let colorPickerView = UIPickerView()
        colorPickerView.frame = CGRect(x: 230, y: 550, width: 146, height: 150)
        
        colorPickerView.dataSource = self
        colorPickerView.delegate = self
        colorPickerView.tag = 1

        textColorButtonOutlet.isHidden = true
        self.view.addSubview(colorPickerView)
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

extension ViewController: UIPickerViewDataSource{
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
       return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if pickerView.tag == 0{
            return arrayFont.count
        } else {
            return arrayColor.count
        }
    }

}

extension ViewController: UIPickerViewDelegate{
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if pickerView.tag == 0 {
            return arrayFont[row]
        } else{
            return arrayColor[row].0
        }
        
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if pickerView.tag == 0{
            textLabel.font = UIFont(name: arrayFont[row], size: CGFloat(changeFontSlider.value))
        } else if pickerView.tag == 1 {
            textLabel.textColor = arrayColor[row].1

        }
    }
}
