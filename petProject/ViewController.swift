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
        reloadInfo()
    }
    
    
    
    @IBOutlet weak var weatherLabel: UILabel!
    @IBOutlet weak var passedLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        reloadInfo()
    }
    
    
    
    func reloadInfo() {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "YYYY-mm-dd"
        
        let date = getBirthdayDate.date
        
        // TODO: MAKE ASYNC
        weatherLabel.text = getWeatherString(date: date)
        passedLabel.text = fromBornDateToNow(from: getBornDate(date: date))
    }
}
