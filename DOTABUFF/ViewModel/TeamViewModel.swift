//
//  TeamViewModel.swift
//  DOTABUFF
//
//  Created by Sandro Beruashvili on 9/23/20.
//  Copyright © 2020 Sandro Beruashvili. All rights reserved.
//

import Foundation
class TeamViewModel {
    
    public var fetch = { (teamid: Int, completion: @escaping (TeamResp) -> ()) in
        let service = APIservices()
        service.fetchTeam(teamid: teamid) { response in
            completion(response)
        }
    }
    
}
