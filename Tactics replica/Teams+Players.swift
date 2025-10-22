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
    Player(number: 2,  name: "Cafu",       club: "AS Roma",                 height: 176, age: 32, position: .defender),
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

// MARK: France

let france2000 = Team(name: "France 2000", coach: "Roger Lemerre", players: [
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

// MARK: Italy

let italy2006 = Team(name: "Italy 2006", coach: "Marcello Lippi", players: [
    // Goalkeepers
    Player(number: 1,  name: "Gianluigi Buffon",    club: "Juventus",       height: 191, age: 28, position: .goalkeeper),
    Player(number: 12, name: "Angelo Peruzzi",      club: "Lazio",          height: 181, age: 36, position: .goalkeeper),
    Player(number: 14, name: "Marco Amelia",        club: "Livorno",        height: 190, age: 24, position: .goalkeeper),

    // Defenders
    Player(number: 2,  name: "Cristian Zaccardo",   club: "Palermo",        height: 184, age: 24, position: .defender),
    Player(number: 3,  name: "Fabio Grosso",        club: "Palermo",        height: 190, age: 28, position: .defender),
    Player(number: 5,  name: "Fabio Cannavaro",     club: "Real Madrid",    height: 175, age: 32, position: .defender),
    Player(number: 6,  name: "Andrea Barzagli",     club: "Palermo",        height: 186, age: 25, position: .defender),
    Player(number: 13, name: "Alessandro Nesta",    club: "AC Milan",       height: 187, age: 30, position: .defender),
    Player(number: 19, name: "Gianluca Zambrotta",  club: "FC Barcelona",   height: 178, age: 29, position: .defender),
    Player(number: 22, name: "Massimo Oddo",        club: "Lazio",          height: 185, age: 30, position: .defender),
    Player(number: 23, name: "Marco Materazzi",     club: "Inter Milan",    height: 188, age: 32, position: .defender),

    // Midfielders
    Player(number: 4,  name: "Daniele De Rossi",    club: "AS Roma",        height: 184, age: 22, position: .midfielder),
    Player(number: 8,  name: "Gennaro Gattuso",     club: "AC Milan",       height: 178, age: 28, position: .midfielder),
    Player(number: 10, name: "Francesco Totti",     club: "AS Roma",        height: 180, age: 29, position: .midfielder),
    Player(number: 16, name: "Mauro Camoranesi",    club: "Juventus",       height: 178, age: 29, position: .midfielder),
    Player(number: 17, name: "Simone Barone",       club: "Torino",         height: 178, age: 28, position: .midfielder),
    Player(number: 20, name: "Simone Perrotta",     club: "AS Roma",        height: 175, age: 29, position: .midfielder),
    Player(number: 21, name: "Andrea Pirlo",        club: "AC Milan",       height: 178, age: 27, position: .midfielder),

    // Forwards
    Player(number: 7,  name: "Alessandro Del Piero",club: "Juventus",       height: 174, age: 31, position: .forward),
    Player(number: 9,  name: "Luca Toni",           club: "Fiorentina",     height: 190, age: 29, position: .forward),
    Player(number: 11, name: "Alberto Gilardino",   club: "AC Milan",       height: 182, age: 24, position: .forward),
    Player(number: 15, name: "Vincenzo Iaquinta",   club: "Udinese",        height: 178, age: 26, position: .forward)
])

// MARK: Greece

let greece2004 = Team(name: "Greece 2004", coach: "Otto Rehhagel", players: [
    Player(number: 1,  name: "Antonios Nikopolidis", club: "Olympiacos", height: 189, age: 33, position: .goalkeeper),
    Player(number: 2,  name: "Giourkas Seitaridis", club: "Panathinaikos", height: 178, age: 23, position: .defender),
    Player(number: 3,  name: "Stylianos Venetidis", club: "Olympiacos", height: 176, age: 27, position: .defender),
    Player(number: 4,  name: "Nikos Dabizas", club: "Leicester City", height: 185, age: 30, position: .defender),
    Player(number: 5,  name: "Traianos Dellas", club: "AS Roma", height: 190, age: 28, position: .defender),
    Player(number: 6,  name: "Angelos Basinas", club: "Panathinaikos", height: 180, age: 28, position: .midfielder),
    Player(number: 7,  name: "Theodoros Zagorakis", club: "Leicester City", height: 175, age: 32, position: .midfielder),
    Player(number: 8,  name: "Stelios Giannakopoulos", club: "Bolton Wanderers", height: 175, age: 29, position: .midfielder),
    Player(number: 9,  name: "Angelos Charisteas", club: "Werder Bremen", height: 193, age: 24, position: .forward),
    Player(number: 10, name: "Vassilios Tsiartas", club: "AEK Athens", height: 180, age: 31, position: .midfielder),
    Player(number: 11, name: "Angelos Nikolaidis", club: "Olympiacos", height: 182, age: 31, position: .forward),
    Player(number: 12, name: "Kostas Chalkias", club: "PAOK", height: 188, age: 33, position: .goalkeeper),
    Player(number: 13, name: "Theofanis Katergiannakis", club: "AEK Athens", height: 180, age: 25, position: .goalkeeper),
    Player(number: 14, name: "Takis Fyssas", club: "Benfica", height: 180, age: 31, position: .defender),
    Player(number: 15, name: "Zisis Vryzas", club: "AEK Athens", height: 183, age: 30, position: .forward),
    Player(number: 16, name: "Pantelis Kafes", club: "Olympiacos", height: 178, age: 25, position: .midfielder),
    Player(number: 17, name: "Giorgos Georgiadis", club: "Olympiacos", height: 182, age: 32, position: .midfielder),
    Player(number: 18, name: "Yannis Goumas", club: "Panathinaikos", height: 184, age: 29, position: .defender),
    Player(number: 19, name: "Michalis Kapsis", club: "AEK Athens", height: 183, age: 30, position: .defender),
    Player(number: 20, name: "Giorgos Karagounis", club: "Internazionale", height: 173, age: 27, position: .midfielder),
    Player(number: 21, name: "Costas Katsouranis", club: "AEK Athens", height: 185, age: 24, position: .midfielder),
    Player(number: 22, name: "Dimitrios Papadopoulos", club: "Olympiacos", height: 180, age: 28, position: .defender),
    Player(number: 23, name: "Vassilios Lakis", club: "AEK Athens", height: 174, age: 27, position: .forward)
])

