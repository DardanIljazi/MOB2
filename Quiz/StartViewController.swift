//
//  StartViewController.swift
//  Quiz
//
//  Created by Pascal Hurni on 21.03.17.
//  Copyright © 2017 Pascal Hurni. All rights reserved.
//

import UIKit

class StartViewController: UIViewController {
    
    @IBOutlet var scoreLabel: UILabel!
    @IBOutlet var username: UITextField!
    @IBOutlet var bestPlayerLabel: UILabel!
    
    var _usersSessionsManager: UsersSessionsManager = UsersSessionsManager()
    var session: QuizSession?

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func rookieSessionClick(_ sender: AnyObject) {
        if (!areAllMinimumRequiredAttributesSet()) {
            return;
        }
        
        session = RookieQuizSession(questionRepository: makeQuestionRepository())
        showSessionView(session!)
    }

    @IBAction func journeymanSessionClick(_ sender: AnyObject) {
        if (!areAllMinimumRequiredAttributesSet()) {
            return;
        }
        
        session = JourneymanQuizSession(questionRepository: makeQuestionRepository())
        showSessionView(session!)
    }
    
    @IBAction func warriorSessionClick(_ sender: AnyObject) {
        if (!areAllMinimumRequiredAttributesSet()) {
            return;
        }
        
        session = WarriorQuizSession(questionRepository: makeQuestionRepository())
        showSessionView(session!)
    }
    
    @IBAction func ninjaSessionClick(_ sender: AnyObject) {
        if (!areAllMinimumRequiredAttributesSet()) {
            return;
        }
        
        session = NinjaQuizSession(questionRepository: makeQuestionRepository())
        showSessionView(session!)
    }
    
    func makeQuestionRepository() -> QuestionRepository {
        //return RemoteQuestionRepository(remoteUrl: "http://localhost:4567")
        return StaticQuestionRepository()
    }
    
    func showSessionView(_ session: QuizSession)
    {
        let sessionViewController = storyboard?.instantiateViewController(withIdentifier: "sessionVC") as! ViewController
        
        sessionViewController.session = session
        sessionViewController.sessionCompletion = {
            
            self._usersSessionsManager.addUserSession(userSession: UserSession(username: self.username.text!, score: session.score))
            
            self.showScore()
            self.showBestPlayer()
        }
        
        present(sessionViewController, animated: true, completion: nil)
    }

    func showScore() {
        scoreLabel.text = "GAME OVER\nvotre score: \(session!.score) / \(session!.questionsCount)"
    }
    
    func areAllMinimumRequiredAttributesSet() -> Bool {
        return username.hasText
    }
    
    func showBestPlayer() {
        let bestUsrSession = _usersSessionsManager.getBestPlayer()
        
        bestPlayerLabel.text = "Meilleur: \(bestUsrSession.username) avec \(bestUsrSession.score) pts\n"
    }
    
}
