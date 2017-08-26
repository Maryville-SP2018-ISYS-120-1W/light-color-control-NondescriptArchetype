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
        // Toggle Switch from on to off or vice versa
        isLightOn = !isLightOn
        
        // If we are to turn the light on
        if isLightOn {

            // If there is text in the hueValueText box, that is, it's not empty, then assign
            // that text value to hueValueString constant. If it is empty, then follow the else clause
            guard let hueValueString = hueValueText.text else {
                // The text box is empty, there was no hue value entered, so we cannot 
                // turn on the light
                
                // Assign false to isLightOn indicate light is off
                isLightOn = false
                
                // End the onSwitchLight function by returning back to where it was
                // called from. No more instructions in this function will be followed, we're done.
                return
            }
            
            // If the string from the text box can be converted into a floating point value,
            // then assign that floating point value in the hueValue constant
            guard let hueValue = Float( hueValueString ) else {
                // The hueValueString value cannot be converted to a floating point, so the value
                // entered in the hue value box is not a valid number.
                
                // Assign false to isLightOn indicate light is off
                isLightOn = false
                
                // End the onSwitchLight function by returning back to where it was
                // called from. No more instructions in this function will be followed, we're done.
                return
            }
            
            // At this point we have a valid floating point value for the value of the hue. 
            // We proceed to update the app user interface by:
            // 1) assinging the switch text
            // 2) creating and assigning the background color
            // 3) creating and assigning a color for the color name label
            // 4) picking the name of the color and displaying it in the color name label
            
            // Change the text of the switch button to "OFF" because the light is now on
            switchButton.setTitle("OFF", for: UIControlState.normal)
            
            // Convert the hue value into a percentage of 360 as there are 360 degrees in the 
            // a circle, and the hue value corresponds to an angle in the color wheel circle
            let huePercent = hueValue / 360.0
            // Initialize a new UIColor with the hue value as the huePercent, converted to a CGFloat
            // type because UIColor requires that type of value
            let lightColor = UIColor( hue: CGFloat(huePercent), saturation: 1.0, brightness: 1.0, alpha: 1.0)
                    
            // Assign the background color to our new light color
            view.backgroundColor = lightColor
            

                    
            // Create a less saturated, and less bright version the light color to make a box
            // in which to display the color name
            let nameLabelColor = UIColor( hue: CGFloat(huePercent), saturation: 0.5, brightness: 0.5, alpha: 1.0)
            colorNameLabel.backgroundColor = nameLabelColor
            
            // Declare the constant colorName to store the name of the color as a String
            // based on the hue value that was provided
            let colorName:String
            
            switch hueValue {
                // if the value of the hue is between 30 and 89, inclusive, then the color is named yellow
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
            
            
        } else {
            // We are to turn the light off
            view.backgroundColor = .white
            switchButton.setTitle("ON", for: UIControlState.normal)
            
            colorNameLabel.text = ""
            colorNameLabel.backgroundColor = .white
        }
    }
}

