miniwdl-aws-submit 2a_vcf_chrom_counter.wdl \                   
vcf_gz=s3://gn-mmab-miniwdl-0403/miniwdl_inputs/HG001_GRCh38_1_22_v4.2.1_benchmark.vcf.gz \
tbi=s3://gn-mmab-miniwdl-0403/miniwdl_inputs/HG001_GRCh38_1_22_v4.2.1_benchmark.vcf.gz.tbi \
--workflow-queue gn-mmbatch13miniwdl-workflow \
    --image memverge/miniwdl-mmab:0.0.2 \
    --s3upload s3://gn-mmab-miniwdl-0403 \
    --verbose --follow --no-cache

