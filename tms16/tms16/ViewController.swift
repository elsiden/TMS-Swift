//
//  ViewController.swift
//  tms16
//
//  Created by Ivan Klishevich on 04.08.2021.
//


import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    var dataSource: [User] = [
        User(name: "@Ivan", avatar: #imageLiteral(resourceName: "avatar"), content: #imageLiteral(resourceName: "content")),
        User(name: "@Andrey", avatar: #imageLiteral(resourceName: "avatar1"), content: #imageLiteral(resourceName: "content1")),
        User(name: "@Max", avatar: #imageLiteral(resourceName: "avatar2"), content: #imageLiteral(resourceName: "content2")),
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
         
//        let indexPath = IndexPath(row: 0, section: 0)
//        indexPath.row -> 0
//        indexPath.section -> 0
        
        tableView.dataSource = self // для обработки table view
        tableView.delegate = self
        tableView.tableFooterView = UIView()
//        tableView.register(UINib(nibName: "TableViewCell", bundle: nil), forCellReuseIdentifier: "TableViewCell")
        tableView.register(UINib(nibName: "InstTableViewCell", bundle: nil), forCellReuseIdentifier: "InstTableViewCell")
    }
}

//   =================== PART 2 ===================

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "InstTableViewCell") as? InstTableViewCell else {
            return UITableViewCell()
        }
        cell.setData(with: dataSource[indexPath.row])
        return cell
     }
}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}


//   =================== PART 1 ===================

//extension ViewController: UITableViewDataSource {
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        switch section {
//        case 0: return 10
//        case 1: return 4
//        default: return 0
//        }
//    }
//
//    func numberOfSections(in tableView: UITableView) -> Int {
//        return 2
//    }
//
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//         guard let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell") as? TableViewCell else {
//            return UITableViewCell()
//        }
//
//        cell.contentView.backgroundColor = .red
//        cell.selectionStyle = .none
//        cell.label_.text = "\(indexPath.section) - \(indexPath.row)"
//        return cell
//     }
//
//    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
//        return "SECTION \(section)"
//    }
//}
//
//extension ViewController: UITableViewDelegate {
//    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        if indexPath.row == 10 {
//            return 200
//        }
//        return 44
//    }
//
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        print("\(indexPath.section) - \(indexPath.row)")
//        tableView.deselectRow(at: indexPath, animated: true)
//    }
//}
