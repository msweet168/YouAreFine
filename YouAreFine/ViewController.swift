//
//  ViewController.swift
//  YouAreFine
//
//  Created by Mitchell Sweet on 10/2/17.
//  Copyright © 2017 Mitchell Sweet. All rights reserved.
//

import UIKit
import UserNotifications
import AudioToolbox

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
    @IBOutlet var banner: UILabel!
    
    var historyDict: Dictionary<mood,Date>?

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        viewSetup()
        UNUserNotificationCenter.current().removeAllPendingNotificationRequests()
        print("notifications cancelled")
    }
    
    func viewSetup() {
        happyButton.layer.cornerRadius = 8
        medButton.layer.cornerRadius = 8
        sadButton.layer.cornerRadius = 8
        historyButton.layer.cornerRadius = 8
    }
    
    @IBAction func happy() {
        scheduleNotification(repeatInterval: 3600)
        presentBanner(text: "Keep it up!")
    }
    
    @IBAction func medium() {
        scheduleNotification(repeatInterval: 1800)
        presentBanner(text: "Keep your head up!")
    }
    
    @IBAction func sad() {
        scheduleNotification(repeatInterval: 60)
        presentBanner(text: "Don't worry. Things will get better.")
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
        print("Scheduled every \(repeatInterval) seconds.")
    }
    
    func presentBanner(text: String) {
        
        banner.text = text
        UIView.animate(withDuration: 1, animations: {
            self.banner.alpha = 1
        }, completion: { (finished: Bool) in
            UIView.animate(withDuration: 1, delay: 3, animations: {
                self.banner.alpha = 0
            })
        })
        
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

