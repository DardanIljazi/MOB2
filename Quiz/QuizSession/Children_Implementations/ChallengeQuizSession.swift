//
//  ChallengeQuizSession.swift
//  Quiz
//
//  Created by cpnv on 03.04.20.
//  Copyright © 2020 Pascal Hurni. All rights reserved.
//

import Foundation

class ChallengeQuizSession : JourneymanQuizSession {

    override init(questionRepository: QuestionRepository, totalQuestionCount: Int = 12) {
        super.init(questionRepository: questionRepository, totalQuestionCount: totalQuestionCount)
    }

    override func checkAnswer(_ answer: String) -> Bool {
        let response = super.checkAnswer(answer)
        return true
    }
}
