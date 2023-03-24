//
//  ViewController.swift
//  Hello
//
//  Created by giovanni russo on 23/03/23.
//

import UIKit
import SwiftUI

class ViewController: UIViewController {
    
    @IBOutlet weak var mySwitch: UISwitch!
    
    @IBOutlet weak var mySlider: UISlider!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func tapPoint(_ sender: UITapGestureRecognizer) {
        let location = sender.location(in: view)
        print(location)
    }
    
    @IBAction func keyboardReturn(_ sender: UITextField) {
        if let text = sender.text{
            print(text)
        }
    }
    
    @IBAction func keyboardReturnText(_ sender: UITextField) {
        if let text = sender.text{
            print(text)
        }
    }
    
    @IBAction func buttonTapped(_ sender: Any) {
        print("Button was tapped!")
        
        if mySwitch.isOn{
            print("switch is on")
        }else{
            print("switch is off")
        }
        print("value of slider: \(mySlider.value)")
    }
    
    
    @IBSegueAction func mySwiftView(_ coder: NSCoder) -> UIViewController? {
        return UIHostingController(coder: coder, rootView: SwiftUIVersionView())
    }
}

