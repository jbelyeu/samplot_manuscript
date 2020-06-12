# Samplot manuscript figure plots and data
Example data and commands for the figures in the samplot manuscript.

## To re-generate figures:
* Install samplot with `conda install -c bioconda samplot` (see https://github.com/ryanlayer/samplot)
* Get a copy of the GRCh37 reference genome (I recommend using GGD, see below)
* Edit the first line of the script `generate_figures.sh`. Replace `/uufs/chpc.utah.edu/common/HIPAA/u1072557/giab/ashkenazi_trio_dataset2/data/hs37d5.fa` with your own copy of the GRCh37 reference genome fasta
* Run the `bash generate_figures.sh` script. Figures will overwrite images in the plots directories


## GGD-managed reference genome
* Install GGD (`conda install -c bioconda ggd`)
* Install reference genome with ggd (`ggd install grch37-reference-genome-ensembl-v1`)
* Activate the new environment variable, which will be used by the `generate_figures.sh` script (ggd will print that command at the end of the install sequence)
* Continue with figure generation

Note: If you prefer not to use GGD, you'll need to re-assign the reference genome variable `b37_ref` in `generate_figures.sh` to the location of your own copy of that reference
