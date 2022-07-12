//
//  MoviesCell.swift
//  Task_15_elizbar
//
//  Created by alta on 7/12/22.
//

import UIKit

class MoviesCell: UITableViewCell {

    @IBOutlet weak var seenButton: UIButton!
    @IBOutlet weak var imdbLbl: UILabel!
    @IBOutlet weak var titleLbl: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    @IBAction func seenBtn(_ sender: Any) {
    }
    
}
