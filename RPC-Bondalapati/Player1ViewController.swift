//
//  Player1ViewController.swift
//  RPC-Bondalapati
//
//  Created by Bondalapati,Harish on 2/19/18.
//  Copyright © 2018 Bondalapati,Harish. All rights reserved.
//

import UIKit

class Player1ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.tabBarItem.title = AppDelegate.game.player1Name
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        if AppDelegate.game.player1Choice == Choice.None {
            resultLBL.text = "Make a selection."
        } else {
            resultLBL.text = "Selection made: \(AppDelegate.game.player1Choice)"
        }
    }
    
    @IBOutlet weak var resultLBL: UILabel!
    @IBOutlet weak var commentLBL: UILabel!
    
    @IBAction func scissorBTN(_ sender: Any) {
        setChoice(choice: Choice.Scissor)
    }
    
    @IBAction func paperBTN(_ sender: Any) {
        setChoice(choice: Choice.Paper)
    }
    
    @IBAction func rockBTN(_ sender: Any) {
        setChoice(choice: Choice.Rock)
    }
    
    @IBAction func lizardBTN(_ sender: Any) {
        setChoice(choice: Choice.Lizard)
    }
    
    @IBAction func spockBTN(_ sender: Any) {
        setChoice(choice: Choice.Spock)
    }
    
    private func setChoice(pickedChoice: Choice){
        resultLBL.text = "Selection made: \(pickedChoice)"
    }
    
    private func setComment(){
        if AppDelegate.game.player1Choice != .None {
            if AppDelegate.game.player2Choice == .None {
                commentLBL.text = "Player 2 make your selection."
            }
            else {
                commentLBL.text = "See Results!!!"
            }
        } else {
            commentLBL.text = ""
        }
        
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
