pipeline {
    agent {
        node {
            label 'windows'
        }
    }
    stages {
        stage('模型静态分析') {
            steps {
                echo '模型静态分析及报告生成(simulink check)'
            }
        }
        stage('单元测试') {
            steps {
                echo '模型单元测试及报告生成(simulink test)'
            }
        }
        stage('代码生成') {
            steps {
                echo '代码生成'
                runMATLABCommand 'CodeGenerate'
            }
        }
        stage('代码静态检查') {
            steps {
                echo 'polyspace bug finder检查及报告生成'
            }
        }
        stage('代码动态测试') {
            steps {
                echo 'polyspace code prover动态测试及报告生成'
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
        nohup = 'G:\\Import\\Git\\usr\\bin'
        SHELL = 'G:\\Import\\Git\\bin\\sh.exe'
        PATH = 'G:\\APP\\Matlab\\bin\\win64;G:\\Import\\Git\\bin\\sh.exe'
    }
}