// Fonctions pouvant-etre utilsées dev suite à des exos de cours sur la création d'algorithmes simples

// Fonction qui retourne lequel de deux nompbres entiers est le plus grand

func est_plus (a: Int, b: Int) -> String{
    if a > b {
        return String(a) + " est plus grand que " + String(b)
    } else if a < b {
        return String(b) + " est plus grand que " + String(a)
    } else {
        return String(a) + " est égal à " + String(b)
    }
}

// Fonction qui prend en input une donnée t correspondant à une urée en seconde pour retourner la même durée au format hh:mm:ss

func heuriser (t: Int) -> String{
    var d : Int = t
    var h : Int = 0
    var m : Int = 0
    var s : Int = 0
    
    if d/3600 >= 1 {
        h = Int(d/3600)
        d = d - (h * 3600)
    }
    if d/60 >= 1 {
        m = Int(d/60)
        d = d - (m * 60)
    }
    s = d
    
    return String(h) + "h " + String(m) + "m " + String(s) + "s"
}

// fonction retournant le salaire d'un employé selon un indice donné par son ancienneté et son poste
func salaire_employé (g: String, a: Int) {
    var i : Int = 0
    switch g {
    case "Concepteur":
        switch a {
        case 1:
            i = 15
        case 2:
            i = 17
        case 3:
            i = 19
        default:
            i = 0
        }
    case "Ingénieur":
        switch a {
        case 1:
            i = 23
        case 2:
            i = 25
        case 3:
            i = 27
        default:
            i = 0
        }
    case "Ingénieur Sénior":
        switch a {
        case 1:
            i = 35
        case 2:
            i = 40
        case 3:
            i = 45
        default:
            i = 0
        }
    default:
        i = 0 
    }
    
    /*if g == "Concepteur" {
        if a == 1 {
            i = 15
        } else if a == 2 {
            i = 17
        } else {
            i = 19
        }
    } else if g == "Ingénieur" {
        if a == 1 {
            i = 23
        } else if a == 2 {
            i = 25
        } else {
            i = 27
        }
    } else {
        if a == 1 {
            i = 23
        } else if a == 2 {
            i = 25
        } else {
            i = 27
        }
    }*/
}

// l'ensemble des fonctions suivantes ont pour but de déterminer le pgcd de deux nombres, j'ai choisi de travailler comme suit car j'ai déjà développé un petit algorithme permettent de déterminer les iviseurs d'un nombre entier.

//dans un premier temps on détermine les diviseurs d’un nombre ( que la partie positive le pgcd y sera toujours étant donné la symétrie) puis on compare en partant des plus grands.
func div_x (x: Int) -> [Int] {
    
    // i servira à se déplacer dans les nombres qui peuvent être concerné par ce que l’on cherche et on démarre notre tableau par notre nombre qui se divise lui-même car pour des raisons d’optimisation il ne sera pas compris entre les bornes de i.
    var i = x/2
    var div_x_arr : [Int] = [x]
    
    //si notre nombre est pair alors on observe tous les entiers entre 0 (non compris pour éviter l’exception du /0 et x/2 sachant que sont plus grand diviseur excepté lui-même est lui-même divisé par deux et dès que l’on trouve un nombre qui ne donne pas de reste lorsqu’il divise x on l’ajoute à notre tableau. Et on incrémente i de -1 à chaque fois
    if x % 2 == 0 {
        while i > 0 {
            if x % i == 0 {
                div_x_arr.append(i)
            }
            i -= 1
        }
        //De même si x est un impair, son plus grand diviseur est forcément inférieur ou égal à lui-même divisé par trois de plus un impair ne peut être divisé par un nombre pair (cela impliquerait une possible divisibilité par deux non-sens) donc on incrémente i de -2.
    } else {
        i = x/3
        while i > 0 {
            if x % i == 0 {
                div_x_arr.append(i)
            }
            i -= 2
        }
    }
    return div_x_arr
}
//maintenant on peut déterminer les diviseurs de deux nombres, ne reste plus qu’à trouver le plus grands qu’ils sont en commun.

