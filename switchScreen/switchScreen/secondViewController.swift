//
//  secondViewController.swift
//  switchScreen
//
//  Created by intern on 06/07/2017.
//  Copyright © 2017 intern. All rights reserved.
//

import UIKit

class secondViewController: UIViewController {
    
    @IBOutlet weak var textView: UILabel!
    
    var textOfLabel: String=""
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        textView.text=textOfLabel
    }
    

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    

}
