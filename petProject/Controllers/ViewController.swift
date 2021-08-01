//
//  ViewController.swift
//  petProject
//
//  Created by Vlad Kozlov on 22.7.2021.
//

import UIKit

class ViewController: UIViewController {
    
    //MARK: -birthdate picker
    @IBOutlet weak public var getBirthdayDate: UIDatePicker!
    @IBAction func getBirthday(_ sender: UIDatePicker) {
        updateUI()
    }
    
    
    //MARK: -Zodiac sign and horoscope
    public let signObject = SignModel()
    public let horoscopeObject = HoroscopeModel()
    
    @IBAction func horoscopeClicked(_ sender: UIButton) {
        showHoroscope()
    }
    
    func showHoroscope() {
        let alert = UIAlertController()
        alert.title = "Horoscope for \(RealmManager.shared.readSign())"
        alert.message = RealmManager.shared.readHoroscope()
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
    
    //MARK: -labels
    @IBOutlet weak var weatherLabel: UILabel!
    @IBOutlet weak var passedLabel: UILabel!
    @IBOutlet weak var signLabel: UILabel!
    
    
    //MARK: -segues
    @IBSegueAction func passDate(_ coder: NSCoder, sender: Any?) -> BornViewController? {
        return BornViewController(coder: coder, bornDate: date!)
    }
    
    
    //MARK: -viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateUI()
    }
    
    
    //MARK: -update UI
    var date: Date?
    
    func updateUI() {
        
        // Initializing birth date
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "YYYY-mm-dd"
        dateFormatter.timeZone = TimeZone(abbreviation: "IDT")
        date = getBirthdayDate.date
        guard var date = date else { fatalError("bd date get error") }
        // Shows wrong date (about 2 hours before right date), maybe could be fixed by right time zone
        let timeInterval: TimeInterval = 10_000.0
        date.addTimeInterval(timeInterval)
        
        
        var weatherString: String = ""
        var fromBornToNowString: String = ""
        var signString: String = ""
        signString = RealmManager.shared.readSign()
        
        let queue = DispatchQueue.global()
        queue.async { [self] in
            
            getZodiacSign(date: date, signObject: signObject) { flag in
                if flag == true {
                    signString = signObject.sign
                    DispatchQueue.main.async {
                        signLabel.text = signString
                    }
                    getHoroscope(sign: self.signObject.sign, horoscopeObject: horoscopeObject)
                } else {
                    debugPrint("I wanna sleep")
                }
            }
            
            weatherString = getWeatherString(date: date)
            fromBornToNowString = fromBornDateToNow(from: formatBornDate(date: date))
            
            DispatchQueue.main.async {
                weatherLabel.text = weatherString
                passedLabel.text = fromBornToNowString
                signLabel.text = signString
            }
        }
    }
}
