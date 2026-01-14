# =========================================
# SITE WEB LOCAL - PROJET ENTREPRENEURIAT
# STYLE INSPIRE CUP-CLEANER
# =========================================

# ----- Dossier principal -----
dir.create("site_projet_cafe", showWarnings = FALSE)
setwd("site_projet_cafe")

# ----- Sous-dossiers -----
dir.create("pages", showWarnings = FALSE)
dir.create("css", showWarnings = FALSE)
dir.create("images", showWarnings = FALSE)

# =====================
# FEUILLE DE STYLE CSS
# =====================
css <- "
body {
  font-family: 'Poppins', Arial, sans-serif;
  margin: 0;
  background-color: #f07f07;
  color: #374151;
}

/* ---------- HEADER ---------- */
header {
  background: linear-gradient(135deg, #1f2933, #0f172a);
  color: white;
  padding: 30px 20px;
  text-align: center;
}

header h1 {
  margin-bottom: 15px;
  font-size: 2.2rem;
}

nav a {
  color: #e5e7eb;
  margin: 0 14px;
  text-decoration: none;
  font-weight: 600;
}

nav a:hover {
  color: #f07f07;
}

nav a.active {
  color: #ffffff;
  border-bottom: 3px solid #38bdf8;
  padding-bottom: 4px;
}

/* ---------- HERO ---------- */
.hero {
  background: url('../images/hero.jpg') center/cover no-repeat;
  padding: 120px 20px;
  text-align: center;
  color: white;
}

.hero h2 {
  font-size: 2.6rem;
  margin-bottom: 15px;
  text-shadow: 1px 1px 6px rgba(0,0,0,0.6);
}

.hero p {
  font-size: 1.2rem;
  margin-bottom: 30px;
  text-shadow: 1px 1px 6px rgba(0,0,0,0.5);
}

/* ---------- BOUTONS ---------- */
.btn-primary {
  background-color: #38bdf8;
  color: white;
  padding: 14px 30px;
  border-radius: 6px;
  text-decoration: none;
  font-weight: 600;
}

.btn-primary:hover {
  background-color: #0ea5e9;
}

/* ---------- MAIN ---------- */
main {
  background-color: white;
  padding: 50px;
  margin: 40px auto;
  width: 85%;
  max-width: 1000px;
  border-radius: 12px;
  box-shadow: 0 12px 30px rgba(0, 0, 0, 0.08);
}

.section {
  margin-bottom: 50px;
}

h2 {
  color: #0f172a;
}

p {
  line-height: 1.7;
}

/* ---------- IMAGE ---------- */
.image-projet {
  display: block;
  max-width: 80%;
  margin: 35px auto;
  border-radius: 12px;
  box-shadow: 0 10px 25px rgba(0, 0, 0, 0.15);
}

/* ---------- FOOTER ---------- */
footer {
  text-align: center;
  padding: 20px;
  background-color: #e5e7eb;
  font-size: 0.9rem;
}
"

writeLines(css, "css/style.css")

# =====================
# FONCTION PAGE HTML
# =====================
page_html <- function(titre, contenu, hero = FALSE, active = "") {
  
  nav_link <- function(name, file) {
    class <- if (active == file) "class='active'" else ""
    paste0("<a href='", file, "' ", class, ">", name, "</a>")
  }
  
  hero_html <- if (hero) "
<section class='hero'>
  <h2>Système éco-responsable pour machines à café</h2>
  <p>Réduire l'eau, simplifier le nettoyage, améliorer l'impact environnemental</p>
  <a href='projet.html' class='btn-primary'>Découvrir le projet</a>
</section>
" else ""
  
  paste0(
    "<!DOCTYPE html>
<html lang='fr'>
<head>
<meta charset='UTF-8'>
<title>", titre, "</title>

<link rel='preconnect' href='https://fonts.googleapis.com'>
<link rel='preconnect' href='https://fonts.gstatic.com' crossorigin>
<link href='https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;600;700&display=swap' rel='stylesheet'>

<link rel='stylesheet' href='../css/style.css'>
</head>

<body>

<header>
<h1>Système éco-responsable pour machines à café</h1>
<nav>
", nav_link("Accueil", "index.html"), "
", nav_link("Projet", "projet.html"), "
", nav_link("Offre", "offre.html"), "
", nav_link("Modèle économique", "modele.html"), "
", nav_link("Impact", "impact.html"), "
", nav_link("Notre équipe", "equipe.html"), "
</nav>
</header>

", hero_html, "

<main>
", contenu, "
</main>

<footer>
Projet d’entrepreneuriat – 2026
</footer>

</body>
</html>"
  )
}


# =====================
# PAGES
# =====================

index <- page_html(
  "Accueil",
  "
<div class='section'>
<h2>Présentation générale</h2>
<p>
Notre projet vise à développer un système intégré aux machines à café
permettant un nettoyage efficace des contenants réutilisables,
tout en réduisant significativement la consommation d’eau.
</p>
</div>
",
  hero = TRUE,
  active = "index.html"
)

projet <- page_html(
  "Le projet",
  "
<div class='section'>
<h2>Le projet</h2>
<p>
Le système repose sur une enveloppe technique intégrée à une machine à café,
utilisant des matériaux durables (inox, aluminium, cuivre)
et des composants simples.
</p>

<img src='C:/Users/arnau/Desktop/projet entreprise/site_projet_cafe/images/produit.jpg' class='image-projet' alt='Prototype du système'>

<p>
L’objectif est de proposer une solution fiable, durable
et économiquement accessible pour les lieux professionnels.
</p>
</div>
",
  active = "projet.html"
)

offre <- page_html(
  "L’offre",
  "
<div class='section'>
<h2>Proposition de valeur</h2>
<ul>
<li>Réduction de la consommation d’eau</li>
<li>Système adaptable aux machines existantes</li>
<li>Solution dédiée aux environnements professionnels</li>
</ul>
</div>
",
  active = "offre.html"
)

modele <- page_html(
  "Modèle économique",
  "
<div class='section'>
<h2>Modèle économique</h2>
<p>
Distribution via partenaires spécialisés,
vente directe aux entreprises
et maintenance associée.
</p>
</div>
",
  active = "modele.html"
)

impact <- page_html(
  "Impact environnemental",
  "
<div class='section'>
<h2>Impact environnemental</h2>
<p>
Le projet contribue à la réduction de l’empreinte hydrique
dans les espaces de consommation de café.
</p>
</div>
",
  active = "impact.html"
)

equipe <- page_html(
  "Notre équipe",
  "
<div class='section'>
<h2>Notre équipe</h2>
<p>
Projet porté par une équipe pluridisciplinaire
engagée dans l’innovation durable.
</p>
</div>
",
  active = "equipe.html"
)

# =====================
# ÉCRITURE DES FICHIERS
# =====================
writeLines(index,  "pages/index.html")
writeLines(projet, "pages/projet.html")
writeLines(offre,  "pages/offre.html")
writeLines(modele, "pages/modele.html")
writeLines(impact, "pages/impact.html")
writeLines(equipe, "pages/equipe.html")

# =====================
# OUVERTURE DU SITE
# =====================
browseURL(normalizePath("pages/index.html"))
