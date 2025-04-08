version 1.0

## Workflow to calculate MD5 checksums for files and aggregate them
## Description: This workflow computes MD5 checksums for each input file in parallel and then aggregates them into a single checksum file.

workflow ga4ghMd5 {
  input {
    Array[File] inputFiles
    String docker = "memverge/miniwdl-mmab:0.0.2"
  }

  # Calculate MD5 checksums for each file in parallel
  scatter (oneFile in inputFiles) {
    call Md5Calculator {
      input:
        inputFile = oneFile,
        docker = docker
    }
  }

  # Aggregate the results
  call AggregateChecksums {
    input:
      inputFiles = Md5Calculator.checksumFile,
      docker = docker
  }

  output {
    File finalChecksum = AggregateChecksums.outputFile
  }
}


task Md5Calculator {
  input {
    File inputFile
    String docker
  }

  command {
    md5sum ~{inputFile} > checksum.txt
  }

  runtime {
    docker: docker
    memory: "512 MB"
    cpu: 1
  }

  output {
    File checksumFile = "checksum.txt"
  }
}


task AggregateChecksums {
  input {
    Array[File] inputFiles
    String docker
  }

  command <<<
    cat ~{sep=" " inputFiles} > all_checksums.txt
    md5sum all_checksums.txt > final_checksum.txt
  >>>

  runtime {
    docker: docker
    memory: "512 MB"
    cpu: 1
  }

  output {
    File outputFile = "final_checksum.txt"
  }
}

