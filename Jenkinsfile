pipeline {
    agent any
    
    parameters {
        stringParam(defaultValue: "dummy", description: 'Countries jar version', name: 'countries_version')
        stringParam(defaultValue: "dummy", description: 'Airports jar version', name: 'airports_version')
    }
 
    environment {
        COUNTRIES_VERSION = ${params.countries_version}
        AIRPORTS_VERSION  = ${params.airports_version}
    }

    stages {
        stage('UpdateCountries') {
            when {
                expression { params.COUNTRIES_VERSION != 'dummy' }
            }
            steps {
                sh 'docker-compose up --no-deps -d lunatech-countries'
            }
        }
        stage('UpdateAirports') {
            when {
                expression { params.AIRPORTS_VERSION != 'dummy' }
            }
            steps {
                sh 'docker-compose up --no-deps -d lunatech-airports'
            }
        }
    }
}
