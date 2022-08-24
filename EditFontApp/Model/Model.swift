//
//  Model.swift
//  EditFontApp
//
//  Created by Владислав Лымарь on 24.08.2022.
//

import Foundation
import UIKit
protocol ArrayProtocol{
    var arrayColor: [(String, UIColor)]  { get  }
    var arrayFont: [String]  { get  }
}
class FontModel: ArrayProtocol{
    
    var arrayColor = [("black", UIColor.black),
                      ("blue", UIColor.blue),
                      ("red", UIColor.red),
                      ("green", UIColor.green),
                      ("pink", UIColor.systemPink)]
    var arrayFont = ["Arial", "Zapfino", "Apple SD Gothic Neo"
    ]
}
