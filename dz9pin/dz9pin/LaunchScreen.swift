//
//  LaunchScreen.swift
//  dz9pin
//
//  Created by Ivan Klishevich on 13.07.2021.
//

import UIKit

class LaunchScreen: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let label1 = UILabel(frame: CGRect(x: 100, y: 200, width: 200, height: 100))
        label1.text = "Hello"
        view.addSubview(label1)
        
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
