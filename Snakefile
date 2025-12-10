# Runs all notebooks in correct order using papermill

executed = directory("executed_notebooks")

rule all:
    input:
        "executed_notebooks/getData.ipynb",
        "executed_notebooks/dataIntegration.ipynb",
        "executed_notebooks/databaseSetup.ipynb",
        "executed_notebooks/visualizations.ipynb"

# 1. Data Acquisition Notebook

rule get_data:
    input:
        "data_collection/getData.ipynb"
    output:
        "executed_notebooks/getData.ipynb"
    shell:
        """
        papermill {input} {output}
        """
# 2. Data Cleaning / Integration Notebook

rule integrate_data:
    input:
        "data_cleaning/dataIntegration.ipynb"
    output:
        "executed_notebooks/dataIntegration.ipynb"
    shell:
        """
        papermill {input} {output}
        """
# 3. Database Setup Notebook

rule setup_database:
    input:
        "databaseSetup.ipynb"
    output:
        "executed_notebooks/databaseSetup.ipynb"
    shell:
        """
        papermill {input} {output}
        """
# 4. Analysis & Visualization Notebook

rule run_visualizations:
    input:
        "analysis/visualizations.ipynb"
    output:
        "executed_notebooks/visualizations.ipynb"
    shell:
        """
        papermill {input} {output}
        """
