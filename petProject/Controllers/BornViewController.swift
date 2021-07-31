//
//  BornViewController.swift
//  petProject
//
//  Created by Vlad Kozlov on 29.7.2021.
//

import UIKit
import RealmSwift

class BornTableViewCell: UITableViewCell {
    @IBOutlet weak var yearLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
}



class BornViewController: UIViewController {
    
    @IBAction func refreshButton(_ sender: Any) {
        bornTableView.reloadData()
    }
    
    @IBOutlet weak var bornTableView: UITableView!
    let cellID = "cellID"
    
    var model: wikiObject?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        getWiki()
        
        bornTableView.register(BornTableViewCell.self, forCellReuseIdentifier: cellID)
    }
    
    func getWiki() {
        NetworkManager.shared.getWikiBD(month: 4, day: 30) { [self] object in
            if let obj = object {
                model = obj
                bornTableView.reloadData()
            } else {
                print("ERROR")
            }
        }
    }
}

extension BornViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let count = model?.births?.count {
            print(count)
            return count
        } else {
            return 0
        }
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellID, for: indexPath) as! BornTableViewCell
        
        if let births = model?.births {
            let person = births[indexPath.item]
            print(person.year!)
            
            if let year = person.year {
                cell.yearLabel.text = year
            }
            
            
            return cell
        } else { return cell }
        
    }
}
