parameters = [
  { name = "dev.frontend.catalogue_url", value = "http://catalogue-dev.devops2023.online:8080/;", type = "String"},
  { name = "dev.frontend.cart_url", value = "http://cart-dev.devops2023.online:8080/;", type = "String"},
  { name = "dev.frontend.shipping_url", value = "http://shipping-dev.devops2023.online:8080/;", type = "String"},
  { name = "dev.frontend.payment_url", value = "http://payment-dev.devops2023.online:8080/;", type = "String"},
  { name = "dev.frontend.user_url", value = "http://user-dev.devops2023.online:8080/;", type = "String"},
  { name = "dev.cart.redis_host", value = "redis-dev.devops2023.online", type = "String"},
  { name = "dev.cart.catalogue_host", value = "catalogue-dev.devops2023.online", type = "String"},
  { name = "dev.cart.catalogue_port", value = "8080", type = "String"},
  { name = "dev.catalogue.mongo", value = "true", type = "String"},
  { name = "dev.catalogue.mongo_url", value = "mongodb://mongodb-dev.devops2023.online:27017/catalogue", type = "String"},
  { name = "dev.payment.cart_port", value = "8080", type = "String"},
  { name = "dev.payment.user_port", value = "8080", type = "String"},
  { name = "dev.payment.cart_host", value = "cart-dev.devops2023.online", type = "String"},
  { name = "dev.payment.user_host", value = "user-dev.devops2023.online", type = "String"},
  { name = "dev.payment.amqp_host", value = "rabbitmq-dev.devops2023.online", type = "String"},
  { name = "dev.shipping.cart_endpoint", value = "cart-dev.devops2023.online:8080", type = "String"},
  { name = "dev.shipping.db_host", value = "mysql-dev.devops2023.online", type = "String"},
  { name = "dev.user.mongo", value = "true", type = "String"},
  { name = "dev.user.redis_host", value = "redis-dev.devops2023.online", type = "String"},
  { name = "dev.user.mongodb_url", value = "mongodb://mongodb-dev.devops2023.online:27017/users", type = "String"},
  { name = "dev.shipping.mysql_host", value = "mysql-dev.devops2023.online", type = "String"},
  { name = "dev.dispatch.amqp_host", value = "rabbitmq-dev.devops2023.online", type = "String"},
  { name = "dev.mongodb_url", value = "mongodb-dev.devops2023.online", type = "String"}

]

secrets = [
  { name = "dev.payment.amqp_user", value = "roboshop", type = "SecureString"},
  { name = "dev.payment.amqp_pass", value = "roboshop123", type = "SecureString"},
  { name = "dev.mysql.mysql_pass", value = "Roboshop@1", type = "SecureString"},
  { name = "dev.rabbitmq.amqp_user", value = "roboshop", type = "SecureString"},
  { name = "dev.rabbitmq.amqp_pass", value = "roboshop123", type = "SecureString"},
  { name = "dev.shipping.mysql_pass", value = "Roboshop@1", type = "SecureString"},
  { name = "dev.shipping.mysql_user", value = "root", type = "SecureString"},
  { name = "dev.dispatch.amqp_user", value = "roboshop", type = "SecureString"},
  { name = "dev.dispatch.amqp_pass", value = "roboshop123", type = "SecureString"},
  { name = "dev.docdb_user", value = "roboshop", type = "SecureString"},
  { name = "dev.docdb_pass", value = "roboshop123", type = "SecureString"},
  { name = "dev.rds_user", value = "roboshop", type = "SecureString"},
  { name = "dev.rds_pass", value = "roboshop123", type = "SecureString"}
]


