//
//  DetailViewController.swift
//  Sandi-axaTest
//
//  Created by SANDI on 28/08/20.
//  Copyright © 2020 sample. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var bodyLabel: UILabel!
    
    var titleTemp = String()
    var bodyTemp = String()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        title = titleTemp
        titleLabel.text = titleTemp
        bodyLabel.text = bodyTemp
        titleLabel.numberOfLines = 0
        bodyLabel.numberOfLines = 0
        navigationController?.isNavigationBarHidden = false
    }

}
