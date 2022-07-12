//
//  FilmCell.swift
//  Task_15_elizbar
//
//  Created by alta on 7/12/22.
//

import UIKit
protocol filmseenDelegate {
    func seenButtonClicked(cell: FilmCell)
}
class FilmCell: UITableViewCell {

    @IBOutlet weak var seenBtn: UIButton!
    @IBOutlet weak var imdbLbl: UILabel!
    @IBOutlet weak var titleLbl: UILabel!
    var delegate : filmseenDelegate!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    @IBAction func filmSeen(_ sender: Any) {
        delegate.seenButtonClicked(cell: self)
    }
    
}
