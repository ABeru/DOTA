//
//  Model.swift
//  DOTABUFF
//
//  Created by Sandro Beruashvili on 9/22/20.
//  Copyright © 2020 Sandro Beruashvili. All rights reserved.
//

import Foundation

struct MatchResp: Codable {
    let direScore: Int
    let duration, firstBloodTime, gameMode: Int
    let radiantScore: Int
    let radiantWin: Bool
    let radiantTeam, direTeam: Team
    enum CodingKeys: String, CodingKey {
        case direScore = "dire_score"
        case duration
        case firstBloodTime = "first_blood_time"
        case gameMode = "game_mode"
        case radiantScore = "radiant_score"
        case radiantWin = "radiant_win"
        case radiantTeam = "radiant_team"
        case direTeam = "dire_team"
    }
}
struct Team: Codable {
    let teamID: Int
    let name, tag: String
    let logoURL: String

    enum CodingKeys: String, CodingKey {
        case teamID = "team_id"
        case name, tag
        case logoURL = "logo_url"
    }
}
struct TeamResp: Codable {
    let teamID: Int
    let rating: Double
    let wins, losses, lastMatchTime: Int
    let name, tag: String
    let logoURL: String

    enum CodingKeys: String, CodingKey {
        case teamID = "team_id"
        case rating, wins, losses
        case lastMatchTime = "last_match_time"
        case name, tag
        case logoURL = "logo_url"
    }
}
