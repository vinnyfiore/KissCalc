//
//  ViewController.swift
//  KISSCalc
//
//  Created by Vincent Fiore on 3/28/15.
//  Copyright (c) 2015 Vinny F Apps. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var DisplayLabel: UILabel!
    @IBOutlet weak var NumTextField: UITextField!
    @IBOutlet weak var AddButton: UIButton!
    @IBOutlet weak var SubtractButton: UIButton!
    @IBOutlet weak var SetButton: UIButton!
    @IBOutlet weak var ResetButton: UIButton!
    @IBOutlet weak var infoButton: UIButton!
    var defaults = NSUserDefaults()

    

    override func viewDidLoad() {
        super.viewDidLoad()
        let settings = UIUserNotificationSettings(forTypes: UIUserNotificationType.Badge, categories: nil)
        UIApplication.sharedApplication().registerUserNotificationSettings(settings)
        UIApplication.sharedApplication().statusBarStyle = UIStatusBarStyle.LightContent
        
        var savedNum = defaults.integerForKey("num")
        //defaults.setInteger(10, forKey: "num")
        
        DisplayLabel.text = String(defaults.integerForKey("num"))
        NumTextField.text = String(0)
        NumTextField.keyboardAppearance = UIKeyboardAppearance.Dark



        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func addButtonPressed(sender: AnyObject) {
        if (NumTextField.text == ""){

        }
        if (NumTextField.text.toInt()! + (DisplayLabel.text?.toInt())! > 99999 ){
            
            let alertController = UIAlertController(title: "Error", message:
                "Number cannot be larger than 99,999.", preferredStyle: UIAlertControllerStyle.Alert)
            alertController.addAction(UIAlertAction(title: "Okay", style: UIAlertActionStyle.Default,handler: nil))
            
            self.presentViewController(alertController, animated: true, completion: nil)
            
            NumTextField.text = String(0)
            DisplayLabel.text = String(0)
            
        }
        else{
            var numToAdd = NumTextField.text.toInt()
            var numToStart = DisplayLabel.text?.toInt()
            DisplayLabel.text = String(numToAdd!  + numToStart!)
            var displayInt = DisplayLabel.text?.toInt()
            UIApplication.sharedApplication().applicationIconBadgeNumber = displayInt!;
            defaults.setInteger(DisplayLabel.text!.toInt()!, forKey: "num")
        }

    }
    
    @IBAction func setButtonPressed(sender: AnyObject) {
        
        if (NumTextField.text == ""){
            NumTextField.text = String(0)
            DisplayLabel.text = String(0)
        }
        else{
            DisplayLabel.text = NumTextField.text
        }
        if (NumTextField.text.toInt() == nil){
            NumTextField.text = String(0)
            DisplayLabel.text = String(0)
        }
        if (NumTextField.text.toInt() > 99999){
            
            let alertController = UIAlertController(title: "Error", message:
                "Number cannot be larger than 99,999.", preferredStyle: UIAlertControllerStyle.Alert)
            alertController.addAction(UIAlertAction(title: "Okay", style: UIAlertActionStyle.Default,handler: nil))
            
            self.presentViewController(alertController, animated: true, completion: nil)
            
            NumTextField.text = String(0)
            DisplayLabel.text = String(0)
            
        }
        defaults.setInteger(NumTextField.text.toInt()!, forKey: "num")
        var displayInt = DisplayLabel.text?.toInt()
        UIApplication.sharedApplication().applicationIconBadgeNumber = displayInt!;
        defaults.setInteger(DisplayLabel.text!.toInt()!, forKey: "num")
        
    }
    @IBAction func subtractButtonPressed(sender: AnyObject) {
        if (NumTextField.text == ""){
            
        }
        if (DisplayLabel.text!.toInt()! - NumTextField.text.toInt()! < 0 ){
            
            let alertController = UIAlertController(title: "Error", message:
                "Number cannot be negative.", preferredStyle: UIAlertControllerStyle.Alert)
            alertController.addAction(UIAlertAction(title: "Okay", style: UIAlertActionStyle.Default,handler: nil))
            
            self.presentViewController(alertController, animated: true, completion: nil)
            
            NumTextField.text = String(0)
        }
        else{
            var numToSubtract = NumTextField.text.toInt()
            var numToStart = DisplayLabel.text?.toInt()
            DisplayLabel.text = String(numToStart!  - numToSubtract!)
            var displayInt = DisplayLabel.text?.toInt()
            UIApplication.sharedApplication().applicationIconBadgeNumber = displayInt!;
            defaults.setInteger(DisplayLabel.text!.toInt()!, forKey: "num")
        }
        
    }
    @IBAction func resetButtonPressed(sender: AnyObject) {
        defaults.setInteger(0, forKey: "num")
        var displayInt = 0
        DisplayLabel.text = String(displayInt)
        UIApplication.sharedApplication().applicationIconBadgeNumber = displayInt;
        defaults.setInteger(DisplayLabel.text!.toInt()!, forKey: "num")


    }
    @IBAction func infoButtonPressed(sender: AnyObject) {
        let alertController = UIAlertController(title: "KISSCalc", message:
            "Keep it simple, stupid.              Designed and programmed by Vinny F.", preferredStyle: UIAlertControllerStyle.Alert)
        alertController.addAction(UIAlertAction(title: "Okay", style: UIAlertActionStyle.Default,handler: nil))
        
        self.presentViewController(alertController, animated: true, completion: nil)

    }
    

    

}

