# Munich DataViz Dashboard

An interactive R/Shiny application for analyzing relationships between tourism, housing permits, and rental prices in Munich (2013–2025).

## Features

* **Interactive Heatmap:** Rental prices (€/m²) by building year and apartment size
* **Time Series:** Population, overnight stays, and average rental prices over time
* **Per Capita Analysis:** Housing permits issued per 1,000 residents
* **Customizable Filters:** Explore data by year, city district, and apartment size
* **Data Export:** Download displayed data as CSV

## Requirements

* **R (≥4.2)**
* **renv** for package management
* (Optional) **Docker & Docker Compose** for container deployment

## Setup & Usage

1. **Clone the Repository**

```bash
git clone https://github.com/<your-username>/munich-dataviz-dashboard.git
cd munich-dataviz-dashboard
```

2. **Install Dependencies**

```r
renv::restore()
```

3. **Run the App**

* Using R:

```r
shiny::runApp()
```

* Using Docker:

```bash
docker-compose up --build
```

## Project Structure

```
munich-dataviz-dashboard/
├── data/            # Raw and processed datasets
├── figures/         # Static image outputs
├── scripts/         # Data processing scripts
├── app.R            # Main Shiny app file
├── report.Rmd       # R Markdown analysis report
├── install.R        # R package installation script
└── renv.lock        # Package version snapshot
```

## Data Sources

* **Mietspiegel 2025** – City of Munich
* **Population & Tourism Data** – BY-Open-Data
* **Building Permits** – BY-Open-Data

## License

MIT © 2025 Kilian Maier
