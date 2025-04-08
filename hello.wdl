workflow helloWorld {
    String name
    call sayHello { input: name=name }
}
task sayHello {
    String name
    command {
        for i in $(seq 1 120); do
            printf "[cromwell-say-hello] Iteration $i: hello to ${name} on $(date)\n"
            sleep 10
        done
    }
    output {
        String out = read_string(stdout())
    }
    runtime {
        docker: "archlinux:latest"
        maxRetries: 3
        preemptible: 2
    }
}
