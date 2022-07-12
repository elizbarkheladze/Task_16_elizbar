//
//  ViewController.swift
//  Task_15_elizbar
//
//  Created by alta on 7/12/22.
//
class Movie {
    let title : String
    let releaseDate: String
    let imdb: Double
    let mainActor: String
    var seen: Bool
    var isFavourite: Bool
    let description = "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum"
    
    init(title : String, releaseDate: String, imdb: Double, mainActor: String, seen: Bool, isFavourite: Bool) {
        self.title = title
        self.releaseDate = releaseDate
        self.imdb = imdb
        self.mainActor = mainActor
        self.seen = seen
        self.isFavourite = isFavourite
    }
}

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var moviesTableView: UITableView!
    
    var movies = [
        Movie(title: "Revange of the Sith", releaseDate: "2002", imdb: 9.6, mainActor: "Ewan Mcgregor", seen: false, isFavourite: true),
        Movie(title: "Empire Strikes Back", releaseDate: "1977", imdb: 9.5, mainActor: "MArk Hamill", seen: false, isFavourite: false),
        Movie(title: "New Hope", releaseDate: "1972", imdb: 9.6, mainActor: "Ewan Mcgregor", seen: false, isFavourite: false),
        Movie(title: "Mimino", releaseDate: "1985", imdb: 10.0, mainActor: "Buba KIkabidze", seen: false, isFavourite: false),
        Movie(title: "Batman Begins", releaseDate: "2004", imdb: 9.1, mainActor: "Christian Bale", seen: false, isFavourite: false),
        Movie(title: "2001: A Space Odyssey", releaseDate: "1968", imdb: 9.5, mainActor: "Keir Duella", seen: false, isFavourite: false),
        Movie(title: "Blade Runner", releaseDate: "1982", imdb: 9.6, mainActor: "Harrison Ford", seen: false, isFavourite: false),
        Movie(title: "The Shinning", releaseDate: "1980", imdb: 9.2, mainActor: "Jack Nicholson", seen: false, isFavourite: false),
        Movie(title: "Alien", releaseDate: "1979", imdb: 9.3, mainActor: "Sigourney Weaver", seen: false, isFavourite: false),
        Movie(title: "Interstellar", releaseDate: "2014", imdb: 9.8, mainActor: "Matthew McConaughey", seen: false, isFavourite: false)
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        moviesTableView.register(UINib(nibName: "FilmCell", bundle: nil), forCellReuseIdentifier: "FilmCell")
        
    }
    func sortData(sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex{
        case 0:
            movies.sort(by: {$0.isFavourite && !$1.isFavourite})
        case 1:
            movies.sort(by: {$0.imdb > $1.imdb})
        case 2:
            movies.sort(by: {$0.releaseDate > $1.releaseDate})
        default :
            print("ragac ar wavida sworad :///")
        }
        moviesTableView.reloadData()
    }
    @IBAction func segmentselectedBtn(_ sender: UISegmentedControl) {
        sortData(sender: sender)
    }
    
}

extension ViewController : UITableViewDelegate,UITableViewDataSource {


    func numberOfSections(in tableView: UITableView) -> Int {
        2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0{
            return movies.filter({$0.seen == false}).count
        } else {
            return movies.filter({$0.seen == true}).count
        }
    }
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section == 0 {
            return "New Films"
        }else {
            return "Seen Films"
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FilmCell", for: indexPath) as! FilmCell
        cell.delegate = self
        if indexPath.section == 0 {
            let givenMovie = movies.filter({$0.seen == false})[indexPath.row]
            cell.titleLbl.text = givenMovie.title
            cell.imdbLbl.text = "\(givenMovie.imdb)"
            return cell
        }else {
            let givenMovie = movies.filter({$0.seen == true})[indexPath.row]
            cell.titleLbl.text = givenMovie.title
            cell.imdbLbl.text = "\(givenMovie.imdb)"
            return cell
        }
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.section == 0 {
            let givenFilm = movies.filter({$0.seen == false})[indexPath.row]
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let vc = storyboard.instantiateViewController(withIdentifier: "DetailsVC") as? DetailsVC
            guard let vc = vc else { return }
            vc.givenMovie = givenFilm
            vc.delegate = self
            if givenFilm.isFavourite == true {
                vc.favouriteButtonImageaddress = "heart.fill"
            }
            self.navigationController?.pushViewController(vc, animated: true)
        } else {
            let givenFilm = movies.filter({$0.seen == true})[indexPath.row]
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let vc = storyboard.instantiateViewController(withIdentifier: "DetailsVC") as? DetailsVC
            guard let vc = vc else { return }
            vc.givenMovie = givenFilm
            vc.delegate = self
            if givenFilm.isFavourite == true {
                vc.favouriteButtonImageaddress = "heart.fill"
            }
            self.navigationController?.pushViewController(vc, animated: true)
        }
        
    }
        
    
}

extension ViewController : filmseenDelegate, DetailsDelegate {
    func favouriteSelected(movie: Movie) {
        if movies[movies.firstIndex(where: {$0.title == movie.title})!].isFavourite == true{
            movies[movies.firstIndex(where: {$0.title == movie.title})!].isFavourite = false
        } else {
            movies[movies.firstIndex(where: {$0.title == movie.title})!].isFavourite = true
        }
        
    }
    
    func seenButtonClicked(cell: FilmCell) {
        
        if let indexpath = moviesTableView.indexPath(for: cell){
            if indexpath.section == 0 {
                if !movies.filter({$0.seen == false}).isEmpty{
                    let givenFilm = movies.filter({$0.seen == false})[indexpath.row]
                    givenFilm.seen = true
                    cell.seenBtn.setImage(UIImage(systemName: "eye.slash"), for: .normal)
                    moviesTableView.reloadData()
                }
            } else {
                if !movies.filter({$0.seen == true}).isEmpty {
                    let givenFilm = movies.filter({$0.seen == true})[indexpath.row]
                    givenFilm.seen = false
                    cell.seenBtn.setImage(UIImage(systemName: "eye"), for: .normal)
                    moviesTableView.reloadData()
                }
            }
        }
        }
}
