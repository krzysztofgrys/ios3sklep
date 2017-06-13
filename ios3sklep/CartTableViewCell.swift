//
//  CartTableViewCell.swift
//  ios3sklep
//
//  Created by Krzysztof Grys on 6/13/17.
//  Copyright © 2017 pl. All rights reserved.
//

import UIKit

class CartTableViewCell: UITableViewCell {

    @IBOutlet weak var price: UILabel!
    @IBOutlet weak var countOf: UILabel!
    @IBOutlet weak var stepper: UIStepper!
    @IBOutlet weak var author: UILabel!
    @IBOutlet weak var titleOf: UILabel!
    @IBOutlet weak var coverImage: UIImageView!
    
    @IBOutlet weak var stepperVal: UIStepper!
    
    @IBAction func stepperAction(_ sender: Any) {
        
         Cart.countItems.countOfItems[stepper.tag] = Int(stepper.value)
        
        print(Cart.countItems.countOfItems[stepper.tag])
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: "notificationName"), object: nil)
        
        countOf.text = String(Int(stepper.value))

    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    
    
 
}

