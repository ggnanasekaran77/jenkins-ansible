job('Job-DSL-Hello-World-Job') {
    scm {
        git('git@github.com:ggnanasekaran77/jenkins.git')
    }
    triggers {
        scm('H/15 * * * *')
    }
    steps {
        shell ('echo "Hello World"')
    }
}
