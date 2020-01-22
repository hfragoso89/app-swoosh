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
    
    private var mensButtonSelected = false
    private var womensButtonSelected = false
    private var coedButtonSelected = false
    
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
    
    func refreshBtns() {
        switch player.desiredLeague {
        case "mens":
            mensButtonSelected = !mensButtonSelected
            womensButtonSelected = false
            coedButtonSelected = false
            
            mensBtn.isHighlighted = !mensButtonSelected
            womensBtn.isHighlighted = false
            coedBtn.isHighlighted = false
        case "womens":
            mensButtonSelected = false
            womensButtonSelected = !womensButtonSelected
            coedButtonSelected = false
            
            mensBtn.isHighlighted = false
            womensBtn.isHighlighted = !womensButtonSelected
            coedBtn.isHighlighted = false
        case "coed":
            mensButtonSelected = false
            womensButtonSelected = false
            coedButtonSelected = !coedButtonSelected
            
            mensBtn.isHighlighted = false
            womensBtn.isHighlighted = false
            coedBtn.isHighlighted = !coedButtonSelected
        default:
            return
        }
        
    }
    
    // Selector Btn's IBActions
    
    @IBAction func onMensTapped(_ sender: Any) {
        selectLeague(leagueType: "mens")
        refreshBtns()
    }
    
    @IBAction func onWomensTapped(_ sender: Any) {
        selectLeague(leagueType: "womens")
        refreshBtns()
    }
    
    @IBAction func onCoedTapped(_ sender: Any) {
        selectLeague(leagueType: "coed")
        refreshBtns()
    }
    
    func selectLeague(leagueType: String){
        player.desiredLeague = leagueType
        UIView.animate(withDuration: 1.0, delay: 0.5, animations: {
            self.nextBtn.isEnabled = true
        })
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
