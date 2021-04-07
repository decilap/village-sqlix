/*------------------------------------------------------
\                     REQUETE => 1                     \
--------------------------------------------------------*/
SELECT * 
FROM potion;

/*------------------------------------------------------
\                     REQUETE => 2                     \
--------------------------------------------------------*/
SELECT nom_categ
FROM categorie 
WHERE nb_points = 3;

/*------------------------------------------------------
\                     REQUETE => 3                     \
--------------------------------------------------------*/
SELECT nom_village 
FROM village 
WHERE nb_huttes > 35;

/*------------------------------------------------------
\                     REQUETE => 4                     \
--------------------------------------------------------*/
SELECT num_trophee 
FROM trophee 
WHERE date_prise 
BETWEEN "2052-05-01 00:00:00" 
AND "2052-06-30 00:00:00";

/*------------------------------------------------------
\                     REQUETE => 5                     \
--------------------------------------------------------*/
SELECT nom
FROM habitant
WHERE nom LIKE "a%r%";

/*------------------------------------------------------
\                     REQUETE => 6                     \
--------------------------------------------------------*/
SELECT a.num_hab 
FROM absorber a
WHERE num_potion IN(1,3,4);

/*------------------------------------------------------
\                     REQUETE => 7                     \
--------------------------------------------------------*/
SELECT num_trophee,date_prise,code_cat,num_preneur 
FROM trophee; 

/*------------------------------------------------------
\                     REQUETE => 8                     \
--------------------------------------------------------*/
SELECT h.nom 
FROM habitant h 
INNER JOIN village v ON h.num_village = v.num_village
WHERE v.nom_village ="Aquilona";

/*------------------------------------------------------
\                     REQUETE => 9                     \
--------------------------------------------------------*/
SELECT nom 
FROM habitant h 
INNER JOIN trophee t ON t.num_preneur = h.num_hab 
INNER JOIN categorie c ON c.code_cat = t.code_cat 
WHERE c.nom_categ = "Bouclier de Légat"; 

/*------------------------------------------------------
\                     REQUETE => 10                     \
--------------------------------------------------------*/
SELECT h.nom 
FROM habitant h 
INNER JOIN trophee t ON t.num_preneur = h.num_hab 
INNER JOIN categorie c ON c.code_cat = t.code_cat 
WHERE c.nom_categ = "Bouclier de Légat"; 

/*------------------------------------------------------
\                     REQUETE => 11                     \
--------------------------------------------------------*/
SELECT p.lib_potion 
FROM potion p
INNER JOIN absorber a ON a.num_potion = p.num_potion
INNER JOIN habitant h ON a.num_hab = h.num_hab
WHERE h.nom = "Homéopatix"
GROUP BY p.lib_potion;

/*------------------------------------------------------
\                    REQUETE => 12                     \
--------------------------------------------------------*/
SELECT a.num_hab , ha.nom
FROM absorber a
INNER JOIN fabriquer f ON a.num_potion = f.num_potion
INNER JOIN habitant h ON h.num_hab = f.num_hab
INNER JOIN habitant ha ON ha.num_hab = a.num_hab
WHERE h.num_hab = 3
GROUP BY a.num_hab;

/*------------------------------------------------------
\                    REQUETE => 13                     \
--------------------------------------------------------*/
SELECT a.num_hab , ha.nom
FROM absorber a
INNER JOIN fabriquer f ON a.num_potion = f.num_potion
INNER JOIN habitant h ON h.num_hab = f.num_hab
INNER JOIN habitant ha ON ha.num_hab = a.num_hab
WHERE h.nom = "Amnésix"
GROUP BY a.num_hab;

/*------------------------------------------------------
\                    REQUETE => 14                     \
--------------------------------------------------------*/
SELECT nom 
FROM habitant 
WHERE num_qualite IS NULL; 

/*------------------------------------------------------
\                    REQUETE => 15                     \
--------------------------------------------------------*/
SELECT h.nom , p.lib_potion
FROM habitant h
INNER JOIN absorber a ON a.num_hab = h.num_hab
INNER JOIN potion p ON p.num_potion = a.num_potion
WHERE p.num_potion = 1 
AND (a.date_a >= "2052-02-01 00:00:00" AND a.date_a <= "2052-02-29 00:00:00");

