# Guide de Compilation - Rapport de Stage INSA

## 🎯 Configuration rapide

### 1. Vérifiez la structure des fichiers
```
votre-projet/
├── rapport_stage_complete_insa.tex          # ✅ Fichier principal
├── travail_effectue_section.tex             # ✅ Déjà créé
├── schemas_architecture.tex                 # ✅ Déjà créé
├── charte_graphique_INSA/                   # ✅ Déjà présent
│   ├── classeRapport.sty
│   ├── INSALogo.pdf
│   ├── couverture_simple_generic.pdf
│   └── foot-logo-pfe.png
└── images/                                  # ⚠️ À créer
    ├── CHB_logo.png                        # ⚠️ À ajouter
    └── [vos captures d'écran]              # ⚠️ À ajouter
```

### 2. Créez le dossier images et ajoutez le logo CHB
```bash
mkdir -p images
# Ajoutez votre logo CHB dans images/CHB_logo.png
```

### 3. Compilation automatique
```bash
# Rendez le script exécutable
chmod +x compile_rapport.sh

# Lancez la compilation
./compile_rapport.sh
```

## 📸 Captures d'écran à ajouter

Placez ces 9 captures dans le dossier `images/` :

1. **qupath_sam_segmentation_screenshot.png**
   - Interface QuPath avec plugin SAM
   - Segmentation des tissus visible

2. **pipeline_execution_screenshot.png**
   - Terminal avec pipeline en cours
   - Barres de progression colorées

3. **interface_principale_screenshot.png**
   - Vue d'ensemble de l'application
   - Tous les panneaux visibles

4. **canvas_fragments_screenshot.png**
   - Fragments chargés sur le canvas
   - Sélection et manipulation visibles

5. **selection_rectangle_screenshot.png**
   - Sélection rectangle en cours
   - Plusieurs fragments sélectionnés

6. **panneau_groupe_screenshot.png**
   - Panneau de contrôle groupe activé
   - Boutons de manipulation groupe

7. **points_etiquetes_screenshot.png**
   - Points rouges avec labels
   - Correspondances entre fragments

8. **dialogue_export_screenshot.png**
   - Dialogue d'exportation ouvert
   - Options de format visibles

9. **selection_niveaux_screenshot.png**
   - Sélection des niveaux pyramidaux
   - Checkboxes et options

## 🔧 Compilation manuelle (si le script ne fonctionne pas)

### Étape 1 : Compilation des schémas
```bash
pdflatex schemas_architecture.tex
```

### Étape 2 : Compilation principale
```bash
pdflatex rapport_stage_complete_insa.tex
bibtex rapport_stage_complete_insa
pdflatex rapport_stage_complete_insa.tex
pdflatex rapport_stage_complete_insa.tex
```

## 🚨 Résolution des problèmes

### Erreur : "File not found: CHB_logo.png"
**Solution :** Ajoutez le logo CHB dans `images/CHB_logo.png`

### Erreur : "Package tikz not found"
**Solution :** Installez les packages TikZ :
```bash
# Ubuntu/Debian
sudo apt-get install texlive-pictures

# Ou installation complète
sudo apt-get install texlive-full
```

### Erreur : "classeRapport.sty not found"
**Solution :** Vérifiez que le dossier `charte_graphique_INSA/` est complet

### Images qui ne s'affichent pas
**Solution :** Vérifiez les noms de fichiers exacts (sensible à la casse)

## ✅ Vérification finale

Après compilation réussie, votre PDF doit contenir :
- ✅ Page de garde INSA avec logos
- ✅ Table des matières avec numérotation
- ✅ En-têtes et pieds de page INSA
- ✅ 4 schémas TikZ intégrés
- ✅ 9 captures d'écran aux bons emplacements
- ✅ Code source avec coloration syntaxique
- ✅ Bibliographie formatée

## 🎉 Résultat attendu

Un rapport de **40-50 pages** avec :
- Charte graphique INSA officielle
- Contenu technique détaillé et professionnel
- Schémas d'architecture intégrés
- Captures d'écran illustratives
- Mise en page soignée et lisible

**Temps de compilation :** 2-3 minutes selon la puissance de votre machine.