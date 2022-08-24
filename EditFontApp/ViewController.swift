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
    @IBOutlet weak var textLabel: UILabel!
    
    //экземпляр класса FontModel
    var fontModel = FontModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
     
        createSwitchShadow()
    }
   
    //MARK: - Метод создания switch
    func createSwitchShadow(){
        let shadowSwitch = UISwitch()
        shadowSwitch.frame = CGRect(x: 20, y: 330, width: 0, height: 0)
        shadowSwitch.addTarget(self, action: #selector(shadowSwitchAddTarget), for: .allTouchEvents)
        self.view.addSubview(shadowSwitch)
    }
    @objc func shadowSwitchAddTarget(sender: UISwitch){
        if sender.isOn{
            textLabel.shadowColor = .black
            textLabel.shadowOffset = .init(width: 1, height: 1)
        } else{
            textLabel.shadowOffset = .init(width: 0, height: 0)
        }
    }
    
    func changeValueSlider(value: CGFloat){
        textLabel.font = textLabel.font.withSize(value)
    }
    
    
    //MARK: - Action
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
            return fontModel.arrayFont.count
        } else {
            return fontModel.arrayColor.count
        }
    }

}

extension ViewController: UIPickerViewDelegate{
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if pickerView.tag == 0 {
            return fontModel.arrayFont[row]
        } else{
            return fontModel.arrayColor[row].0
        }
        
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if pickerView.tag == 0{
            textLabel.font = UIFont(name: fontModel.arrayFont[row], size: CGFloat(changeFontSlider.value))
        } else if pickerView.tag == 1 {
            textLabel.textColor = fontModel.arrayColor[row].1

        }
    }
}
