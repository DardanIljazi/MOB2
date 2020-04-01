//
//  UserSession.swift
//  Quiz
//
//  Created by cpnv on 01.04.20.
//  Copyright © 2020 Pascal Hurni. All rights reserved.
//

import Foundation

class UserSession {
    var _username: String
    var _score : Int
    
    var score: Int {
        get { return _score }
    }
    
    var username: String {
        get { return _username }
    }
    
    init(username: String) {
        _username = username
        _score = 0
    }
}
