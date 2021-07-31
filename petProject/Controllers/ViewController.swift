//
//  ViewController.swift
//  petProject
//
//  Created by Vlad Kozlov on 22.7.2021.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak public var getBirthdayDate: UIDatePicker!
    @IBAction func getBirthday(_ sender: UIDatePicker) {
        getUpdate()
    }
    
    @IBOutlet weak var weatherLabel: UILabel!
    @IBOutlet weak var passedLabel: UILabel!
    
    @IBSegueAction func passDate(_ coder: NSCoder, sender: Any?) -> BornViewController? {
        return BornViewController(coder: coder, bornDate: date!)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        getUpdate()
    }
    
    var date: Date?
    
    func getUpdate() {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "YYYY-mm-dd"
        dateFormatter.timeZone = TimeZone(abbreviation: "IDT")
        
        date = getBirthdayDate.date
        guard var date = date else { fatalError("bd date get error") }
        
        let timeInterval: TimeInterval = 10_000.0
        date.addTimeInterval(timeInterval)
        
        
        let queue = DispatchQueue.global()
        
        var weatherString: String = ""
        var fromBornToNowString: String = ""
        
        queue.async { [self] in
            weatherString = getWeatherString(date: date)
            fromBornToNowString = fromBornDateToNow(from: getBornDate(date: date))
            
            DispatchQueue.main.async {
                self.weatherLabel.text = weatherString
                self.passedLabel.text = fromBornToNowString
            }
        }
    }
}
