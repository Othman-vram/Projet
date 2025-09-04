#!/bin/bash

# Script de compilation automatique du rapport de stage INSA
# Usage: ./compile_rapport.sh

echo "🚀 Compilation du rapport de stage INSA"
echo "========================================"

# Vérification des fichiers requis
echo "📋 Vérification des fichiers..."

required_files=(
    "rapport_stage_complete_insa.tex"
    "travail_effectue_section.tex"
    "schemas_architecture.tex"
    "charte_graphique_INSA/classeRapport.sty"
    "charte_graphique_INSA/INSALogo.pdf"
    "charte_graphique_INSA/couverture_simple_generic.pdf"
    "charte_graphique_INSA/foot-logo-pfe.png"
)

missing_files=()
for file in "${required_files[@]}"; do
    if [ ! -f "$file" ]; then
        missing_files+=("$file")
    fi
done

if [ ${#missing_files[@]} -ne 0 ]; then
    echo "❌ Fichiers manquants :"
    for file in "${missing_files[@]}"; do
        echo "   - $file"
    done
    echo ""
    echo "💡 Assurez-vous que tous les fichiers requis sont présents."
    exit 1
fi

# Vérification du dossier images
if [ ! -d "images" ]; then
    echo "📁 Création du dossier images/"
    mkdir -p images
fi

# Vérification du logo CHB
if [ ! -f "images/CHB_logo.png" ]; then
    echo "⚠️  Logo CHB manquant : images/CHB_logo.png"
    echo "   Ajoutez le logo du Centre Henri Becquerel dans ce fichier."
fi

# Liste des captures d'écran attendues
screenshots=(
    "qupath_sam_segmentation_screenshot.png"
    "pipeline_execution_screenshot.png"
    "interface_principale_screenshot.png"
    "canvas_fragments_screenshot.png"
    "selection_rectangle_screenshot.png"
    "panneau_groupe_screenshot.png"
    "points_etiquetes_screenshot.png"
    "dialogue_export_screenshot.png"
    "selection_niveaux_screenshot.png"
)

missing_screenshots=()
for screenshot in "${screenshots[@]}"; do
    if [ ! -f "images/$screenshot" ]; then
        missing_screenshots+=("$screenshot")
    fi
done

if [ ${#missing_screenshots[@]} -ne 0 ]; then
    echo "📸 Captures d'écran manquantes :"
    for screenshot in "${missing_screenshots[@]}"; do
        echo "   - images/$screenshot"
    done
    echo ""
    echo "💡 Ces captures seront remplacées par des placeholders lors de la compilation."
fi

echo "✅ Vérification terminée"
echo ""

# Compilation des schémas d'abord
echo "🔧 Compilation des schémas TikZ..."
pdflatex -interaction=nonstopmode schemas_architecture.tex > /dev/null 2>&1
if [ $? -eq 0 ]; then
    echo "✅ Schémas compilés avec succès"
else
    echo "❌ Erreur lors de la compilation des schémas"
    echo "   Vérifiez le fichier schemas_architecture.log pour plus de détails"
fi

echo ""

# Compilation principale
echo "📖 Compilation du rapport principal..."
echo "   Étape 1/4 : Première compilation..."
pdflatex -interaction=nonstopmode rapport_stage_complete_insa.tex > compilation.log 2>&1

if [ $? -ne 0 ]; then
    echo "❌ Erreur lors de la première compilation"
    echo "   Consultez le fichier compilation.log pour plus de détails"
    tail -20 compilation.log
    exit 1
fi

echo "   Étape 2/4 : Compilation bibliographie..."
bibtex rapport_stage_complete_insa > bibtex.log 2>&1

echo "   Étape 3/4 : Deuxième compilation..."
pdflatex -interaction=nonstopmode rapport_stage_complete_insa.tex >> compilation.log 2>&1

echo "   Étape 4/4 : Compilation finale..."
pdflatex -interaction=nonstopmode rapport_stage_complete_insa.tex >> compilation.log 2>&1

if [ $? -eq 0 ]; then
    echo "✅ Compilation réussie !"
    echo ""
    echo "📄 Fichier généré : rapport_stage_complete_insa.pdf"
    
    # Statistiques du document
    if [ -f "rapport_stage_complete_insa.pdf" ]; then
        size=$(du -h "rapport_stage_complete_insa.pdf" | cut -f1)
        echo "📊 Taille du fichier : $size"
        
        # Compter les pages (approximatif)
        if command -v pdfinfo &> /dev/null; then
            pages=$(pdfinfo rapport_stage_complete_insa.pdf | grep "Pages:" | awk '{print $2}')
            echo "📖 Nombre de pages : $pages"
        fi
    fi
    
    echo ""
    echo "🎉 Rapport de stage INSA généré avec succès !"
    
else
    echo "❌ Erreur lors de la compilation finale"
    echo "   Consultez le fichier compilation.log pour plus de détails"
    tail -20 compilation.log
    exit 1
fi

# Nettoyage des fichiers temporaires
echo ""
echo "🧹 Nettoyage des fichiers temporaires..."
rm -f *.aux *.log *.toc *.lof *.lot *.bbl *.blg *.out *.fdb_latexmk *.fls *.synctex.gz
echo "✅ Nettoyage terminé"

echo ""
echo "🚀 Compilation terminée avec succès !"
echo "   Ouvrez le fichier : rapport_stage_complete_insa.pdf"