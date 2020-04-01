//
//  QuizSession.swift
//  Quiz
//
//  Created by Pascal Hurni on 17.02.16.
//  Copyright (c) 2016 Pascal Hurni. All rights reserved.
//

import Foundation

class QuizSession {
    // Because swift has no `protected` access control, we fall back
    // on internal with an ugly underscore prefix, so that code with
    // an explicit receiver looks ugly and should be prevented.
    // (see https://medium.com/ios-os-x-development/swift-needs-protected-access-level-b966001a1d08 )
    
    let _questionRepository: QuestionRepository
    var _currentQuestion: Question!
    var _totalQuestionCount: Int
    var _userSession: UserSession
    
    // Public interface to get the score, as a property
    var score: Int {
        get { return _userSession.score }
        set (value) { _userSession.score = value }
    }
    
    var _score: Int {
        get { return score }
        set (value) { score = value }
    }
    
    var userSession: UserSession {
        get { return _userSession }
    }

    // Public interface to get the total question count
    var questionsCount: Int {
        get { return _totalQuestionCount }
    }

    init(questionRepository: QuestionRepository, totalQuestionCount: Int) {
        _questionRepository = questionRepository
        _totalQuestionCount = totalQuestionCount
        _userSession = UserSession(username: "")
    }
    
    init(questionRepository: QuestionRepository, totalQuestionCount: Int, userSession: UserSession) {
        _questionRepository = questionRepository
        _totalQuestionCount = totalQuestionCount
        _userSession = userSession
    }
    
    func nextQuestion() -> Question? {
        _currentQuestion = _questionRepository.fetchQuestion()
        return _currentQuestion
    }
    
    func checkAnswer(_ answer: String) -> Bool {
        return _currentQuestion.isCorrectAnswer(answer)
    }

    // For time based sessions, call it once per second and pass to the next question if true is returned
    func tickAndShouldPassToNextQuestion() -> Bool {
        return false
    }
    
    // For time based sessions, report this to the UI
    func timeInfo() -> String {
        return "";
    }
}
