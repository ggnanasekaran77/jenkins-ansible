#!/usr/bin/env groovy

def jobApi = new URL ("http://188.166.144.170:8081/api/json?tree=jobs[url]")
def jobs = new groovy.json.JsonSlurper().parse(jobApi.newReader())
jobs.jobs.each {
println (it.url)
}
