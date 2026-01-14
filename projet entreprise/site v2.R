# =========================================
# SITE WEB LOCAL - PRÉSENTATION PRODUIT
# VERSION SIMPLIFIÉE ET PROFESSIONNELLE
# =========================================

# ----- Dossier principal -----
#dir.create("site_projet_cafe", showWarnings = FALSE)
setwd("site_projet_cafe")

# ----- Sous-dossiers -----
#dir.create("pages", showWarnings = FALSE)
#dir.create("css", showWarnings = FALSE)
#dir.create("images", showWarnings = FALSE)

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
  border-bottom: 3px solid #ffffff;
  padding-bottom: 4px;
}

/* ---------- HERO ---------- */
.hero {
  background: #a19e99;
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
  background-color: #f7d274;
  color: black ;
  padding: 14px 30px;
  border-radius: 6px;
  text-decoration: none;
  font-weight: 600;
  display: inline-block;
}

.btn-primary:hover {
  background-color: #e8b431;
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
  border-bottom: 3px solid #38bdf8;
  padding-bottom: 10px;
  margin-bottom: 25px;
}

h3 {
  color: #1f2933;
  margin-top: 30px;
}

p {
  line-height: 1.7;
  margin-bottom: 15px;
}

ul {
  line-height: 1.8;
  margin-left: 20px;
}

li {
  margin-bottom: 10px;
}

/* ---------- CARDS ---------- */
.card-container {
  display: flex;
  gap: 20px;
  flex-wrap: wrap;
  margin: 30px 0;
}

.card {
  flex: 1;
  min-width: 250px;
  background-color: #f9fafb;
  padding: 25px;
  border-radius: 8px;
  box-shadow: 0 4px 12px rgba(0,0,0,0.05);
}

.card h3 {
  color: #38bdf8;
  margin-top: 0;
}

/* ---------- HIGHLIGHT BOX ---------- */
.highlight-box {
  background-color: #eff6ff;
  border-left: 4px solid #38bdf8;
  padding: 20px;
  margin: 25px 0;
  border-radius: 4px;
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
  <a href='projet.html' class='btn-primary'>Découvrir le produit</a>
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
<h1> Rince & RéCup</h1>
<nav>
", nav_link("Accueil", "index.html"), "
", nav_link("Le produit", "projet.html"), "
", nav_link("Notre offre", "offre.html"), "
", nav_link("Impact", "impact.html"), "
", nav_link("Contact", "contact.html"), "
</nav>
</header>

", hero_html, "

<main>
", contenu, "
</main>

<footer>
Projet d'entrepreneuriat – 2026
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
<h2>Une solution innovante pour un café responsable</h2>
<p>
Notre système intégré aux machines à café permet un nettoyage efficace 
des contenants réutilisables (mugs, tasses, gourdes) tout en réduisant 
significativement la consommation d'eau.
</p>
</div>

<div class='section'>
<h2>Pourquoi notre produit ?</h2>
<div class='card-container'>
  <div class='card'>
    <h3>🌊 Économie d'eau</h3>
    <p>Réduction drastique de la consommation d'eau nécessaire au nettoyage</p>
  </div>
  <div class='card'>
    <h3>⚡ Simple et efficace</h3>
    <p>Système automatisé facile à intégrer aux machines existantes</p>
  </div>
  <div class='card'>
    <h3>♻️ Éco-responsable</h3>
    <p>Matériaux durables et encouragement des contenants réutilisables</p>
  </div>
</div>
</div>

<div class='section'>
<h2>Pour qui ?</h2>
<p>
Notre solution s'adresse à tous les lieux proposant du café : entreprises, 
universités, cafétérias, hôtels, espaces de coworking...
</p>
</div>
",
  hero = TRUE,
  active = "index.html"
)

projet <- page_html(
  "Le produit",
  "
<div class='section'>
<h2>Le produit</h2>
<p>
Notre système de nettoyage intégré combine simplicité technique et efficacité. 
Conçu avec des matériaux durables (inox, aluminium, cuivre), il garantit 
hygiène et longévité.
</p>

<img src='../images/produit.png' class='image-projet' alt='Système de nettoyage'>
</div>

<div class='section'>
<h2>Comment ça marche ?</h2>
<p>Le système intègre :</p>
<ul>
<li><strong>Un circuit hydraulique optimisé</strong> : pompe à eau et tuyaux de raccordement</li>
<li><strong>Un système de chauffage</strong> : résistance pour un nettoyage efficace</li>
<li><strong>Une soufflerie</strong> : séchage rapide des contenants</li>
<li><strong>Une structure durable</strong> : inox et composite aluminium-cuivre</li>
</ul>
</div>

<div class='section'>
<h2>Caractéristiques techniques</h2>
<p>
Enveloppe compacte et robuste, conçue pour s'installer près des machines à café professionnelles. Installation rapide par nos partenaires spécialisés.
</p>

<div class='highlight-box'>
<strong>Prix accessible :</strong> 100 €, 
démontrant notre engagement pour une solution économiquement viable.
</div>
</div>
",
  active = "projet.html"
)

