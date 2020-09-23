//
//  APIServices.swift
//  DOTABUFF
//
//  Created by Sandro Beruashvili on 9/22/20.
//  Copyright © 2020 Sandro Beruashvili. All rights reserved.
//

import Foundation
class APIservices {
    func fetchGame(id: Int, completion: @escaping (MatchResp) -> ()) {
    guard let url = URL(string: "https://api.opendota.com/api//matches/\(id)") else {return}
    
    URLSession.shared.dataTask(with: url) { (data, res, err) in
        
        guard let data = data else {return}
        
        do {
            let decoder = JSONDecoder()
            let response = try decoder.decode(MatchResp.self, from: data)
            print(response)
            completion(response)
        } catch let err {
        debugPrint(err)
        }
    }.resume()
}
      func fetchTeam(teamid: Int, completion: @escaping (TeamResp) -> ()) {
        guard let url = URL(string: "https://api.opendota.com/api//teams/\(teamid)") else {return}
        
        URLSession.shared.dataTask(with: url) { (data, res, err) in
            
            guard let data = data else {return}
            
            do {
                let decoder = JSONDecoder()
                let response = try decoder.decode(TeamResp.self, from: data)
                print(response)
                completion(response)
            } catch let err {
            debugPrint(err)
            }
        }.resume()
    }}
