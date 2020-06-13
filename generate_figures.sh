#!/bin/bash
set -e
b37_ref=${ggd_grch37_reference_genome_ensembl_v1_file}
hg002_illumina="data/HG002.hs37d5.300x.subset.bam"
hg003="data/HG003.hs37d5.300x.subset.bam"
hg004="data/HG004.hs37d5.300x.subset.bam"
hg002_ont="data/HG002_ONTrel2_16x_RG_HP10xtrioRTG.subset.bam"
hg002_pb="data/HG002_PB_70x_RG_HP10XtrioRTG.subset.bam"
eiee_15_0022958="data/15-0022958.subset.bam"
repeats="data/repeats_trf.bed.gz"
genes="data/Homo_sapiens.GRCh37.87.sorted.gff3.gz"

#figure 1
samplot plot \
    -c 1 -s 156526704 -e 156528936 \
    -o plots/figure1/DEL_1_156526704_156528936.png\
    -b \
    $hg002_illumina\
    $hg002_ont\
    -n "Illumina (~300x 2x150bp)" "PacBio (~70X HP-partitioned)" \
    -t DEL\
    -A $repeats\
    --annotation_filenames "Tandem Repeat Finder"\
    --separate_mqual 10\
    --start_ci 223,223 --end_ci 223,223 \
    -T $genes\
    --transcript_filename "GRCh37 Genes"

#figure 2A
samplot plot \
    -c 4 -s 99813786 -e 99817098 \
    -o plots/figure2/DUP_4_99813786_99817098.png\
    -b \
     $hg002_illumina\
    -n "Illumina (~300x 2x150bp)" "ONT (~7x ultralong)"\
    -t DUP -H 2

#figure 2B
samplot plot \
    -c 12 -s 12544867 -e 12546613 \
    -o plots/figure2/INV_12_12544867-12546613.png\
    -b \
     $hg002_illumina\
    -n "Illumina (~300x 2x150bp)" \
    -t INV -H 2

#figure 2C
samplot plot \
    -c 2 -s 59405747 -e 59405747 \
    -c X -s 151118513 -e 151118513 \
    -o plots/figure2/CTX_2-X_59405747-151118513_59405747-151118513.png\
    -b \
     $eiee_15_0022958\
    -n "Illumina (~30x 2x150bp)"\
    -t CTX -H 2

#supplemental figure 1A
svviz $b37_ref\
    1 156526704 156528936 \
    -b $hg002_illumina\
    -b $hg002_pb\
    -t 'del'\
    -e plots/supplemental_figure1/DEL_1_156526704_156528936.svviz.svg\

#supplemental figure 2A: svviz DUP
svviz $b37_ref\
    4 99813786 99817098 \
    -b $hg002_illumina\
    -b $hg002_pb\
    -t 'insertion' \
    -e plots/supplemental_figure2/DUP_4_99813786_99817098_all_types.svviz.svg\

#supplemental figure 2B: svviz INV
svviz $b37_ref\
    12 12544867 12546613 \
    -b $hg002_illumina\
    -b $hg002_pb\
    -t 'inv' \
    -e plots/supplemental_figure2/INV_12_12544867_12546613_all_types.svviz.svg\

#supplemental figure 2C: svviz no variant
svviz $b37_ref\
    1 156532935 156534935 \
    -b $hg002_illumina\
    -b $hg002_pb\
    -t 'del' \
    -e plots/supplemental_figure2/1_156532935_156534935_all_types.svviz.svg\

#supplemental figure 4: trio
samplot plot \
    -c 1 -s 156526704 -e 156528936 \
    -o plots/supplemental_figure4/DEL_1_156526704_156528936_trio.png\
    -b \
     $hg002_illumina\
     $hg003\
     $hg004\
     -n "HG002 (child)" "HG003 (father)" "HG004 (mother)"\
    -t DEL

#supplemental figure 5A
samplot plot \
    -c 4 -s 99813786 -e 99817098 \
    -o plots/supplemental_figure5/DUP_4_99813786_99817098_all_types.png \
    -b \
     $hg002_illumina\
     $hg002_ont\
     $hg002_pb\
    -n "Illumina (~300x 2x150bp)" "ONT (~7x ultralong)" "PacBio (~70X HP-partitioned)"\
    -t DUP

#supplemental figure 5B
samplot plot \
    -c 12 -s 12544867 -e 12546613 \
    -o plots/supplemental_figure5/INV_12_12544867_12546613_all_types.png \
    -b \
     $hg002_illumina\
     $hg002_ont\
     $hg002_pb\
    -n "Illumina (~300x 2x150bp)" "ONT (~7x ultralong)" "PacBio (~70X HP-partitioned)"\
    -t INV

#supplemental figure 5C
samplot plot \
    -c 1 -s 156532935 -e 156534935 \
    -o plots/supplemental_figure5/1_156532935_156534935_all_types.png\
    -b \
     $hg002_illumina\
     $hg002_ont\
     $hg002_pb\
    -n "Illumina (~300x 2x150bp)" "ONT (~7x ultralong)" "PacBio (~70X HP-partitioned)"


