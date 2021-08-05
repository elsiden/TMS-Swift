//
//  RGBoneVC.swift
//  dz16
//
//  Created by Ivan Klishevich on 05.08.2021.
//

import UIKit

class RGBoneVC: UIViewController {

    @IBOutlet weak var rgbTableView: UITableView!
    
    typealias RGBAlias = (color: UIColor, colorName: String)
//    var rgbArray: [RGBAlias] = []
    var rgbArray: [UIColor] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        rgbTableView.dataSource = self
        rgbTableView.delegate = self
        rgbTableView.register(UINib(nibName: "RGBTableViewCell", bundle: nil), forCellReuseIdentifier: "RGBTableViewCell")
        
        for _ in 0..<200 {
            rgbArray.append(UIColor(red: .random(in: 0...255) / 255, green: .random(in: 0...255) / 255, blue: .random(in: 0...255) / 255, alpha: 1))
//            let red = Int.random(in: 0...255)
//            let green = Int.random(in: 0...255)
//            let blue = Int.random(in: 0...255)
//            let randomRGB = UIColor(red: CGFloat(red / 255), green: CGFloat(green / 255), blue: CGFloat(blue / 255), alpha: 1)
//            rgbArray.append((randomRGB, "RGB (\(red), \(green), \(blue))"))
            
        }
    }
}

extension RGBoneVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return rgbArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = rgbTableView.dequeueReusableCell(withIdentifier: "RGBTableViewCell") as? RGBTableViewCell else {
            return UITableViewCell()
        }
        
        let myColor = rgbArray[indexPath.row]
        let myColorComponents = myColor.components
        let rgbString = "RGB (\(Int(myColorComponents.red * 255.0)), \(Int(myColorComponents.green * 255.0)), \(Int(myColorComponents.blue * 255.0)))"
        cell.rgbLabel.attributedText = NSAttributedString(string: rgbString, attributes: [.foregroundColor: myColor])
        
//        cell.rgbLabel.attributedText = NSAttributedString(string: rgbArray[indexPath.row].colorName, attributes: [.foregroundColor: rgbArray[indexPath.row].color])
        
        return cell
    }

}

extension RGBoneVC: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        rgbTableView.deselectRow(at: indexPath, animated: true)
    }
}
