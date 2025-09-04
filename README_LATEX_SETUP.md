# Configuration du Projet LaTeX - Rapport de Stage INSA

## 📁 Structure des fichiers requise

Voici comment organiser vos fichiers pour que la compilation fonctionne :

```
votre-projet/
├── rapport_stage_complete_insa.tex          # Fichier principal
├── travail_effectue_section.tex             # Section détaillée (déjà créée)
├── schemas_architecture.tex                 # Schémas TikZ (déjà créé)
├── charte_graphique_INSA/                   # Dossier charte INSA (déjà présent)
│   ├── classeRapport.sty                   # Classe de style INSA
│   ├── INSALogo.pdf                        # Logo INSA
│   ├── couverture_simple_generic.pdf       # Fond de page de garde
│   └── foot-logo-pfe.png                   # Logo pied de page
└── images/                                  # Dossier pour vos images
    ├── CHB_logo.png                        # Logo Centre Henri Becquerel
    ├── qupath_sam_segmentation_screenshot.png
    ├── pipeline_execution_screenshot.png
    ├── interface_principale_screenshot.png
    ├── canvas_fragments_screenshot.png
    ├── selection_rectangle_screenshot.png
    ├── panneau_groupe_screenshot.png
    ├── points_etiquetes_screenshot.png
    ├── dialogue_export_screenshot.png
    └── selection_niveaux_screenshot.png
```

## 🖼️ Images requises à ajouter

### 1. Logo CHB (obligatoire)
Créez le fichier `images/CHB_logo.png` avec le logo du Centre Henri Becquerel.

### 2. Captures d'écran (9 images)
Ajoutez vos captures d'écran dans le dossier `images/` avec ces noms exacts :

- `qupath_sam_segmentation_screenshot.png`
- `pipeline_execution_screenshot.png`  
- `interface_principale_screenshot.png`
- `canvas_fragments_screenshot.png`
- `selection_rectangle_screenshot.png`
- `panneau_groupe_screenshot.png`
- `points_etiquetes_screenshot.png`
- `dialogue_export_screenshot.png`
- `selection_niveaux_screenshot.png`

## ⚙️ Compilation LaTeX

### Option 1 : Compilation complète (recommandée)
```bash
# Compilation avec bibliographie
pdflatex rapport_stage_complete_insa.tex
bibtex rapport_stage_complete_insa
pdflatex rapport_stage_complete_insa.tex
pdflatex rapport_stage_complete_insa.tex
```

### Option 2 : Compilation simple
```bash
# Si pas de bibliographie
pdflatex rapport_stage_complete_insa.tex
pdflatex rapport_stage_complete_insa.tex  # 2x pour les références croisées
```

### Option 3 : Avec latexmk (automatique)
```bash
latexmk -pdf rapport_stage_complete_insa.tex
```

## 🔧 Packages LaTeX requis

Assurez-vous d'avoir ces packages installés :

### Packages de base :
- `babel` (français)
- `inputenc` (UTF-8)
- `fontenc` (T1)
- `geometry` (marges)
- `graphicx` (images)

### Packages spécialisés :
- `tikz` (schémas)
- `listings` (code source)
- `xcolor` (couleurs)
- `tcolorbox` (boîtes colorées)
- `fancyhdr` (en-têtes)
- `hyperref` (liens)

### Installation sur Ubuntu/Debian :
```bash
sudo apt-get install texlive-full
```

### Installation sur Windows :
Installez MiKTeX ou TeX Live complet.

### Installation sur macOS :
```bash
brew install --cask mactex
```

## 🚨 Problèmes courants et solutions

### Erreur : "File not found: CHB_logo.png"
**Solution :** Créez le fichier `images/CHB_logo.png` avec le logo CHB.

### Erreur : "Package tikz not found"
**Solution :** Installez le package TikZ :
```bash
# Ubuntu/Debian
sudo apt-get install texlive-pictures

# Ou installation complète
sudo apt-get install texlive-full
```

### Erreur : "classeRapport.sty not found"
**Solution :** Vérifiez que le dossier `charte_graphique_INSA/` est bien présent avec tous ses fichiers.

### Erreur de compilation des schémas TikZ
**Solution :** Compilez d'abord `schemas_architecture.tex` séparément :
```bash
pdflatex schemas_architecture.tex
```

### Images qui ne s'affichent pas
**Solution :** Vérifiez les chemins et noms de fichiers exacts dans le dossier `images/`.

## 📝 Ordre de compilation recommandé

1. **Vérifiez la structure** : Tous les dossiers et fichiers requis
2. **Testez les schémas** : Compilez `schemas_architecture.tex` en premier
3. **Ajoutez les images** : Placez toutes les captures d'écran
4. **Compilation finale** : Lancez la compilation complète

## 🎯 Résultat attendu

Après compilation réussie, vous obtiendrez :
- **Page de garde INSA** avec logos et mise en page officielle
- **En-têtes/pieds de page** aux couleurs INSA
- **Table des matières** avec numérotation INSA
- **Contenu technique** avec schémas intégrés
- **Bibliographie** formatée selon les standards

## 💡 Conseils pratiques

1. **Compilez étape par étape** pour identifier les erreurs
2. **Vérifiez les logs** en cas d'erreur de compilation
3. **Utilisez un éditeur LaTeX** comme TeXstudio ou Overleaf
4. **Gardez une sauvegarde** avant modifications importantes

Le rapport final aura l'apparence professionnelle INSA avec tout votre contenu technique détaillé !