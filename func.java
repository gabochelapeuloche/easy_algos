public class App {
    
    /////// Exos énoncés en CM (algo -> prgrm java) ///////

    // 1 Calcul du salaire d'un employé en fonction d'un indice déterminé par son poste et son ancienneté (trop fatch trouver deux algos)

    int calcul_salaire_fst(String g, Integer a) {
        int i = 0;
        if (g == "C") {
            switch (a) {
                case 1:
                    i = 15;
                    break;
                case 2:
                    i = 17;
                    break;
                case 3:
                    i = 19;
                default:
                    break;
            }
        } else if (g == "I") {
            switch (a) {
                case 1:
                    i = 125;
                    break;
                case 2:
                    i = 27;
                    break;
                case 3:
                    i = 29;
                default:
                    break;
            }
        } else {
            switch (a) {
                case 1:
                    i = 35;
                    break;
                case 2:
                    i = 40;
                    break;
                case 3:
                    i = 45;
                default:
                    break;
            }
        }
        return i*125;
    }

    // 2 Comparaison de deux nombres (vrmt trop fatch)

    String comparaison(Integer a, Integer b) {
        if (a > b) {
            return a.toString() + "est plus grand que" + b.toString();
        } else if (a == b) {
            return a.toString() + "est égal à" + b.toString();
        } else {
            return b.toString() + "est plus grand que" + a.toString();
        }
    }

    // 3 convertion d'une durée en h/m/s (trop fatch trouver deux algos)

    String conversion_hms(Integer d) {
        Integer t = d;
        Integer h = 0;
        Integer m = 0;
        Integer s = 0;

        if (t>3600) {
            h = Math.floor(t/3600);
            t = t - h * 3600;
        }
        if (t>60) {
            m = Math.floor(t/60);
            t = t - m * 60;
        }
        s = t;
        return d.toString() + "vaut" + h.toString() + ":" + m.toString() + ":" + s.toString();
    }

    // 4 déterminer un PGCD de deux entiers (trop fatch trouver deux algos)

    Integer pgcd_solver(Integer a, Integer b) {

        return 1;
    }

    // 5 calculer un moyenne dans un tableau sans en connaitre les dimensions (trop fatch je vais essayer de rerpogrammer length)

}
