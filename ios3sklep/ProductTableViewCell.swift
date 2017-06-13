//
//  ProductTableViewCell.swift
//  ios3sklep
//
//  Created by Krzysztof Grys on 6/12/17.
//  Copyright © 2017 pl. All rights reserved.
//

import UIKit

class ProductTableViewCell: UITableViewCell {

    @IBOutlet weak var imageOfCd: UIImageView!
    @IBOutlet weak var author: UILabel!
    @IBOutlet weak var title: UILabel!

    @IBOutlet weak var price: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
