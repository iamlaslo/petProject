//
//  BornViewController.swift
//  petProject
//
//  Created by Vlad Kozlov on 29.7.2021.
//

import UIKit
import SafariServices

class BornViewController: UIViewController {
    
    @IBOutlet weak var bornTableView: UITableView!
    let cellID = "cellID"
    
    var model: wikiObject?
    
    var bornDate: Date
    
    init?(coder: NSCoder, bornDate: Date) {
        self.bornDate = bornDate
        super.init(coder: coder)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let monthDataSource: Int? = nil
    let dayDataSource: Int? = nil
    
    @IBOutlet weak var loadingView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let queue = DispatchQueue.global(qos: .utility)
        queue.async { [self] in
            getWiki()
        }
        
        bornTableView.register(BornTableViewCell.self, forCellReuseIdentifier: cellID)
        
        debugPrint()
    }
    
    
    func formatDate() -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "M/d"
        debugPrint(formatter.string(from: bornDate), "wikidb")
        return formatter.string(from: bornDate)
    }
    
    func getWiki() {
        NetworkManager.shared.getWikiBD(bornDate: formatDate()) { [self] object in
            if let obj = object {
                self.loadingView.isHidden = true
                model = obj
                bornTableView.reloadData()
                
            } else {
                print("ERROR in getting Wiki Data")
            }
        }
    }
    
    func openWikiLink(link: URL) {
        let safariVC = SFSafariViewController(url: link)
        present(safariVC, animated: true)
    }
}


// MARK: -BornViewController: UITableViewDataSource
extension BornViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let count = model?.births?.count {
            return count
        } else {
            return 0
        }
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "myCell", for: indexPath) as! BornTableViewCell
        
        if let births = model?.births {
            let person = births[indexPath.item]
            if let year = person.year {
                cell.yearLabel?.text = year
            }
            if let description = person.description {
                cell.descriptionLabel?.text = description
            }
        }
        
        return cell
    }
}


// MARK: -BornViewController: UITableViewDelegate
extension BornViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        var link: String?
        
        if let births = model?.births {
            let person = births[indexPath.item]
            let wiki = person.wikipedia!
            for item in wiki {
                link = item.link!
            }
        }
        
        let linkToOpen = URL(string: link!)
        openWikiLink(link: linkToOpen!)
    }
}
