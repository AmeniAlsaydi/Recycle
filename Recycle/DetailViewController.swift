//
//  DetailViewController.swift
//  Recycle
//
//  Created by Amy Alsaydi on 11/24/19.
//  Copyright © 2019 Amy Alsaydi. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    @IBOutlet weak var itemName: UILabel!
    @IBOutlet weak var instructions: UILabel!
    
    var item: CommonItem?

    override func viewDidLoad() {
        super.viewDidLoad()
        loadUI()
        instructions.sizeToFit()

    }
    
    func loadUI() {
        guard let selectedItem = item else {
            fatalError("couldnt set item object, check prepare for segue")
        }
        navigationItem.title = selectedItem.itemName
        instructions.text = selectedItem.instrustions
        
    }
    

}
