//
//  UserSession.swift
//  Quiz
//
//  Created by cpnv on 03.04.20.
//  Copyright © 2020 Pascal Hurni. All rights reserved.
//

import Foundation

class UserSession {
    var _username: String
    var _score : Int
    
    var score: Int {
        get { return _score }
        set (value) { _score = value }
    }
    
    var username: String {
        get { return _username }
    }
    
    init(username: String, score: Int?) {
        _username = username
        _score = score ?? 0
    }
}
