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
    @IBOutlet weak var username: UITextField!
    
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
        if (!canProceedFurther()) {
            return;
        }
        
        session = RookieQuizSession(questionRepository: makeQuestionRepository())
        showSessionView(session!)
    }

    @IBAction func journeymanSessionClick(_ sender: AnyObject) {
        if (!canProceedFurther()) {
            return;
        }
        
        session = JourneymanQuizSession(questionRepository: makeQuestionRepository())
        showSessionView(session!)
    }
    
    @IBAction func warriorSessionClick(_ sender: AnyObject) {
        if (!canProceedFurther()) {
            return;
        }
        
        session = WarriorQuizSession(questionRepository: makeQuestionRepository())
        showSessionView(session!)
    }
    
    @IBAction func ninjaSessionClick(_ sender: AnyObject) {
        if (!canProceedFurther()) {
            return;
        }
        
        session = NinjaQuizSession(questionRepository: makeQuestionRepository())
        showSessionView(session!)
    }
    
    func makeQuestionRepository() -> QuestionRepository {
        //return RemoteQuestionRepository(remoteUrl: "http://localhost:4567")
        return StaticQuestionRepository()
    }
    
    func canProceedFurther() -> Bool {
        return username.hasText;
    }
    
    func showSessionView(_ session: QuizSession)
    {
        let sessionViewController = storyboard?.instantiateViewController(withIdentifier: "sessionVC") as! ViewController
        
        sessionViewController.session = session
        sessionViewController.sessionCompletion = {
            self.showScore()
        }
        
        present(sessionViewController, animated: true, completion: nil)
    }

    func showScore() {
        scoreLabel.text = "GAME OVER\nvotre score: \(session!.score) / \(session!.questionsCount)"
    }
    
}
