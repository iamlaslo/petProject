//
//  BornCell.swift
//  petProject
//
//  Created by Vlad Kozlov on 30.7.2021.
//

import UIKit

class BornCell: UITableViewCell {
    @IBOutlet weak var yearLabel: UILabel!
    @IBOutlet weak var descLabel: UILabel!
    
    
    func setYear(person: Births) {
        yearLabel.text = person.year
    }
    
    func setDesc(person: Births) {
        descLabel.text = person.description
    }
}
