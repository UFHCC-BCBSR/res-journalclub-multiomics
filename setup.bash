#!/bin/bash

# Multi-Omics Journal Club Repository Setup Script
set -e

REPO_URL="https://github.com/UFHCC-BCBSR/res-journalclub-multiomics"
REPO_NAME="UFHCC-BCBSR/res-journalclub-multiomics"

echo "=== Setting up Multi-Omics Journal Club Repository ==="

git init
mkdir -p papers figures slides

# Create README.md
cat > README.md << 'EOF'
# Multi-Omics Integration Journal Club Series

Organization repository for a 6-7 session journal club series on multi-omics integration in cancer bioinformatics.

## Session 1: Introduction & Challenges (Ready)

**Paper:** Tarazona et al. (2021) "Undisclosed, unmet and neglected challenges in multi-omics studies" _Nat Comput Sci_

**Materials:** `slides/session1-intro-challenges.qmd`

## Proposed Future Sessions (Need Speakers)

| Session | Topic | Status |
|---------|-------|--------|
| 2 | Statistical Methods | Need speaker |
| 3 | Cancer Applications | Need speaker |
| 4 | Single-Cell Multi-Omics | Need speaker |
| 5 | Spatial Multi-Omics | Need speaker |
| 6 | Clinical Translation | Need speaker |
| 7 | AI/ML & Future Directions | Need speaker |

## Contact

**Organizer:** hkates@ufl.edu, jobrant@ufl.edu, kshirlekar@ufl.edu 
**Department:** UF Health Cancer Institute - BCB-SR
EOF

# Create .gitignore
cat > .gitignore << 'EOF'
.Rproj.user/
.Rhistory
.RData
.Ruserdata
*.Rproj
/.quarto/
_site/
_freeze/
__pycache__/
*.py[cod]
.ipynb_checkpoints/
*.h5ad
*.h5
*.rds
.DS_Store
Thumbs.db
*.tmp
*.bak
*~
*.html
*.pdf
!slides/*.html
!slides/*.pdf
.env
.Renviron
EOF

# Create placeholder files
cat > papers/README.md << 'EOF'
# Papers Directory

**Session 1 Paper:**
- Tarazona et al. (2021) - Undisclosed, unmet and neglected challenges in multi-omics studies

Place PDF here as: Tarazona2021_challenges-multiomics.pdf
EOF

cat > figures/README.md << 'EOF'
# Figures Directory

**Session 1 Figures from Tarazona 2021:**
- Figure 1: Multi-omics study goals
- Figure 2: Challenges and opportunities
- Figure 3: Omics data properties comparison

Naming convention: tarazona2021_fig1_description.png
EOF

cat > slides/README.md << 'EOF'
# Slides Directory

**Current:**
- session1-intro-challenges.qmd - Session 1 presentation

**Render:**
    quarto render session1-intro-challenges.qmd
EOF

# Git operations
git add .
git commit -m "Initial setup: Multi-omics journal club series organization

- Directory structure for Session 1 materials
- README with series overview
- Placeholder files for papers, figures, slides"

git remote add origin "$REPO_URL"
git branch -M main

# Create repo if it doesn't exist
echo "Checking if repository exists..."
if ! gh repo view "$REPO_NAME" &> /dev/null; then
    echo "Creating repository..."
    gh repo create "$REPO_NAME" --public --description "Multi-Omics Integration Journal Club Series" --confirm
    sleep 2
fi

# Push
git push -u origin main

# Create GitHub issues
echo "Creating GitHub issues..."

gh issue create \
    --repo "$REPO_NAME" \
    --title "Session 1: Finalize presentation materials" \
    --label "session-1" \
    --body "Tasks:
- Download Tarazona et al. (2021) PDF
- Extract figures to figures/
- Review Quarto presentation
- Test rendering
- Prepare discussion questions"

gh issue create \
    --repo "$REPO_NAME" \
    --title "Session 2: Recruit speaker for Statistical Methods" \
    --label "speaker-needed" \
    --body "Need speaker for statistical methods deep-dive.

Potential topics:
- Latent factor models (MOFA)
- Bayesian approaches
- Regularization methods
- Network inference

Action: Identify and contact potential speakers"

gh issue create \
    --repo "$REPO_NAME" \
    --title "Session 3: Recruit speaker for Cancer Applications" \
    --label "speaker-needed" \
    --body "Need speaker for cancer-specific multi-omics applications.

Potential topics:
- TCGA PanCancer Atlas
- Precision oncology
- Tumor subtyping

Action: Identify UFHCC researchers using multi-omics"

gh issue create \
    --repo "$REPO_NAME" \
    --title "Session 4: Recruit speaker for Single-Cell Multi-Omics" \
    --label "speaker-needed" \
    --body "Need speaker for single-cell multi-omics.

Potential topics:
- CITE-seq, Multiome technologies
- Analysis methods
- Tumor heterogeneity applications

Action: Survey local single-cell users"

gh issue create \
    --repo "$REPO_NAME" \
    --title "Session 5: Recruit speaker for Spatial Multi-Omics" \
    --label "speaker-needed,high-priority" \
    --body "Need speaker for spatial multi-omics (HIGH PRIORITY).

This is a major advancement not covered in 2021 review.

Potential topics:
- Spatial transcriptomics
- Spatial proteomics
- Tumor microenvironment

Action: Identify spatial omics users or consider external speaker"

gh issue create \
    --repo "$REPO_NAME" \
    --title "Session 6: Recruit speaker for Clinical Translation" \
    --label "speaker-needed" \
    --body "Need speaker for clinical translation.

Potential topics:
- Biomarker validation
- Regulatory considerations
- Precision oncology implementation

Action: Contact clinical genomics experts"

gh issue create \
    --repo "$REPO_NAME" \
    --title "Session 7: Recruit speaker for AI/ML & Future Directions" \
    --label "speaker-needed" \
    --body "Need speaker for AI/ML in multi-omics.

Potential topics:
- Foundation models
- Graph neural networks
- Interpretable ML

Consider: Could be practical demo session instead"

gh issue create \
    --repo "$REPO_NAME" \
    --title "Organize series logistics" \
    --label "logistics" \
    --body "Series logistics to determine:

echo ""
echo "=== Setup Complete ==="
echo "Repository: $REPO_URL"
echo "Issues created for speaker recruitment and logistics"
echo ""
