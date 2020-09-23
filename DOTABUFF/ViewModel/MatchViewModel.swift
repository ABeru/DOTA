//
//  MatchViewModel.swift
//  DOTABUFF
//
//  Created by Sandro Beruashvili on 9/22/20.
//  Copyright © 2020 Sandro Beruashvili. All rights reserved.
//

import Foundation
class MatchViewModel {
    
    public var fetch = { (id: Int, completion: @escaping (MatchResp) -> ()) in
        let service = APIservices()
        service.fetchGame(id: id) { response in
            completion(response)
        }
    }
}
