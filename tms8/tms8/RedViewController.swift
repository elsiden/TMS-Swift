//
//  RedViewController.swift
//  tms8
//
//  Created by Ivan Klishevich on 07.07.2021.
//

import UIKit

class RedViewController: UIViewController {
    
    override func awakeFromNib() { // самый первый при создании
        super.awakeFromNib()
        print("red awakeFromNib")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        print("red viewDidLoad")
        
    }
    
    override func viewWillAppear(_ animated: Bool) {    // перед тем как показать полностью
        super.viewWillAppear(animated)
        print("red viewWillAppear")
    }
    
    override func viewDidAppear(_ animated: Bool) {     // когда экран показан полностью
        super.viewDidAppear(animated)
        print("red viewDidAppear")
    }
    
    override func  viewWillLayoutSubviews() { // когда происходит пересчет размера экрана
        super.viewWillLayoutSubviews()
        
        print("red viewWillLayoutSubviews")
    }
    
    override func viewDidLayoutSubviews() { // когда пересчет размера экрана закончен
        super.viewDidLayoutSubviews()
        print("red viewDidLayoutSubviews")
    }
    
    override func viewWillDisappear(_ animated: Bool) { // перед скрытием экрана
        super.viewWillDisappear(animated)
        print("red viewWillDisappear")
    }
    
    override func viewDidDisappear(_ animated: Bool) { // когда экран скрыт
        super.viewDidDisappear(animated)
        print("red viewDidDisappear")
    }
    
    deinit {
        print("red deinit")
    }
    
    // ===== РЕДКО
    
    override func willTransition(to newCollection: UITraitCollection, with coordinator: UIViewControllerTransitionCoordinator) {
        print("red willTransition")
    }

}
