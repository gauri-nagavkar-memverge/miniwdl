miniwdl-aws-submit scatter-gather.wdl \
    --input '{"inputFiles":["s3://gn-mmab-miniwdl-0403/miniwdl_inputs/md5sum.input","s3://gn-mmab-miniwdl-0403/miniwdl_inputs/md5sum.2.input"],"docker":"memverge/miniwdl-mmab:0.0.2"}' \
    --workflow-queue gn-mmbatch13miniwdl-workflow \
    --image memverge/miniwdl-mmab:0.0.2 \
    --s3upload s3://gn-mmab-miniwdl-0403 \
    --verbose --follow --no-cache

