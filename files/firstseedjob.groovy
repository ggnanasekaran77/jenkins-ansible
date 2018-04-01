job('First-Seed-Job') {
    triggers {
        scm('*/02 * * * *')
    }   
    steps {
        
        dsl('''

        def user = "ggnanasekaran77"
        def repoApi = new URL("https://api.github.com/users/${user}/repos")
        def repos = new groovy.json.JsonSlurper().parse(repoApi.newReader())
        repos.each {
           def repoName = it.name
           println "Repo Name" +  repoName
           
           multibranchPipelineJob("${repoName}") {
               branchSources {
                   git {
                       remote("git@github.com:ggnanasekaran77/${repoName}.git")
                   }  
               }
              orphanedItemStrategy {
                  discardOldItems {
                  numToKeep(20)
                  }
              }
           }
        }


        ''')
     }
}
