# Configuration file for the Sphinx documentation builder.
#
# For the full list of built-in configuration values, see the documentation:
# https://www.sphinx-doc.org/en/master/usage/configuration.html

# -- Project information -----------------------------------------------------
# https://www.sphinx-doc.org/en/master/usage/configuration.html#project-information

# project = 'Workspace Login'
project = '' # Hacky, but disables the sidebar title. (The logo has the title)
copyright = '2023, Anthony Riesen, Nicholas Riesen'
author = 'Anthony Riesen, Nicholas Riesen'
release = '1.0.0'

# -- General configuration ---------------------------------------------------
# https://www.sphinx-doc.org/en/master/usage/configuration.html#general-configuration

extensions = []

templates_path = ['_templates']
exclude_patterns = []



# -- Options for HTML output -------------------------------------------------
# https://www.sphinx-doc.org/en/master/usage/configuration.html#options-for-html-output

html_theme = 'alabaster'
html_static_path = ['_static']
html_logo = 'Innovation Workspace Logo-Official-Scaled.png'
html_theme_options = {
        "body_min_width": "120%",
        "body_max_width": "200%",
}
