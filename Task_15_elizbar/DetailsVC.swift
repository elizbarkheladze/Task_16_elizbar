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

    var favouriteButtonImageaddress = "heart"
    
    var givenMovies = [Movie]()
    
    var delegate : DetailsDelegate!
    
    @IBOutlet weak var suggestedCollectionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        changeDesign(item: givenMovie)
        favouriteBtn.layer.cornerRadius = 50
        favouriteBtn.setImage(UIImage(systemName: favouriteButtonImageaddress), for: .normal)
        
        suggestedCollectionView.register(UINib(nibName: "CustomColCell", bundle: nil), forCellWithReuseIdentifier: "CustomColCell")

    }


    @IBAction func favouriteButtonListener(_ sender: Any) {
        delegate.favouriteSelected(movie: givenMovie)
    }
    func changeDesign(item : Movie){
        mainTitleLbl.text = item.title
        titleLbl.text = item.title
        ratingLbl.text = "\(item.imdb)"
        roleLbl.text = item.mainActor
        dateLbl.text = item.releaseDate
        aboutLbl.text = item.description
    }
    
}
extension DetailsVC : UICollectionViewDataSource,UICollectionViewDelegate{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        givenMovies.filter{$0.genre == givenMovie.genre}.count - 1
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CustomColCell", for: indexPath) as! CustomColCell
        let movie = givenMovies.filter({$0.genre == givenMovie.genre && $0.title != givenMovie.title})[indexPath.row]
        cell.genreLbl.text = movie.title
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let resutlMovie = givenMovies.filter({$0.genre == givenMovie.genre && $0.title != givenMovie.title})[indexPath.row]
        givenMovie = resutlMovie
        changeDesign(item: resutlMovie)
        suggestedCollectionView.reloadData()
        
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: 100, height: 150)
    }
}

