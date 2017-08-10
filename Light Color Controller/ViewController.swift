//
//  ViewController.swift
//  Light Color Controller
//
//  Created by Gross, Paul on 8/9/17.
//  Copyright © 2017 Maryville App Development. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    @IBOutlet weak var hueValueText: UITextField!
    @IBOutlet weak var colorNameLabel: UILabel!
    @IBOutlet weak var switchButton: UIButton!

    var isLightOn = false
    
    @IBAction func onSwitchLight(_ sender: Any) {
        isLightOn = !isLightOn
        
        if isLightOn {
            if let hueValueString = hueValueText.text {
                if let hueValue = Float( hueValueString ) {
                    let huePercent = hueValue / 360.0
                    let lightColor = UIColor( hue: CGFloat(huePercent), saturation: 1.0, brightness: 1.0, alpha: 1.0)
                    
                    view.backgroundColor = lightColor
                    
                    
                    switchButton.setTitle("OFF", for: UIControlState.normal)
                    
                    let nameLabelColor = UIColor( hue: CGFloat(huePercent), saturation: 0.5, brightness: 0.5, alpha: 1.0)
                    colorNameLabel.backgroundColor = nameLabelColor
                    
                    let colorName:String
                    
                    switch hueValue {
                        case 30...89: colorName = "YELLOW"
                        case 90...149: colorName = "GREEN"
                    case 150...209: colorName = "CYAN"
                    case 210...269: colorName = "BLUE"
                    case 270...329: colorName = "MAGENTA"
                    case 0...29, 330...360: colorName = "RED"
                    default:
                        colorName = "INVALID COLOR"
                    }
                    
                    
                    colorNameLabel.text = colorName
                    
                    
                    
                }
            }
        } else {
            view.backgroundColor = .white
            switchButton.setTitle("ON", for: UIControlState.normal)
            
            colorNameLabel.text = ""
            colorNameLabel.backgroundColor = .white
        }
    }
}

