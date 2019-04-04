resource "aws_key_pair" "deployer" {
  key_name = "deployer-key"
  public_key = "${var.instance_key}"
}

resource "aws_instance" "nodeapp" {
  ami                         = "${lookup(var.ami_linux_images, var.aws_region)}"
  instance_type               = "t2.micro"
  associate_public_ip_address = "true"
  subnet_id                   = "${aws_subnet.PublicAZA.id}"
  vpc_security_group_ids      = ["${aws_security_group.FrontEnd.id}"]
  key_name = "${aws_key_pair.deployer.key_name}"
  tags {
    Name = "nodeapp"
  }
  user_data = <<HEREDOC
 #!/bin/bash
 yum update -y
 yum install -y gcc-c++ make
 curl -sL https://rpm.nodesource.com/setup_6.x | sudo -E bash -
 yum install nodejs -y
 mkdir -p "${var.instance_user_home}"/nodeproject
 cd "${var.instance_user_home}"/nodeproject
 npm install express
 npm init -y
 echo "let express = require('express')" >> index.js
 echo "let app = express();" >> index.js
 echo "var port = process.env.PORT || 4000;" >> index.js
 echo "app.get('/', (req, res) => res.send('Hello World with Express'));" >> index.js
 echo "app.listen(port, function () {console.log('Running RestHub on port ' + port);});" >> index.js
 echo "let apiRoutes = require('./api-routes')" >> index.js
 echo "app.use('/api', apiRoutes)" >> index.js
 echo "let router = require('express').Router();" >> api-routes.js
 echo "router.get('/', function (req, res) {res.json({message: 'Automation for the People',timestamp: new Date().getTime()});});" >> api-routes.js
 echo "module.exports = router;" >> api-routes.js
 node index
HEREDOC
}