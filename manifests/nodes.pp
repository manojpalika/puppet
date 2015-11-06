node default {
     notify { 'Hello World': }
}

node /^manoj/ {
    include webapp-tomcat
}

