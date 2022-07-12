//
//  DetailsVC.swift
//  Task_15_elizbar
//
//  Created by alta on 7/12/22.
//

import UIKit
protocol DetailsDelegate{
    func favouriteSelected(movie : Movie)
}

class DetailsVC: UIViewController {
    @IBOutlet weak var mainTitleLbl: UILabel!
    @IBOutlet weak var ratingLbl: UILabel!
    @IBOutlet weak var roleLbl: UILabel!
    @IBOutlet weak var dateLbl: UILabel!
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var aboutLbl: UITextView!
    @IBOutlet weak var favouriteBtn: UIButton!
    
    @IBOutlet var detailsview: UIView!
    var givenMovie : Movie!
    var giventitle = ""
    var rating = ""
    var role = ""
    var date = ""
    var about = ""
    var favouriteButtonImageaddress = "heart"
    
    var delegate : DetailsDelegate!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mainTitleLbl.text = givenMovie.title
        titleLbl.text = givenMovie.title
        ratingLbl.text = "\(givenMovie.imdb)"
        roleLbl.text = givenMovie.mainActor
        dateLbl.text = givenMovie.releaseDate
        aboutLbl.text = givenMovie.description
        favouriteBtn.layer.cornerRadius = 50
        favouriteBtn.setImage(UIImage(systemName: favouriteButtonImageaddress), for: .normal)
        
        

    }
    

    @IBAction func favouriteButtonListener(_ sender: Any) {
        delegate.favouriteSelected(movie: givenMovie)
    }
    
}
