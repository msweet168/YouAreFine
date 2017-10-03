//
//  ViewController.swift
//  YouAreFine
//
//  Created by Mitchell Sweet on 10/2/17.
//  Copyright © 2017 Mitchell Sweet. All rights reserved.
//

import UIKit
import UserNotifications

enum mood: String {
    case happy
    case okay
    case sad
}

class ViewController: UIViewController {
    
    @IBOutlet var happyButton: UIButton!
    @IBOutlet var medButton: UIButton!
    @IBOutlet var sadButton: UIButton!
    @IBOutlet var historyButton: UIButton!
    @IBOutlet var midLabel: UILabel!
    
    var historyDict: Dictionary<mood,Date>?

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        viewSetup()
        UNUserNotificationCenter.current().removeAllPendingNotificationRequests()
        
    }
    
    func viewSetup() {
        happyButton.layer.cornerRadius = 8
        medButton.layer.cornerRadius = 8
        sadButton.layer.cornerRadius = 8
        historyButton.layer.cornerRadius = 8
    }
    
    @IBAction func happy() {
        scheduleNotification(repeatInterval: 60)
    }
    
    @IBAction func medium() {
        scheduleNotification(repeatInterval: 30)
    }
    
    @IBAction func sad() {
        scheduleNotification(repeatInterval: 10)
    }
    
    @IBAction func history() {
        let historyController = TableViewController()
        self.present(historyController, animated: true, completion: nil)
    }
    
    func scheduleNotification(repeatInterval: Double) {
        let content = UNMutableNotificationContent()
        content.title = "Everything is fine."
        content.body = "Take a deep breath, you will be okay."
        content.sound = UNNotificationSound.default()
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: repeatInterval, repeats: true)
        let request = UNNotificationRequest(identifier: "Fine", content: content, trigger: trigger)
        let center = UNUserNotificationCenter.current()
        center.add(request, withCompletionHandler: nil)
    }
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

