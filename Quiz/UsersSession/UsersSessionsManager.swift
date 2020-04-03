//
//  UsersSessionsManager.swift
//  Quiz
//
//  Created by cpnv on 03.04.20.
//  Copyright © 2020 Pascal Hurni. All rights reserved.
//

import Foundation

class UsersSessionsManager {
    var _userSessions: [UserSession] = []
    var _actualUserIndex: Int
    
    var userSessions: [UserSession] {
        get { return _userSessions }
    }
    
    init() {
        _actualUserIndex = 0
    }
    
    func addUserSession(userSession: UserSession) {
        _userSessions.append(userSession)
        _actualUserIndex += 1
    }
    
    func getActualUserSession() -> UserSession {
        return _userSessions[_actualUserIndex]
    }
}