offre <- page_html(
  "Notre offre",
  "
<div class='section'>
<h2>Une solution complète</h2>
<p>
Nous proposons bien plus qu'un simple produit : une solution intégrée 
pour transformer votre espace café en un lieu éco-responsable.
</p>
</div>

<div class='section'>
<h2>Ce que nous vous apportons</h2>

<h3>✓ Réduction des coûts</h3>
<p>Économies d'eau significatives et réduction des déchets jetables.</p>

<h3>✓ Image éco-responsable</h3>
<p>Valorisez votre engagement environnemental auprès de vos collaborateurs et clients.</p>

<h3>✓ Installation et maintenance</h3>
<p>Nos partenaires assurent l'installation et la maintenance de votre système.</p>

<h3>✓ Simplicité d'usage</h3>
<p>Système automatisé ne nécessitant aucune formation complexe.</p>
</div>

<div class='section'>
<h2>Modalités</h2>
<ul>
<li><strong>Achat en ligne</strong> via notre site internet</li>
<li><strong>Installation professionnelle</strong> par nos partenaires certifiés</li>
<li><strong>Support technique</strong> et maintenance incluse</li>
<li><strong>Partenariats</strong> avec les fabricants de machines à café</li>
</ul>
</div>
",
  active = "offre.html"
)

impact <- page_html(
  "Impact environnemental",
  "
<div class='section'>
<h2>Notre impact positif</h2>

<h3>🌊 Économie d'eau</h3>
<p>
Réduction significative de la consommation d'eau pour le nettoyage 
des contenants réutilisables dans les espaces professionnels.
</p>

<h3>♻️ Promotion de la réutilisation</h3>
<p>
En facilitant le nettoyage, nous encourageons l'usage de contenants 
réutilisables plutôt que jetables, réduisant ainsi les déchets plastiques.
</p>

<h3>🔧 Durabilité</h3>
<p>
Matériaux durables et recyclables (inox, aluminium, cuivre) pour une 
longue durée de vie et un impact réduit.
</p>
</div>

<div class='section'>
<h2>Bénéfices pour votre entreprise</h2>
<ul>
<li>Réduction de l'empreinte environnementale</li>
<li>Amélioration de l'image RSE</li>
<li>Contribution aux objectifs de développement durable</li>
<li>Bien-être des collaborateurs avec des espaces plus hygiéniques</li>
</ul>
</div>
",
  active = "impact.html"
)

contact <- page_html(
  "Contact",
  "
<div class='section'>
<h2>Contactez-nous</h2>
<p>
Vous êtes intéressé par notre solution ? Vous avez des questions sur 
l'installation ou la compatibilité avec vos équipements ?
</p>
<p>
Notre équipe est à votre disposition pour échanger sur votre projet 
et vous proposer une solution adaptée à vos besoins.
</p>
</div>

<div class='section'>
<h2>Demande d'information</h2>
<p>
Pour toute demande, n'hésitez pas à nous contacter :
</p>
<ul>
<li><strong>Email :</strong> contact@eco-cafe.fr</li>
<li><strong>Téléphone :</strong> À venir</li>
<li><strong>Site web :</strong> En cours de développement</li>
</ul>
</div>

<div class='section'>
<h2>Notre équipe</h2>
<p>
Projet porté par une équipe pluridisciplinaire passionnée par l'innovation 
durable et les solutions éco-responsables.
</p>
</div>
",
  active = "contact.html"
)

# =====================
# ÉCRITURE DES FICHIERS
# =====================
writeLines(index,   "pages/index.html")
writeLines(projet,  "pages/projet.html")
writeLines(offre,   "pages/offre.html")
writeLines(impact,  "pages/impact.html")
writeLines(contact, "pages/contact.html")

# =====================
# OUVERTURE DU SITE
# =====================
browseURL(normalizePath("pages/index.html"))