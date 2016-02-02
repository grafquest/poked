//
//  PokemonDetailVC.swift
//  pokedex
//
//  Created by Troy Reed on 2/1/16.
//  Copyright © 2016 Troy Reed. All rights reserved.
//

import UIKit

class PokemonDetailVC: UIViewController {

    var pokemon: Pokemon!
    
    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var pokeImage: UIImageView!
    @IBOutlet weak var descriptionTxt: UITextView!
    @IBOutlet weak var nextEvoLbl: UILabel!
    @IBOutlet weak var attackLbl: UILabel!
    @IBOutlet weak var pokeIDLbl: UILabel!
    @IBOutlet weak var weightLbl: UILabel!
    @IBOutlet weak var heightLbl: UILabel!
    @IBOutlet weak var defenseLbl: UILabel!
    @IBOutlet weak var typeLbl: UILabel!
    @IBOutlet weak var currentEvoImg: UIImageView!
    @IBOutlet weak var nextEvoImg: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        nameLbl.text = pokemon.name.capitalizedString
        let img = UIImage(named: "\(pokemon.pokedexId)")
        pokeImage.image = img
        currentEvoImg.image = img
        
        pokemon.downloadPokemonDetails { () -> () in
          self.updateUI()
        }
        
    }
    
    func updateUI() {
        
        weightLbl.text = pokemon.weight
        heightLbl.text = pokemon.height
        attackLbl.text = pokemon.attack
        defenseLbl.text = pokemon.defense
        pokeIDLbl.text = "\(pokemon.pokedexId)"
        
        if pokemon.nextevolutionid == "" {
            nextEvoLbl.text = "No Evolutions"
            nextEvoImg.hidden = true
        } else {
            nextEvoImg.hidden = false
            nextEvoImg.image = UIImage(named: pokemon.nextevolutionid)
            var str = "Next Evolution: \(pokemon.nextevolutiontxt)"
            
            if pokemon.nextevolutionlvl != "" {
                str += " - LVL \(pokemon.nextevolutionlvl)"
            }

        }
        
        typeLbl.text = pokemon.types
        descriptionTxt.text = pokemon.description
    }
    
    override func viewDidLayoutSubviews() {
        //super.viewDidLayoutSubviews()
        //descriptionTxt.setContentOffset(CGPoint.zero, animated: false)
        

    }
    
    @IBAction func onBackPressed(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    


}
