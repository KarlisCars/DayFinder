//
//  ViewController.swift
//  DayFinder
//
//  Created by Karlis Cars on 26/10/2019.
//  Copyright © 2019 Karlis Cars. All rights reserved.
//

import UIKit
var str = "izmainja"
class ViewController: UIViewController {

    @IBOutlet weak var dayText: UITextField!
    @IBOutlet weak var monthText: UITextField!
    @IBOutlet weak var yearText: UITextField!
    @IBOutlet weak var dayOfTheWeek: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        statusBarStyle()
        
    }
    
    @IBAction func findMyWeek(_ sender: Any) {
        let calendar = Calendar.current
         var dateCompenets = DateComponents()
        
        guard let day = dayTextField.text, let month = monthTextField.text, let year = yearTextField.text else {return}
        
      
      //  dateCompenets.day = Int(dayText.text!)
       // dateCompenets.month = Int(monthText.text!)
       // dateCompenets.year = Int(yearText.text!)
        
        let date = calendar.date(from: dateCompenets)
        
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier:"lv_LV")
        dateFormatter.dateFormat = "EEEE"
        
        let weekday = dateFormatter.string(from: date!)
        let capitalizedWeekday = weekday.capitalizedresultLabel.text = capitalizedWeekday
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
}

