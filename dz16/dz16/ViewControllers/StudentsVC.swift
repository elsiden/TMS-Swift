//
//  StudentsVC.swift
//  dz16
//
//  Created by Ivan Klishevich on 05.08.2021.
//

import UIKit

enum StudentsCategory: Int {
    case excellent = 0
    case good = 1
    case troechnik = 2
    case dvoechnik = 3
}

class StudentsVC: UIViewController {
    @IBOutlet weak var tableViewStudents: UITableView!
    
    var dataSource: [Student] = []


    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableViewStudents.delegate = self
        tableViewStudents.dataSource = self
        tableViewStudents.register(UINib(nibName: "StudentsTableCell", bundle: nil), forCellReuseIdentifier: "StudentsTableCell")
        
        for _ in 0..<30 {
            dataSource.append(Student(fullName: "student \(Int.random(in: 0..<10))\(Int.random(in: 0..<10))", avgMark: Float.random(in: 0...5)))
        }
        dataSource = dataSource.sorted { $0.fullName.lowercased() < $1.fullName.lowercased() }
    }
}

extension StudentsVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let sect = StudentsCategory(rawValue: section) else { return 0 }
        switch sect {
        case .excellent: return dataSource.filter { $0.avgMark > 4 }.count
        case .good: return dataSource.filter { $0.avgMark > 3 && $0.avgMark <= 4 }.count
        case .troechnik: return dataSource.filter { $0.avgMark > 2 && $0.avgMark <= 3 }.count
        case .dvoechnik: return dataSource.filter { $0.avgMark < 2 }.count
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        guard let sect = StudentsCategory(rawValue: section) else { return "Unknown group"}
        switch sect {
        case .excellent: return "Excellent student(s)"
        case .good: return "Good student(s)"
        case .troechnik: return "Troechnik student(s)"
        case .dvoechnik: return "Dvoechnik student(s)"
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableViewStudents.dequeueReusableCell(withIdentifier: "StudentsTableCell") as? StudentsTableCell, let sect = StudentsCategory(rawValue: indexPath.section) else {
            return UITableViewCell()
        }
        switch sect {
        case .excellent: cell.setData(with: (dataSource.filter { $0.avgMark > 4 })[indexPath.row])
        case .good: cell.setData(with: (dataSource.filter { $0.avgMark > 3 && $0.avgMark <= 4 })[indexPath.row])
        case .troechnik: cell.setData(with: (dataSource.filter { $0.avgMark > 2 && $0.avgMark <= 3 })[indexPath.row])
        case .dvoechnik: cell.setData(with: (dataSource.filter { $0.avgMark < 2 })[indexPath.row])
        }
        if Float(cell.avgMarkLabel.text ?? "0") ?? 0 <= 2.5 {
            cell.contentView.backgroundColor = .red
        }
        return cell
    }
}

extension StudentsVC: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableViewStudents.deselectRow(at: indexPath, animated: true)
    }
}
