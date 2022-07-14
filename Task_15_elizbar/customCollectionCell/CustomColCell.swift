//
//  CustomColCell.swift
//  Task_15_elizbar
//
//  Created by alta on 7/14/22.
//

import UIKit

class CustomColCell: UICollectionViewCell {

    @IBOutlet weak var backView: UIView!
    @IBOutlet weak var genreLbl: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        backView.layer.cornerRadius = 50
        
    }

}
