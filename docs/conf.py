# docs/conf.py
# -*- coding: utf-8 -*-

import os
from datetime import datetime

# --- Podstawy projektu ---
project = "OTCv8 Developer Documentation"
author = "lukaszj321"
current_year = datetime.now().year
copyright = f"{current_year}, {author}"
language = "pl"

# --- Rozszerzenia ---
extensions = [
    "myst_parser",
    "sphinx_copybutton",
    "sphinx_design",
    "sphinx_sitemap",
    "sphinxext.opengraph",
    "sphinx_favicon",
    "sphinxcontrib.mermaid",
    "sphinx_codeautolink",
]

# MyST (Markdown w Sphinx)
myst_enable_extensions = [
    "colon_fence",
    "linkify",
    "attrs_block",
    "deflist",
    "tasklist",
]
# automatyczne kotwice do H2/H3/H4
myst_heading_anchors = 3

# --- Wejście/wyjście dokumentów ---
# Sphinx 7+: root_doc zamiast master_doc
root_doc = "index"

# Obsługuj zarówno .md jak i .rst (jeśli się trafią)
source_suffix = {
    ".md": "markdown",
    ".rst": "restructuredtext",
}

# Wykluczamy śmieci, backupy i build
exclude_patterns = [
    "_build",
    "Thumbs.db",
    ".DS_Store",
    "**/__md_backup_*",
    "**/__md_backup_*/*",
]

templates_path = ["_templates"]  # jeśli nie używasz, może zostać — Sphinx nie krzyczy

# --- Motyw / front ---
html_theme = "furo"
html_title = "OTCv8 Dev Docs"

html_static_path = ["_static"]
html_css_files = ["custom.css"]  # docs/_static/custom.css

# Kolory składni
pygments_style = "friendly"
pygments_dark_style = "native"

# Opcje motywu Furo (logotypy w docs/_static/img/)
html_theme_options = {
    "light_logo": "img/logo-light.svg",  # -> docs/_static/img/logo-light.svg
    "dark_logo": "img/logo-dark.svg",    # -> docs/_static/img/logo-dark.svg
    "sidebar_hide_name": True,
    "announcement": "📣 Dev build dokumentacji (auto z CI).",
}

# --- GitHub Pages / sitemap / kanoniczne linki (ważne dla -b dirhtml) ---
html_baseurl = "https://lukaszj321.github.io/otcv8-dev/"
sitemap_url_scheme = "{link}"  # bez .html, poprawne URL-e w dirhtml

# --- OpenGraph (ładne podglądy linków) ---
ogp_site_url = "https://lukaszj321.github.io/otcv8-dev/"
ogp_image = "https://lukaszj321.github.io/otcv8-dev/_static/cover.png"  # wgraj plik

# --- Favicons (pliki w docs/_static/) ---
favicons = [
    {"rel": "icon", "href": "favicon.svg"},
    # możesz dodać więcej wariantów jeśli chcesz
]

# --- Copybutton (pomija prompt w kopiowaniu) ---
copybutton_prompt_text = r">>> |\.\.\. |\$ "
copybutton_prompt_is_regexp = True

# --- Mermaid (opcjonalnie jawna wersja runtime) ---
mermaid_version = "10.9.1"

# --- CodeAutoLink (basic, bez autodoc) ---
codeautolink_autodoc_inject = False

# --- Drobiazgi przydatne na Pages ---
html_show_sphinx = False  # ukryj "Built with Sphinx"
