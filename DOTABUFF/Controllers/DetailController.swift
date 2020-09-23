//
//  DetailController.swift
//  DOTABUFF
//
//  Created by Sandro Beruashvili on 9/22/20.
//  Copyright © 2020 Sandro Beruashvili. All rights reserved.
//

import UIKit

class DetailController: UIViewController {
    @IBOutlet weak var team1: UIImageView!
    @IBOutlet weak var team2: UIImageView!
    @IBOutlet weak var team1N: UILabel!
    @IBOutlet weak var team2N: UILabel!
    @IBOutlet weak var gameScore: UILabel!
    @IBOutlet weak var duration: UILabel!
    @IBOutlet weak var mode: UILabel!
    @IBOutlet weak var side: UILabel!
    @IBOutlet weak var fbtime: UILabel!
    @IBOutlet weak var backView: UIView!
    var id = 0
    var team1Id = 0
    var team2Id = 0
    @IBOutlet weak var labeltest: UILabel!
    let apiServices = APIservices()
    var selectedTeam = 0
    let matchViewModel = MatchViewModel()
    override func viewDidLoad() {
        super.viewDidLoad()
        print(id)
        matchViewModel.fetch(id) { game1 in
            DispatchQueue.main.async {
                self.team1N.text = game1.radiantTeam.name
                self.team2N.text = game1.direTeam.name
                var durstr = String(game1.duration)
                durstr.insert(":", at: durstr.index(durstr.startIndex, offsetBy: 2))
                self.duration.text = durstr
                var fbstr = String(game1.firstBloodTime)
                fbstr.insert(":", at: fbstr.index(fbstr.startIndex, offsetBy: 1))
                self.fbtime.text = fbstr
                self.gameScore.text = "\(game1.radiantScore)-\(game1.direScore)"
                self.mode.text = "Captains Mode"
                self.team1Id = game1.radiantTeam.teamID
                self.team2Id = game1.direTeam.teamID
                if game1.radiantWin == true {
                    self.side.text = "Radiant"
                    self.team1N.textColor = .green
                    self.team2N.textColor = .red
                }
                else {
                    self.side.text = "Dire"
                    self.team1N.textColor = .red
                    self.team2N.textColor = .green
                }
                game1.radiantTeam.logoURL.downloadImage1 { (image) in
                           DispatchQueue.main.async {
                            self.team1.image = image
                           }}
                 game1.direTeam.logoURL.downloadImage1 { (image) in
                                          DispatchQueue.main.async {
                                           self.team2.image = image
                                          }}
                
            }
           }
        
        team1N.layer.shadowColor = UIColor.white.cgColor
              team1N.layer.shadowOpacity = 1
              team1N.layer.shadowOffset = .zero
              team1N.layer.shadowRadius = 10
        team2N.layer.shadowColor = UIColor.white.cgColor
        team2N.layer.shadowOpacity = 1
        team2N.layer.shadowOffset = .zero
        team2N.layer.shadowRadius = 10
        backView.layer.cornerRadius = 20
        backView.layer.borderColor = UIColor.white.cgColor
        backView.layer.borderWidth = 2
        backView.layer.shadowOpacity = 1
        backView.layer.shadowOffset = .zero
        backView.layer.shadowRadius = 10
        labeltest.text = "\(id)"
        
      
        
    }
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
                  if let teamVC = segue.destination as? TeamController{
                    teamVC.modalPresentationStyle = .fullScreen
                    if selectedTeam == 1 {
                        teamVC.teamid = self.team1Id
                    }
                    else {
                        teamVC.teamid = self.team2Id
                    }
                  }
    
              }
    @IBAction func backOn(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func team2(_ sender: UIButton) {
        selectedTeam = 2
              
        performSegue(withIdentifier: "team", sender: nil)
    }
    @IBAction func team1(_ sender: UIButton) {
        selectedTeam = 1
        performSegue(withIdentifier: "team", sender: nil)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
extension String {
      func downloadImage1(completion: @escaping (UIImage?) -> ()) {
              guard let url = URL(string: self) else {return}
              URLSession.shared.dataTask(with: url) { (data, res, err) in
                  guard let data = data else {return}
                  completion(UIImage(data: data))
              }.resume()
          }
    
}
