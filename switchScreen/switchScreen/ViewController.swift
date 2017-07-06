//
//  ViewController.swift
//  switchScreen
//
//  Created by intern on 06/07/2017.
//  Copyright © 2017 intern. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var editText: UITextField!
    
    @IBOutlet weak var textView: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    
    @IBAction func unwindToViewController(_ sender: Any) {
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destenationVC: secondViewController = segue.destination as! secondViewController
        destenationVC.textOfLabel = textView.text!
        
    }


}