/*------------------------------------------------------
\                    REQUETE => 16                     \
--------------------------------------------------------*/
SELECT nom,age
FROM habitant
ORDER BY nom;

/*------------------------------------------------------
\                    REQUETE => 17                     \
--------------------------------------------------------*/
SELECT r.nom_resserre ,v.nom_village
FROM resserre r
INNER JOIN village v ON v.num_village = r.num_village
ORDER BY r.superficie DESC;

/*------------------------------------------------------
\                    REQUETE => 18                     \
--------------------------------------------------------*/
SELECT COUNT(num_hab) nb_habitant 
FROM habitant h
WHERE h.num_village = 5;

/*------------------------------------------------------
\                    REQUETE => 19                     \
--------------------------------------------------------*/
SELECT h.nom, SUM(c.nb_points)
FROM trophee
INNER JOIN habitant h ON trophee.num_preneur = h.num_hab
INNER JOIN categorie c ON trophee.code_cat = c.code_cat
WHERE h.nom = "Goudurix"
GROUP BY h.nom;

/*------------------------------------------------------
\                    REQUETE => 20                     \
--------------------------------------------------------*/
SELECT t.date_prise
FROM trophee t
ORDER BY t.date_prise
LIMIT 1;

/*------------------------------------------------------
\                    REQUETE => 21                     \
--------------------------------------------------------*/
SELECT p.lib_potion, SUM(a.quantite)
FROM absorber a
INNER JOIN potion p ON p.num_potion = a.num_potion
WHERE p.lib_potion = "Potion magique n°2";

/*------------------------------------------------------
\                    REQUETE => 22                     \
--------------------------------------------------------*/
SELECT r.superficie
FROM resserre r
ORDER BY r.superficie DESC
LIMIT 1;

/*------------------------------------------------------
\                    REQUETE => 23                     \
--------------------------------------------------------*/
SELECT v.nom_village , COUNT(h.num_hab)
FROM village v
INNER JOIN habitant h ON v.num_village = h.num_village
GROUP BY v.nom_village;
/*------------------------------------------------------
\                     REQUETE => 24                     \
--------------------------------------------------------*/ 
SELECT h.nom , COUNT(t.num_trophee)
FROM trophee t
INNER JOIN habitant h ON t.num_preneur = h.num_hab
GROUP BY h.nom;

/*------------------------------------------------------
\                     REQUETE => 25                     \
--------------------------------------------------------*/ 
SELECT p.nom_province , AVG(h.age)
FROM village v
INNER JOIN habitant h ON v.num_village = h.num_village
INNER JOIN province p ON v.num_province = p.num_province
GROUP BY v.num_province;

/*------------------------------------------------------
\                     REQUETE => 26                     \
--------------------------------------------------------*/
SELECT h.nom, SUM(a.quantite)
FROM absorber a 
INNER JOIN potion p ON a.num_potion = p.num_potion
INNER JOIN habitant h ON a.num_hab = h.num_hab
GROUP BY h.nom;

/*------------------------------------------------------
\                     REQUETE => 27                     \
--------------------------------------------------------*/  
SELECT h.nom,a.quantite, p.lib_potion
FROM absorber a 
INNER JOIN potion p ON a.num_potion = p.num_potion
INNER JOIN habitant h ON a.num_hab = h.num_hab
WHERE (p.lib_potion = "Potion Zen")AND(a.quantite > 2 );

/*------------------------------------------------------
\                     REQUETE => 28                     \
--------------------------------------------------------*/  
SELECT v.nom_village
FROM resserre r 
INNER JOIN village v ON r.num_village = v.num_village;

/*------------------------------------------------------
\                     REQUETE => 29                     \
--------------------------------------------------------*/  
SELECT v.nom_village
FROM village v
ORDER BY v.nb_huttes DESC
LIMIT 1;

/*------------------------------------------------------
\                     REQUETE => 30                     \
--------------------------------------------------------*/  
SELECT h.nom,COUNT(t.num_trophee) AS nb_trophee
FROM trophee t
INNER JOIN habitant h ON t.num_preneur = h.num_hab
GROUP BY h.nom 
HAVING nb_trophee > (
SELECT COUNT(t.num_trophee) AS nb_trophee
FROM trophee t
INNER JOIN habitant h ON t.num_preneur = h.num_hab
    WHERE h.nom = "Obélix"
);
