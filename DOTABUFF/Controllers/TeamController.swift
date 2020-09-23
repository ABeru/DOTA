//
//  TeamController.swift
//  DOTABUFF
//
//  Created by Sandro Beruashvili on 9/23/20.
//  Copyright © 2020 Sandro Beruashvili. All rights reserved.
//

import UIKit

class TeamController: UIViewController {
    
    @IBOutlet weak var teamsId: UILabel!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var tTag: UILabel!
    @IBOutlet weak var tRate: UILabel!
    @IBOutlet weak var tWins: UILabel!
    @IBOutlet weak var tLosses: UILabel!
    @IBOutlet weak var tLm: UILabel!
    @IBOutlet weak var teamImg: UIImageView!
    var teamid = 0
    let teamViewModel = TeamViewModel()
    override func viewDidLoad() {
        super.viewDidLoad()
        teamViewModel.fetch(teamid) { team in
        DispatchQueue.main.async {
            self.name.text = team.name
            self.teamsId.text = "\(team.teamID)"
            self.tTag.text = team.tag
            self.tLm.text = "\(team.lastMatchTime)"
            self.tRate.text = "\(team.rating)"
            self.tLosses.text = "\(team.losses)"
            self.tWins.text = "\(team.wins)"
               team.logoURL.downloadImage2 { (image) in
                                    DispatchQueue.main.async {
                                     self.teamImg.image = image
                                    }}
    }
    
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
    @IBAction func backon(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
}
extension String {
      func downloadImage2(completion: @escaping (UIImage?) -> ()) {
              guard let url = URL(string: self) else {return}
              URLSession.shared.dataTask(with: url) { (data, res, err) in
                  guard let data = data else {return}
                  completion(UIImage(data: data))
              }.resume()
          }
    
}
