//
//  ViewController.swift
//  DOTABUFF
//
//  Created by Sandro Beruashvili on 9/21/20.
//  Copyright © 2020 Sandro Beruashvili. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var someTable: UITableView!
    var selectedItem = 0
    let games: [(String,String,Int,Int,Int,Int,Int)] = [("og","lq",4,4986133311,4986260666,4986362254,4986461644),
                          ("psg","liquid",3,4985705053,4985787596,4985891168,0),
                          ("og","psg",3,4983628610,4983729131,4983800597,0),
    ("lq","sc",2,4983935086,4984038549,0,0),
("og","eg",3,4980773381,4980888053,4981028582,0)]
    override func viewDidLoad() {
        super.viewDidLoad()
        
        someTable.delegate = self
        someTable.dataSource = self
        
        
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
          if let ImageVC = segue.destination as? DetailController{
            ImageVC.id = selectedItem
            ImageVC.modalPresentationStyle = .fullScreen
          }
      }
}
extension ViewController: UITableViewDelegate {
    }
extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return games.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "game_cell", for: indexPath) as! GameCell
        cell.team1.image = UIImage(named: games[indexPath.row].0)
        cell.team2.image = UIImage(named: games[indexPath.row].1)
        cell.best1.text = "Best Of \(games[indexPath.row].2)"
        cell.best.text = "\(games[indexPath.row].1)-\(games[indexPath.row].0)"
        print(games[indexPath.row].2)
        if games[indexPath.row].2 == 4 {
            cell.label3.text = "Game 3"
            cell.label2.text = "Game 2"
            cell.label1.text = "Game 1"
            cell.label4.text = "Game 4"
            cell.label1.layer.cornerRadius = 20
            cell.label1.layer.backgroundColor = UIColor.orange.cgColor
            cell.label2.layer.cornerRadius = 20
            cell.label2.layer.backgroundColor = UIColor.systemPink.cgColor
            cell.label3.layer.cornerRadius = 20
            cell.label3.layer.backgroundColor = UIColor.systemBlue.cgColor
            cell.label4.layer.cornerRadius = 20
            cell.label4.layer.backgroundColor = UIColor.red.cgColor
        }
        if games[indexPath.row].2 == 3 {
             cell.label3.text = "Game 3"
            cell.label2.text = "Game 2"
            cell.label1.text = "Game 1"
            cell.label4.text = .none
               cell.label1.layer.cornerRadius = 20
                     cell.label1.layer.backgroundColor = UIColor.orange.cgColor
                     cell.label2.layer.cornerRadius = 20
                     cell.label2.layer.backgroundColor = UIColor.systemPink.cgColor
                     cell.label3.layer.cornerRadius = 20
                     cell.label3.layer.backgroundColor = UIColor.systemBlue.cgColor
        }
        if games[indexPath.row].2 == 2 {
            cell.label3.text = .none
                       cell.label2.text = "Game 2"
                       cell.label1.text = "Game 1"
            cell.label4.text = .none
               cell.label1.layer.cornerRadius = 20
                     cell.label1.layer.backgroundColor = UIColor.orange.cgColor
                     cell.label2.layer.cornerRadius = 20
                     cell.label2.layer.backgroundColor = UIColor.systemPink.cgColor
     }
        cell.didTapGame1 = { [weak self] in
            self?.selectedItem = self!.games[indexPath.row].3
            self?.performSegue(withIdentifier: "nextgo", sender: self)
        }
        cell.didTapGame2 = { [weak self] in
            self?.selectedItem = self!.games[indexPath.row].4
            self?.performSegue(withIdentifier: "nextgo", sender: self)
        }
        cell.didTapGame3 = { [weak self] in
            self?.selectedItem = self!.games[indexPath.row].5
            self?.performSegue(withIdentifier: "nextgo", sender: self)
        }
        cell.didTapGame4 = { [weak self] in
            self?.selectedItem = self!.games[indexPath.row].6
            self?.performSegue(withIdentifier: "nextgo", sender: self)
        }
        return cell
    }
    
    
}
extension String {
      func downloadImage(completion: @escaping (UIImage?) -> ()) {
              guard let url = URL(string: self) else {return}
              URLSession.shared.dataTask(with: url) { (data, res, err) in
                  guard let data = data else {return}
                  completion(UIImage(data: data))
              }.resume()
          }
    
}
