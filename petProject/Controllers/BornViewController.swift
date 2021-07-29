//
//  BornViewController.swift
//  petProject
//
//  Created by Vlad Kozlov on 29.7.2021.
//

import UIKit

class BornViewController: UITableViewController {
    
    let cellID = "cellID"    
    @IBOutlet var bornTableView: UITableView!
    
    var model: apiObject?
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        getWiki()
        
        bornTableView.register(UINib(nibName: "BornCell", bundle: nil), forCellReuseIdentifier: "cellID")
    }
    
    func getWiki() {
        NetworkManager.shared.getWikiBD(month: 3, day: 28) { [weak self] object in
            self!.model = object
            self!.bornTableView.reloadData()
        }
    }
}

extension BornViewController {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return model?.births?.count ?? 0
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellID", for: indexPath) as! BornCell
        guard let births = model?.births else { return cell }
        let person = births[indexPath.item]
        cell.setYear(person: person)
        cell.setDesc(person: person)
        return cell
    }
}
