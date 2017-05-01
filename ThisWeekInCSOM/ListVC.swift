//
//  ViewController.swift
//  ThisWeekInCSOM
//
//  Created by Angela Zhang on 4/19/2017.
//  Copyright © 2017 Angela Zhang. All rights reserved.
//

import UIKit

var admin = false
let username = "CSOMadmin"
let password = "admin123"


class ListVC: UIViewController {
    
    @IBOutlet weak var signInButton: UIBarButtonItem!
    @IBOutlet weak var bcEagle: UIImageView!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var SignOutButton: UIBarButtonItem!
    @IBOutlet weak var addButton: UIButton!
    
    var currentPage = 0
    
    let userdefaults = UserDefaults.standard
    
    var event = [Event]()
    var event1 = Event(name: "Google Luncheon", date: "4/20/17", desc: "", time: "7PM-8PM", location: "Fulton 220", link: "www.ios.com", email: "12345@gamail.com")
    var event2 = Event(name: "iOS Workshop", date: "4/21/17", desc: "", time: "7PM-8PM", location: "Fulton 220", link: "www.ios.com", email: "12345@gamail.com")
    var event3 = Event(name: "Hackathon", date: "4/23/17", desc: "", time: "7PM-8PM", location: "Fulton 220", link: "www.ios.com", email: "12345@gamail.com")
    var event4 = Event(name: "PwC WIT Talk", date: "4/23/17", desc: "", time: "7PM-8PM", location: "Fulton 220", link: "www.ios.com", email: "12345@gamail.com")
    var event5 = Event(name: "WIB Talk", date: "4/24/17", desc: "", time: "7PM-8PM", location: "Fulton 230", link: "www.ios.com", email: "12345@gamail.com")
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        dateLabel.text = formatTimeForToday()
        navigationController?.navigationBar.isTranslucent = true
        self.navigationController?.navigationBar.backgroundColor = UIColor.clear
        //self.navigationController?.navigationBar.isHidden = true
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default )
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.tableView.contentInset = UIEdgeInsetsMake(-36, 0, 0, 0)
        tableView.rowHeight = 44
        if signInButton.isEnabled == true {
            SignOutButton.isEnabled = false
            addButton.isEnabled = false
            
        }
        //event = [event1, event2, event3, event4, event5]
        
        self.loadEvents()
        
    }
    
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showEventDetail" {
            let destination = segue.destination as! EventDetailViewController
            let indexPath = tableView.indexPathForSelectedRow!
            destination.eventName = event[indexPath.row].name
            destination.dateString = event[indexPath.row].date
        }
        
    }
    
    @IBAction func unwind(sender: UIStoryboardSegue){
        
        if let source = sender.source as? EventDetailViewController {
            if source.addEvents != nil {
                self.event = source.addEvents!
                
                // Create new event to add to tableview
                let tempEvent = Event(name: source.nameTextField.text!, date: source.dateTextField.text!, desc: source.descriptionTextView.text!, time: source.timeTextView.text!, location: source.locationTextField.text!, link: source.linkTextView.text!, email: source.emailTextView.text!)
                
                // Append the new event to the array of events
                self.event.append(tempEvent)
                self.tableView.reloadData()
            } else {
                if let newEvent = source.listItem {
                    if let selectedIndexPath = tableView.indexPathForSelectedRow {
                        let index = selectedIndexPath.row
                        event[index].name = source.nameTextField.text!
                        event[index].date = source.dateTextField.text!
                        event[index].desc = source.descriptionTextView.text!
                        event[index].time = source.timeTextView.text!
                        event[index].location = source.locationTextField.text!
                        event[index].link = source.linkTextView.text!
                        event[index].email = source.emailTextView.text!
                    } else {
                        event.append(newEvent)
                    }
                    tableView.reloadData()
                } else {
                    print("Error: Didn't come from DetailViewController or couldn't get listItem")
                }
                
            }
            // Save either new events or modified events
            self.saveEvents()
        }
        
    }
    
    @IBAction func addButtonPressed(_ sender: UIButton) {
        let VC = storyboard!.instantiateViewController(withIdentifier: "EventDetail") as! EventDetailViewController
        VC.parentReference = self
        VC.addEvents = event
        self.show(VC, sender: self)
        
    }
    
    @IBAction func signOutPressed(_ sender: UIBarButtonItem) {
        admin = false
        signInButton.isEnabled = true
        addButton.isEnabled = false
        SignOutButton.isEnabled = false
    }
    
    func formatTimeForToday() -> String{
        let currentDate = Date()
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .full
        let rightNow = dateFormatter.string(from: currentDate)
        
        return rightNow
    }
    
    
    @IBAction func signInButtonPressed(_ sender: UIBarButtonItem) {
        let VC = storyboard!.instantiateViewController(withIdentifier: "SignIn") as! SignInViewController
        VC.signInButton = signInButton
        VC.addButton = addButton
        VC.signOutButton = SignOutButton
        self.show(VC, sender: self)
        print("%%%%%% Go to Sign in!")
    }
    // Save and load events
    func saveEvents() {
        let codedData = NSKeyedArchiver.archivedData(withRootObject: event)
        userdefaults.set(codedData, forKey: "events")
    }
    
    func loadEvents() {
        if let dataObj = userdefaults.object(forKey: "events") as? Data {
            if let eventsSaved = NSKeyedUnarchiver.unarchiveObject(with: dataObj) as? [Event] {
                self.event = eventsSaved
            }
        }
    }
}


extension ListVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return event.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "EventCell", for: indexPath) as! DateTableViewCell
        cell.title.text = event[indexPath.row].name
        cell.date.text = event[indexPath.row].date
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let VC = storyboard!.instantiateViewController(withIdentifier: "EventDetail") as! EventDetailViewController
        VC.listItem = event[indexPath.row]
        self.show(VC, sender: self)
    }
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if admin {
            if editingStyle == .delete {
                event.remove(at: indexPath.row)
                tableView.deleteRows(at: [indexPath], with: .fade)
                self.saveEvents()
            }
        }
    }
    
    
}