//Pas opti mais je n’arrivais pas à sortir de la boucle for dès la première égalité et c’était plus court à écrire qu’une boucle While

func search_for_pgcd (a: Int, b: Int) -> Int {
    var arr_one : [Int] = div_x(x: a)
    var arr_two : [Int] = div_x(x: b)
    var pgcd : [Int] = []
    
        for i in 0 ... arr_one.count - 1 {
            for j in 0 ... arr_two.count - 1 {
                if arr_one[i] == arr_two[j] {
                    pgcd.append(arr_one[i])
                }
            }
        }
    return pgcd[0]
}

// Calcul de moyenne

func calcul_moyenne (a: [Float]) -> Float {
    var nb_sum : Float = 0
    var moyenne : Float = 0
    
    for i in 0 ... a.count - 1 {
        nb_sum += a[i]
    }
    moyenne = nb_sum / Float(a.count)
    return moyenne
}

// on compte combien de fois n apparait dans un tableau

func app_n (n: Float, a: [Float]) -> Int {
    var n_count : Int = 0
    
    for i in 0 ... a.count - 1 {
        if a[i] == n {
            n_count += 1
        }
    }
    return n_count
}

// election à 4 candidats (cours)

func elec_one (arr_elec : [Double]) -> String{
    var res : String = ""
    var pgv : Double = 0
    
    for i in 0 ... 3 {
        if arr_elec[i] > pgv {
            pgv = arr_elec[i]
        }
    }
    
    if arr_elec[0] > 0.5 {
        res = "Le premier candidat est élu"
    } else if arr_elec[0] > 0.125 && arr_elec[0] > 0.125 && pgv < 0.5 {
        res = "Le premier candidat passe au second tour"
        if arr_elec[0] == pgv {
            res += "en ballotage favorable"
        } else {
            res += "en ballotage défavorable"
        }
    } else if pgv > 0.5 && arr_elec[0] < 0.5 || arr_elec[0] < 0.125 {
        res = "Le candidat est éliminé"
    }
    return res
}

// variante nb de candidat ilimité

func elec_two (arr_elec : [Double]) -> String {
    var res : String = ""
    var pgv : Double = 0
    
    for i in 0 ... arr_elec.count - 1 {
        if arr_elec[i] > pgv {
            pgv = arr_elec[i]
        }
    }
    
    if arr_elec[0] > 0.5 {
        res = "Le premier candidat est élu"
    } else if arr_elec[0] > 0.125 && arr_elec[0] > 0.125 && pgv < 0.5 {
        res = "Le premier candidat passe au second tour"
        if arr_elec[0] == pgv {
            res += "en ballotage favorable"
        } else {
            res += "en ballotage défavorable"
        }
    } else if pgv > 0.5 && arr_elec[0] < 0.5 || arr_elec[0] < 0.125 {
        res = "Le candidat est éliminé"
    }
    return res
}

// Validité de carte banquaire

func cbValidity (arr_cb : [Int]) -> Bool {
    var estValide : Bool = false
    var sum : Int = 0
    var tab : [Int] = arr_cb
    
    for i in 0 ... 15 {
        if i % 2 == 0 {
            tab[i] *= 2
            if tab[i] > 9 {
                tab[i] -= 9
            }
        }
        sum += tab[i]
    }
    if sum % 10 == 0 {
        estValide = true
    }
    return estValide
}
  
// Décompose un nombre selon ses chiffres dans un tableau

func décomposition_table (num: Int) -> [Int] {
    var n : Int = num
    var i : Int = 1
    var j : Int = 0
    var tab : [Int] = []
    
    while num/i > 1 {
        i *= 10
    }
    i = i/10
    func intPart (n : Float) -> Int {
        var a : [Substring] = String(n).split(separator: ".")
        return Int(a[0])!
    }
    
    while n > 0 {
        tab.append(intPart(n: Float(n/i)))
        n = n - i * tab[j]
        i = i/10
        j += 1
    }
    return tab
}
