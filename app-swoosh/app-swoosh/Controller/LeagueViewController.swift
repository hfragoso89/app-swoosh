//
//  LeagueViewController.swift
//  app-swoosh
//
//  Created by Fragoso, Hector on 1/20/20.
//  Copyright © 2020 Fragoso, Hector. All rights reserved.
//

import UIKit

class LeagueViewController: UIViewController {

    private var player: Player!
    
    private var selectedOption:UIButton?
    
    // IBOutlets
    @IBOutlet weak var nextBtn: BorderButton!
    @IBOutlet weak var mensBtn: BorderButton!
    @IBOutlet weak var womensBtn: BorderButton!
    @IBOutlet weak var coedBtn: BorderButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        player = Player()
        
        // Do any additional setup after loading the view.
    }
    
    // Selector Btn's IBActions
    
    @IBAction func onMensTapped(_ sender: Any) {
        if let btn = sender as? UIButton{
            toggleHighlightState(for: btn)
        }
        if selectedOption != nil {
            selectLeague(leagueType: "mens")
        } else {
            selectLeague(leagueType: nil)
        }
    }
    
    @IBAction func onWomensTapped(_ sender: Any) {
        if let btn = sender as? UIButton{
            toggleHighlightState(for: btn)
        }
        if selectedOption != nil {
            selectLeague(leagueType: "womens")
        } else {
            selectLeague(leagueType: nil)
        }
    }
    
    @IBAction func onCoedTapped(_ sender: Any) {
        if let btn = sender as? UIButton{
            toggleHighlightState(for: btn)
        }
        if selectedOption != nil {
            selectLeague(leagueType: "coed")
        } else {
            selectLeague(leagueType: nil)
        }
    }
    
    func selectLeague(leagueType: String?){
        player.desiredLeague = leagueType
        UIView.animate(withDuration: 1.0, delay: 0.5, animations: {
            if leagueType != nil {
                self.nextBtn.isEnabled = true
            } else {
                self.nextBtn.isEnabled = false
            }
        })
    }
    
    func toggleHighlightState(for button:UIButton) {
        if let current = selectedOption {
            if button != current {
                (current as? BorderButton)?.deselectButton()
                
                (button as? BorderButton)?.selectButton()
                selectedOption = button
            }
            else {
                (button as? BorderButton)?.deselectButton()
                selectedOption = nil
            }
        } else {
            (button as? BorderButton)?.selectButton()
            selectedOption = button
        }
    }
    
    
    
    //IBActions used for Segues
    
    @IBAction func onNextTapped(_ sender: Any) {
        performSegue(withIdentifier: "skillViewControllerSegue", sender: self)
    }
    
    @IBAction func unwindIntoLeagueVC(unwindSegue:UIStoryboardSegue){
        
    }
    
    //Prepare for segue
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let skillVC = segue.destination as? SkillViewController {
            skillVC.player = player
        }
    }

}
