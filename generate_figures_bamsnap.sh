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



#supplemental figure 3A: bamsnap DEL
bamsnap -pos 1:156525704-156529936 \
    -bam $hg002_illumina\
    -title "Illumina (~300x 2x150bp)"\
    -show_clipped\
    -read_color_deletion 000000ff\
    -read_color_inversion 3115f7ff\
    -refversion hg19\
    -silence \
    -out plots/supplemental_figure3/DEL_1_156526704_156528936_bamsnap.png
rm plots/supplemental_figure3/DEL_1_156526704_156528936_bamsnap.png_bamsnap.log

#supplemental figure 3B bamsnap DUP
bamsnap -pos 4:99812786-99818098 \
    -bam $hg002_illumina\
    -title "Illumina (~300x 2x150bp)"\
    -show_clipped\
    -read_color_deletion 000000ff\
    -read_color_inversion 3115f7ff\
    -refversion hg19\
    -silence \
    -out plots/supplemental_figure3/DUP_4_99813786_99817098_bamsnap.png
rm plots/supplemental_figure3/DUP_4_99813786_99817098_bamsnap.png_bamsnap.log

#supplemental figure 3C: bamsnap INV
bamsnap -pos  12:12544367-12547113\
    -bam $hg002_illumina\
    -title "Illumina (~300x 2x150bp)"\
    -show_clipped\
    -read_color_deletion 000000ff\
    -read_color_inversion 3115f7ff\
    -refversion hg19\
    -silence \
    -out plots/supplemental_figure3/INV_12_12544867_12546613_bamsnap.png
rm plots/supplemental_figure3/INV_12_12544867_12546613_bamsnap.png_bamsnap.log

