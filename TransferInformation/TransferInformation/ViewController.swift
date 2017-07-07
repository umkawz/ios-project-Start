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
    let maxLayout = 4
    @IBOutlet weak var textQuestion: UILabel!
    
    @IBOutlet weak var segmentData: UISegmentedControl!
    @IBOutlet weak var dogFilter: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        firstTime()
        showDB(id: idQuest) // Start id
        moveLableText()
    }
    
    func moveLableText(){
        UIView.animate(withDuration: 2.0, delay: 1.0, options: .curveEaseOut, animations: {
            var moveText = self.textQuestion.frame
            moveText.origin.x -= 10
            moveText.origin.y += 10
            
            self.textQuestion.frame = moveText
        }, completion: { finished in
            //print("moveEnd!")
        })
        UIView.animate(withDuration: 2.0, delay: 3.0, options: .curveEaseOut, animations: {
            var moveText = self.textQuestion.frame
            moveText.origin.x += 10
            moveText.origin.y -= 10
            
            self.textQuestion.frame = moveText
        }, completion: { finished in
            //print("moveEnd2!")
        })

        
    }
    
    func firstTime(){
        let preferences = UserDefaults.standard
        let currentLevelKey = "currentLevel"
        if preferences.object(forKey: currentLevelKey) == nil {
            let currentLevel = 0
            preferences.set(currentLevel, forKey: currentLevelKey)
            let didSave = preferences.synchronize()
            CreateDB()
        }
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
        AddItemsDB(id: 3,layout: 1,desc: "Вам не положен вычет")
    }
    
    func showDB(id: Int){
        let realm = try! Realm()
        try! realm.write{
            let requestsFromRealm = realm.objects(DBEvent.self)//.filter("id == 0") пока костыль
            //print(requestsFromRealm)
            let array = Array(requestsFromRealm)
            textQuestion.text = array[idQuest - 1].Description
            //realm.delete(requestsFromRealm)
        }
        //print(requestsFromRealm)
    }
    
    @IBAction func swipeUpdate(_ sender: UISwipeGestureRecognizer) {
        //animateUpdate()
        if(idQuest == 1){
            if(segmentData.selectedSegmentIndex == 0){
                idQuest += 1
            }
            else{
                idQuest = idQuest + 2
            }
        }
        print(idQuest)
        if (idQuest<maxLayout){
            showDB(id: idQuest)
        }
        moveLableText()
    }
    
    func animateUpdate(){
        UIView.animate(withDuration: 2.0, delay: 0.0, options: .curveEaseOut, animations: {
            var moveText = self.view.frame
            moveText.origin.x -= 550
            //moveText.origin.y -= 20
            
            self.view.frame = moveText
        }, completion: { finished in
            
            self.view.frame.origin.x += 550
        })
    }
    
    @IBAction func backSwipe(_ sender: Any) {
        
    }
    
    @IBAction func segmentControl(_ sender: UISegmentedControl) {
        print("Change Segment " + String(segmentData.selectedSegmentIndex))
    }
}

