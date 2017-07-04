//
//  ViewController.swift
//  Hello World Swift
//
//  Created by intern on 04/07/2017.
//  Copyright © 2017 intern. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var editText: UITextField!
    @IBOutlet weak var textview: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    
    @IBAction func buttonClick(_ sender: Any) {
        var str: String
        //str = "Hello, "
        str = editText.text!
        if(!str.isEmpty){
            str = "Hello," + str
            textview.text=str
        }
        else{
            textview.text="Не введены данные!"
        }
        
        
        
    }
    
//    @IBAction func buttonPressed(sender: AnyObject) {
//        println(&quot;You clicked the button&quot;)
//    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

