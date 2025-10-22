//
//  Teams.swift
//  Tactics replica
//
//  Created by Diogo Melo on 22/10/25.
//

import Foundation

// MARK: Brazil
let brazil2002 = Team(name: "Brazil 2002", coach: "Felipão", players: [
    // Goalkeepers
    Player(number: 1,  name: "Marcos",         club: "Palmeiras",               height: 193, age: 29, position: .goalkeeper),
    Player(number: 12, name: "Dida",           club: "Corinthians",             height: 193, age: 29, position: .goalkeeper),
    Player(number: 22, name: "Rogério Ceni",   club: "São Paulo",               height: 188, age: 29, position: .goalkeeper),

    // Defenders
    Player(number: 2,  name: "Cafu (c)",       club: "AS Roma",                 height: 176, age: 32, position: .defender),
    Player(number: 3,  name: "Lúcio",          club: "Bayer Leverkusen",        height: 188, age: 24, position: .defender),
    Player(number: 4,  name: "Roque Júnior",   club: "AC Milan",                height: 186, age: 25, position: .defender),
    Player(number: 5,  name: "Edmílson",       club: "Lyon",                    height: 186, age: 25, position: .defender),
    Player(number: 6,  name: "Roberto Carlos", club: "Real Madrid",             height: 168, age: 29, position: .defender),
    Player(number: 13, name: "Belletti",       club: "São Paulo",               height: 179, age: 25, position: .defender),
    Player(number: 14, name: "Ânderson Polga", club: "Grêmio",                  height: 182, age: 23, position: .defender),
    Player(number: 16, name: "Júnior",         club: "Parma",                   height: 173, age: 28, position: .defender),

    // Midfielders
    Player(number: 7,  name: "Ricardinho",     club: "Corinthians",             height: 176, age: 26, position: .midfielder),
    Player(number: 8,  name: "Gilberto Silva", club: "Atlético Mineiro",        height: 180, age: 25, position: .midfielder),
    Player(number: 15, name: "Kléberson",      club: "Atlético Paranaense",     height: 175, age: 22, position: .midfielder),
    Player(number: 17, name: "Denílson",       club: "Real Betis",              height: 177, age: 24, position: .midfielder),
    Player(number: 18, name: "Vampeta",        club: "Corinthians",             height: 182, age: 28, position: .midfielder),
    Player(number: 19, name: "Juninho Paulista", club: "Flamengo",              height: 165, age: 29, position: .midfielder),
    Player(number: 23, name: "Kaká",           club: "São Paulo",               height: 181, age: 20, position: .midfielder),

    // Forwards
    Player(number: 9,  name: "Ronaldo",        club: "Internazionale",          height: 183, age: 25, position: .forward),
    Player(number: 10, name: "Rivaldo",        club: "Barcelona",               height: 182, age: 30, position: .forward),
    Player(number: 11, name: "Ronaldinho",     club: "Paris Saint-Germain",     height: 181, age: 22, position: .forward),
    Player(number: 20, name: "Edílson",        club: "Cruzeiro",                height: 168, age: 31, position: .forward),
    Player(number: 21, name: "Luizão",         club: "Grêmio",                  height: 176, age: 26, position: .forward)
])

let brazilLineUp = LineUp(team: brazil2002, formation: [3, 4, 3], starting: [1, 3, 4, 5, 2, 15, 8, 6, 10, 9, 11], bench: [12, 13, 14, 16, 7, 21])


// MARK: France
let france2000 = Team(name: "France 2000", coach: "Somewho", players: [
    // Goalkeepers
    Player(number: 1,  name: "Bernard Lama",     club: "Paris Saint-Germain",     height: 191, age: 37, position: .goalkeeper),
    Player(number: 16, name: "Fabien Barthez",    club: "Manchester United",       height: 180, age: 29, position: .goalkeeper),
    Player(number: 22, name: "Ulrich Ramé",       club: "Bordeaux",               height: 185, age: 27, position: .goalkeeper),

    // Defenders
    Player(number: 2,  name: "Vincent Candela",   club: "AS Roma",                 height: 180, age: 26, position: .defender),
    Player(number: 3,  name: "Bixente Lizarazu",  club: "Bayern Munich",           height: 170, age: 30, position: .defender),
    Player(number: 5,  name: "Laurent Blanc",     club: "Internazionale",         height: 190, age: 34, position: .defender),
    Player(number: 8,  name: "Marcel Desailly",   club: "Chelsea",                 height: 188, age: 31, position: .defender),
    Player(number: 15, name: "Lilian Thuram",     club: "Parma",                   height: 184, age: 28, position: .defender),
    Player(number: 18, name: "Frank LeBoeuf",     club: "Chelsea",                 height: 183, age: 32, position: .defender),

    // Midfielders
    Player(number: 4,  name: "Patrick Vieira",    club: "Arsenal",                 height: 193, age: 23, position: .midfielder),
    Player(number: 6,  name: "Youri Djorkaeff",   club: "1. FC Kaiserslautern",    height: 178, age: 32, position: .midfielder),
    Player(number: 7,  name: "Didier Deschamps",  club: "Chelsea",                 height: 173, age: 31, position: .midfielder),
    Player(number: 10, name: "Zinédine Zidane",    club: "Juventus",                height: 185, age: 28, position: .midfielder),
    Player(number: 11, name: "Robert Pires",      club: "Marseille",               height: 185, age: 27, position: .midfielder),
    Player(number: 14, name: "Johan Micoud",      club: "Bordeaux",               height: 188, age: 26, position: .midfielder),
    Player(number: 17, name: "Emmanuel Petit",    club: "Arsenal",                 height: 185, age: 29, position: .midfielder),
    Player(number: 19, name: "Christian Karembeu",club: "Real Madrid",             height: 180, age: 29, position: .midfielder),

    // Forwards
    Player(number: 9,  name: "Nicolas Anelka",    club: "Real Madrid",             height: 185, age: 21, position: .forward),
    Player(number: 12, name: "Thierry Henry",     club: "Arsenal",                 height: 180, age: 22, position: .forward),
    Player(number: 13, name: "Sylvain Wiltord",   club: "Bordeaux",               height: 173, age: 26, position: .forward),
    Player(number: 20, name: "David Trézéguet",   club: "Monaco",                  height: 190, age: 23, position: .forward),
    Player(number: 21, name: "Christophe Dugarry",club: "Bordeaux",               height: 188, age: 28, position: .forward)
])

let franceLineUp = LineUp(team: france2000, formation: [4, 2, 3, 1], starting: [16, 15, 5, 8, 3, 7, 4, 6, 10, 11, 12], bench: [1, 2, 18, 17, 13, 20])
