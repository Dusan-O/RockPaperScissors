//
//  ContentView.swift
//  RockPaperScissors
//
//  Created by Dusan Orescanin on 28/08/2022.
//

import SwiftUI

struct ContentView: View {
    /// Bool to show
    @State var showAlert = false
    @State var showSheet = false
    
    /// Timer
    @State var timer: Timer?
    
    /// Game elements
    @State var score = 0
    @State var computerChoice = 0
    @State var myChoice = 0
    
    /// Answers values
    let icons = ["rock", "paper", "scissors"]
    var pierreCasseCiseaux = "La pierre casse les ciseaux"
    var ciseauxCoupePapier = "Les ciseaux coupent le papier"
    var paperEnveloppePierre = "Le papier enveloppe la pierre"
    var gagne = "C'est gagné!"
    var perdu = "Perdu ! Essaye encore"
    var draw = "Match nul"
    var drawExplain = "Vous avez choisi le même objet"
    
    var body: some View {
        VStack {
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
