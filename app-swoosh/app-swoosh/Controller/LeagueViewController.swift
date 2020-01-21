//
//  LeagueViewController.swift
//  app-swoosh
//
//  Created by Fragoso, Hector on 1/20/20.
//  Copyright © 2020 Fragoso, Hector. All rights reserved.
//

import UIKit

class LeagueViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func onNextTapped(_ sender: Any) {
        performSegue(withIdentifier: "skillViewControllerSegue", sender: self)
    }
    
    @IBAction func unwindIntoLeagueVC(unwindSegue:UIStoryboardSegue){
        
    }

}
