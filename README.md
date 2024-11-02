# Projet TSN FPGA
## Détection de début de symbole et de trame

Afin de détecter le début d’une trame et ses différents symboles, nous allons utiliser le calcul de corrélation de la trame. 
Il est bon alors d’utiliser un symbole au début de la trame composée de deux moitiés identiques. Ainsi, il suffit d’effectuer 
une corrélation entre la première et la seconde moitié du symbole. Ce symbole aura également une garde correspondant 
à la fin du symbole, et donc la corrélation sera forte pendant toute la durée de la garde.

Voici la représentation d’un tel symbole : 

![image](https://github.com/user-attachments/assets/99db9765-ac84-461d-9810-33f4ade65069)

Pour la détection du début de trame, une corrélation par soustraction Cor = x(n)-x(n-N/2) est utilisé.  
Afin de détecter le début des différents symboles de la trame, une garde est copié à chaque fin de symbole voici la 
représentation d’un tel symbole :  

![image](https://github.com/user-attachments/assets/7c8689e2-f39b-4ab7-9b1f-c985fea4ee02)

**L’architecture est divisée en deux blocs présentés dans la figure suivante. Cette architecture peut être organisé en un seul 
fichier ou deux fichiers VHDL**

![image](https://github.com/user-attachments/assets/144c5fb6-454e-4ad7-a8fb-c87c552184ad)

## Résultats :


![Screenshot 2023-12-27 194710](https://github.com/user-attachments/assets/09b2cfe4-0e0d-456d-a68e-d048ada37bb6)


![Screenshot 2023-12-27 195407](https://github.com/user-attachments/assets/39c5efb6-ddef-4a86-86fd-af803ac8bcea)


![Screenshot 2023-12-27 195329](https://github.com/user-attachments/assets/860a68bb-95e4-425f-980d-593e850f041c)
