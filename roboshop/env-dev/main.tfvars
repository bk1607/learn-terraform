instances = {
  frontend = {
    name = "frontend"
    type = "t3.small"
    Monitor = "yes"
  }
  catalogue = {
    name = "catalogue"
    type = "t3.small"
    Monitor = "yes"
  }
  user = {
    name = "user"
    type = "t3.small"
    Monitor = "yes"
  }
  cart = {
    name = "cart"
    type = "t3.small"
    Monitor = "yes"
  }
  shipping = {
    name = "shipping"
    type = "t3.small"
    Monitor = "yes"
  }
  payment = {
    name = "payment"
    type = "t3.small"
    Monitor = "yes"
  }
  redis = {
    name = "redis"
    type = "t3.small"
  }
  mysql = {
    name = "mysql"
    type = "t3.small"
  }
  mongodb = {
    name = "mongodb"
    type = "t3.small"
  }
  rabbitmq = {
    name = "rabbitmq"
    type = "t3.small"
  }
  dispatch = {
    name= "dispatch"
    type= "t3.small"
    Monitor = "yes"
  }
}
env = "dev"