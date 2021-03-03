pipeline {
    agent {
        node {
            label 'windows'
        }
    }
    stages {
        stage('MIL测试') {
            steps {
                echo '模型MIL测试及报告生成'
                runMATLABCommand 'MIL_test'
            }
        }
        stage('单元测试') {
            steps {
                echo '模型单元测试及报告生成'
            }
        }
        stage('代码生成') {
            steps {
                echo '代码生成'
                runMATLABCommand 'CodeGenerate'
            }
        }
        stage('代码bug finder检查') {
            steps {
                echo 'bug finder静态检查及报告生成'
                runMATLABCommand 'BugFinder'
            }
        }
        stage('代码code prover检查') {
            steps {
                echo 'code prover静态检查及报告生成'
                runMATLABCommand 'CodeProver'
            }
        }
        stage('代码动态测试') {
            steps {
                echo 'SIL-软件在环测试'
            }
        }
        stage('HIL测试') {
            steps {
                echo 'HIL测试'
            }
        }
        stage('实车测试') {
            steps {
                echo '实车测试'
            }
        }
        stage('生产环境测试') {
            steps {
                echo '生产环境测试'
            }
        }
        
   }

    environment {
        nohup = 'D:\\software\\Git\\usr\\bin'
        SHELL = 'D:\\software\\Git\\bin\\sh.exe'
        PATH = 'D:\\software\\Polyspace\\R2020a\\bin\\win64;D:\\software\\Git\\bin\\sh.exe'
    }
}