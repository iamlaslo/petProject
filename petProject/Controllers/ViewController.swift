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
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        getWikiData()
        
//        getUpdate()
    }
    
    
    
    func getUpdate() {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "YYYY-mm-dd"
        dateFormatter.timeZone = TimeZone(abbreviation: "IDT")
        
        var date = getBirthdayDate.date
        
        let timeInterval: TimeInterval = 10_000.0
        date.addTimeInterval(timeInterval)
        
        
        // TODO: MAKE ASYNC
        let queue = DispatchQueue.global()
        
        var weatherString: String = ""
        var fromBornToNowString: String = ""
        
        queue.async { //[weak self] in
            weatherString = getWeatherString(date: date)
            fromBornToNowString = fromBornDateToNow(from: getBornDate(date: date))
            
            DispatchQueue.main.async {
                self.weatherLabel.text = weatherString
                self.passedLabel.text = fromBornToNowString
            }
        }
        
        
        
    }
}
