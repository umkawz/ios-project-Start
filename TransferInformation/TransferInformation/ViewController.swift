//
//  ViewController.swift
//  TransferInformation
//
//  Created by intern on 06/07/2017.
//  Copyright © 2017 intern. All rights reserved.
//

import UIKit
import RealmSwift


class ViewController: UIViewController {
    var idQuest: Int = 1
    @IBOutlet weak var textQuestion: UILabel!
    
    //let transitionManager = TransitionManager()
    
    
    @IBOutlet weak var dogFilter: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
//        // Do any additional setup after loading the view, typically from a nib.
        //CreateDB()
        showDB()
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

        //let secondVC: secondViewController = segue.destination as! secondViewController
        //secondVC.textOfFirstLayout = "Text of first layout edit text - " + editText.text!
        //secondVC.transitioningDelegate = self.transitionManager
    }
    
    func AddItemsDB(id: Int, layout: Int, desc: String){
        let event = DBEvent()
        event.idCard = id
        event.idLayout = layout
        event.Description = desc
        let realm = try! Realm()
        try! realm.write {
            realm.add(event)
        }
    }
    
    func CreateDB(){
        AddItemsDB(id: 1,layout: 1,desc: "Вы резидент?")
        AddItemsDB(id: 2,layout: 1,desc: "Был ли вычет ранее?")
    }
    
    func showDB(){
        let realm = try! Realm()
        let requestsFromRealm = realm.objects(DBEvent.self)
        let array = Array(requestsFromRealm)
        textQuestion.text = array[1].Description
        //textQuestion.text = requestsFromRealm.
        //textQuestion.text =
        
//        let realm = try! Realm()
//        let test = realm.objects(DBEvent.self) //.filter("age < 2")
//        print(test)
    }
}

