//
//  ViewController.swift
//  TransferInformation
//
//  Created by intern on 06/07/2017.
//  Copyright © 2017 intern. All rights reserved.
//

import UIKit


class ViewController: UIViewController {
    
    //let transitionManager = TransitionManager()
    
    
    @IBOutlet weak var editText: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func unwindSegue(sender: UIStoryboardSegue) {
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        let toViewController = segue.destination as UIViewController
//        toViewController.transitioningDelegate = self.transitionManager

        let secondVC: secondViewController = segue.destination as! secondViewController
        secondVC.textOfFirstLayout = "Text of first layout edit text - " + editText.text!
        //secondVC.transitioningDelegate = self.transitionManager
    }
}

