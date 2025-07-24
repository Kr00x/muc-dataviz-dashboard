# 📊 Munich DataViz Dashboard

**Interactive R/Shiny Dashboard** zur Untersuchung des Zusammenspiels von Tourismus, Wohnungsbau und Mietentwicklung in München (2013–2025).

---

## 🚀 Features

- **Heatmap**: Durchschnittsmiete pro m² nach Baujahr und Wohnungsgröße  
- **Zeitreihen**: Vergleich von Bevölkerungs- und Tourismus‑Wachstum vs. Mietpreisentwicklung  
- **Per‑Capita‑Barplot**: Genehmigte Wohnungen pro 1.000 Einwohner  
- **Interaktive Analyse**: Filter nach Jahr, Bezirk und Wohnflächenklasse  
- **Datenexport**: CSV-Download aller aktuell angezeigten Daten

---

## 📦 Voraussetzungen

- R (≥ 4.2)  
- [renv](https://rstudio.github.io/renv/)  
- Docker & Docker Compose (optional, für Container-Deployment)

---

## ⚙️ Installation

1. **Repository klonen**  
   ```bash
   git clone https://github.com/<dein-user>/munich-dataviz-dashboard.git
   cd munich-dataviz-dashboard
