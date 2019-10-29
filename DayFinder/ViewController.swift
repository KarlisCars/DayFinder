//
//  ViewController.swift
//  DayFinder
//
//  Created by Karlis Cars on 26/10/2019.
//  Copyright © 2019 Karlis Cars. All rights reserved.
//

import UIKit
var str = "izmainja"
class ViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var dayText: UITextField!
    @IBOutlet weak var monthText: UITextField!
    @IBOutlet weak var yearText: UITextField!
    @IBOutlet weak var resultLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        statusBarStyle()
        //added observers for keyboard. Listens for keyboard events
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillChange(notification:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillChange(notification:)), name: UIResponder.keyboardWillHideNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillChange(notification:)), name: UIResponder.keyboardWillChangeFrameNotification, object: nil)
        
    }
    //removes Observers. Stops listening for keyboard events
    deinit {
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillChangeFrameNotification, object: nil)
        
    }
    @IBAction func findMyWeek(_ sender: Any) {
        let calendar = Calendar.current
         var dateCompenets = DateComponents()
        
        dateCompenets.day = Int(dayText.text!)
        dateCompenets.month = Int(monthText.text!)
        dateCompenets.year = Int(yearText.text!)
        
   //     guard let day = dayTextField.text, let month = monthTextField.text, let year = yearTextField.text else {return}
        
      
        
        
        let date = calendar.date(from: dateCompenets)
        
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier:"lv_LV")
        dateFormatter.dateFormat = "EEEE"
        
        let weekday = dateFormatter.string(from: date!)
        
        let capitalizedWeekday = weekday.capitalized
        resultLabel.text = capitalizedWeekday
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
    }
    func statusBarStyle(){
        let app = UINavigationBarAppearance()
        app.backgroundColor = UIColor.red.withAlphaComponent(0.7)
        app.largeTitleTextAttributes = [.foregroundColor: UIColor.white]
        
        self.navigationController?.navigationBar.scrollEdgeAppearance = app
        
        
    }
   override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
    self.view.endEditing(true)
    }
    // this func changes keyboard. 250 height of keyboard
    @objc func keyboardWillChange(notification: Notification){
        
        guard let keyboardRect = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue else {
            return
        }
        if notification.name == UIResponder.keyboardWillShowNotification ||
            notification.name == UIResponder.keyboardWillChangeFrameNotification{
            
            view.frame.origin.y = -keyboardRect.height
        }else{
            view.frame.origin.y = 0
        }
        
    }
}

