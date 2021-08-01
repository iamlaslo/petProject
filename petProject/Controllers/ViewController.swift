//
//  ViewController.swift
//  petProject
//
//  Created by Vlad Kozlov on 22.7.2021.
//

import UIKit
import AwaitKit
import RealmSwift

class ViewController: UIViewController {
    
    @IBOutlet weak public var getBirthdayDate: UIDatePicker!
    @IBAction func getBirthday(_ sender: UIDatePicker) {
        getUpdate()
    }
    
    let signObject = SignModel()
    
    
    
    @IBAction func horoscopeClicked(_ sender: UIButton) {
    }
    
    func showHoroscope() {
        let alert = UIAlertController()
        alert.title = "Your horoscope"
//        TODO: here
//        alert.message =
    }
    
    
    @IBOutlet weak var weatherLabel: UILabel!
    @IBOutlet weak var passedLabel: UILabel!
    @IBOutlet weak var signLabel: UILabel!
    
    
    @IBSegueAction func passDate(_ coder: NSCoder, sender: Any?) -> BornViewController? {
        return BornViewController(coder: coder, bornDate: date!)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        getUpdate()
    }
    
    
    
    func zodiacHoroscope() {
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "YYYY-mm-dd"
        dateFormatter.timeZone = TimeZone(abbreviation: "IDT")
        date = getBirthdayDate.date
        guard var date = date else { fatalError("bd date get error") }
        let timeInterval: TimeInterval = 10_000.0
        date.addTimeInterval(timeInterval)
        
        
        
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
        var signString: String = ""
        signString = RealmManager.shared.readSign()
        debugPrint(signString, "sign")
        
        queue.async { [self] in
            
            getZodiacSign(date: date, object: signObject) { flag in
                if flag == true {
                    signString = signObject.sign
                    DispatchQueue.main.async {
                        signLabel.text = signString
                    }
                    getHoroscope(sign: self.signObject.sign)
                } else {
                    debugPrint("I wanna sleep")
                }
            }
            
            weatherString = getWeatherString(date: date)
            fromBornToNowString = fromBornDateToNow(from: getBornDate(date: date))
            
            
            
            DispatchQueue.main.async {
                weatherLabel.text = weatherString
                passedLabel.text = fromBornToNowString
                signLabel.text = signString
            }
        }
    }
}
