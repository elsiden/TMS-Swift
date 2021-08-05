//
//  ColorsNames.swift
//  dz16
//
//  Created by Ivan Klishevich on 05.08.2021.
//

import UIKit

class ColorsNames: UIViewController {
    
    @IBOutlet weak var tableViewCN: UITableView!

    var dataSourceCN: [ColorName] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        for _ in 0..<200 {
            let red = Int.random(in: 0...255)
            let green = Int.random(in: 0...255)
            let blue = Int.random(in: 0...255)
            dataSourceCN.append(ColorName(color: UIColor(red: CGFloat(red) / 255, green: CGFloat(green) / 255, blue: CGFloat(blue) / 255, alpha: 1), colorName: "RGB (\(red), \(green), \(blue))"))
        }
        
        tableViewCN.dataSource = self
        tableViewCN.delegate = self
        tableViewCN.register(UINib(nibName: "RGBClassCell", bundle: nil), forCellReuseIdentifier: "RGBClassCell")
        
        
    }

}

extension ColorsNames: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSourceCN.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableViewCN.dequeueReusableCell(withIdentifier: "RGBClassCell") as? RGBClassCell else {
            return UITableViewCell()
        }
        cell.setRGB(with: dataSourceCN[indexPath.row])
        return cell
    }
}

extension ColorsNames: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableViewCN.deselectRow(at: indexPath, animated: true)
    }
}
