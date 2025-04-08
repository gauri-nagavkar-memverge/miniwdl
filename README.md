# Running miniwdl on MMBatch

## How to run the scripts
### Option 1: Type the command in your Terminal, like so:

```
miniwdl-aws-submit HaplotypeCaller.aws.wdl \
    input_bam=s3://gatk-test-data/wgs_bam/NA12878_24RG_hg38/NA12878_24RG_small.hg38.bam \
    input_bam_index=s3://gatk-test-data/wgs_bam/NA12878_24RG_hg38/NA12878_24RG_small.hg38.bai \
    ref_dict=s3://broad-references/hg38/v0/Homo_sapiens_assembly38.dict \
    ref_fasta=s3://broad-references/hg38/v0/Homo_sapiens_assembly38.fasta \
    ref_fasta_index=s3://broad-references/hg38/v0/Homo_sapiens_assembly38.fasta.fai \
    scattered_calling_intervals_list=s3://gatk-test-data/intervals/hg38_wgs_scattered_calling_intervals.txt \
    HaplotypeCaller.interval_padding=100 \
    gatk_docker=broadinstitute/gatk:4.0.0.0 \
    gatk_path=/gatk/gatk \
    HaplotypeCaller.java_opt="-Xms8000m" \
    MergeGVCFs.java_opt="-Xms8000m" \
    HaplotypeCaller.mem_size="10 GB" \
    MergeGVCFs.mem_size="30 GB" \
    --workflow-queue gn-mmbatch13miniwdl-workflow \ # REPLACE WITH YOUR WORKFLOW QUEUE
    --image memverge/miniwdl-mmab:0.0.2 \
    --s3upload s3://gn-mmab-miniwdl-0403 \ # REPLACE WITH YOUR s3 BUCKET
    --verbose --follow --no-cache4
```

### Option 2: Save the command in a .sh file and run the .sh file
```
bash submit-haplotypecaller.sh
```
