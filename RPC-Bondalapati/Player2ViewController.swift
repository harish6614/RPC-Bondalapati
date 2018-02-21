//
//  Player2ViewController.swift
//  RPC-Bondalapati
//
//  Created by Bondalapati,Harish on 2/20/18.
//  Copyright © 2018 Bondalapati,Harish. All rights reserved.
//

import UIKit

class Player2ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    override func viewWillAppear(_ animated: Bool) {
        if AppDelegate.game.player2Choice == Choice.None {
            resultLBL.text = "Make a selection."
            commentLBL.text = ""
        } else {
            resultLBL.text = "Selection made: \(AppDelegate.game.player1Choice)"
            setComment()
        }
    }
    
    @IBOutlet weak var resultLBL: UILabel!
    @IBOutlet weak var commentLBL: UILabel!
    
    @IBAction func scissorBTN(_ sender: Any) {
        setChoice(pickedChoice: Choice.Scissor)
    }
    
    @IBAction func paperBTN(_ sender: Any) {
        setChoice(pickedChoice: Choice.Paper)
    }
    
    @IBAction func rockBTN(_ sender: Any) {
        setChoice(pickedChoice: Choice.Rock)
    }
    
    @IBAction func lizardBTN(_ sender: Any) {
        setChoice(pickedChoice: Choice.Lizard)
    }
    
    @IBAction func spockBTN(_ sender: Any) {
        setChoice(pickedChoice: Choice.Spock)
    }
    
    private func setChoice(pickedChoice: Choice){
        AppDelegate.game.choosePlayer2(pick: pickedChoice)
        resultLBL.text = "Selection made: \(pickedChoice)"
        setComment()
    }
    
    private func setComment(){
        if AppDelegate.game.player1Choice != .None {
            if AppDelegate.game.player1Choice == .None {
                commentLBL.text = "Let Player 1 make their selection."
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
