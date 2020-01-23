//
//  SkillViewController.swift
//  app-swoosh
//
//  Created by Fragoso, Hector on 1/20/20.
//  Copyright © 2020 Fragoso, Hector. All rights reserved.
//

import UIKit

class SkillViewController: UIViewController {
    
    var player: Player!
    
    private var selectedOption:UIButton?

    @IBOutlet weak var beginnerBtn: BorderButton!
    @IBOutlet weak var ballerBtn: BorderButton!
    @IBOutlet weak var finishBtn: BorderButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        print(player.desiredLeague!)
    }
    
    @IBAction func beginnerBtnTapped(_ sender: UIButton) {
        toggleHighlightState(for: sender)
        selectLevel(level: selectedOption?.titleLabel?.text)
    }
    
    @IBAction func ballerBtnTapped(_ sender: UIButton) {
        toggleHighlightState(for: sender)
        selectLevel(level: selectedOption?.titleLabel?.text)
    }
    
    func selectLevel(level: String?){
        player.selectedSkillLevel = level
        UIView.animate(withDuration: 1.0, delay: 0.5, animations: {
            if level != nil {
                self.finishBtn.isEnabled = true
            } else {
                self.finishBtn.isEnabled = false
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
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
