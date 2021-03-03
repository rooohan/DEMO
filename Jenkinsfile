pipeline {
    agent none
    stages {
        stage('MIL') {
	    agent {label "windows"}
            steps {
                echo 'start mil'
                runMATLABCommand 'MIL_test'
                echo 'CodeGenerate'
                runMATLABCommand 'CodeGenerate'
		stash(name: "abc", includes: "ControlVehicleVelocity_ert_rtw/*")
		
            }
        }

       stage('unstash') {
           agent {label "master"}
           steps {
               script {
                    echo 'start unstash'
                    String data_path =  "/home/cicd/local/jenkins/data/"+env.JOB_NAME
                    def folder = new File( data_path )
                    if( !folder.exists() ) {
                          folder.mkdirs()
                          println ( "创建" )
                    }
                    else{
                         folder.deleteDir()
                         folder.mkdirs()
                    }
					//dir是切换路径，此处切换至想要将传输的文件存放的位置
                    dir(data_path){
                        sh 'pwd'   
    			unstash("abc")
                    }

               }
           }
       }
        
   }

    environment {
        nohup = 'G:\\Import\\Git\\usr\\bin'
        SHELL = 'G:\\Import\\Git\\bin\\sh.exe'
        PATH = 'G:\\APP\\Matlab\\bin\\win64;G:\\Import\\Git\\bin\\sh.exe'
    }
}