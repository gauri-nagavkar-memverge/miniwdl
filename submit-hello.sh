workflow_queue=gn-mmbatch13miniwdl-workflow
miniwdl-aws-submit hello.wdl --workflow-queue ${workflow_queue} name=world \
  --image memverge/miniwdl-mmab:0.0.2 \
  --s3upload s3://gn-mmab-miniwdl-0403 \
  --verbose --follow --no-cache

