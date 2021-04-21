# Descactivate security from google website 
# Lien https://myaccount.google.com/lesssecureapps

# Indicate proxy parameters if necessary 
Sys.setenv(https_proxy = "url_proxy")
library(mailR)

  
# Send email 
send.mail(from="jean.bertin@gmail.com",
          to= c("jean.bertin@gmail.com"),
          subject= "bonjour, ceci est un test",
          body= "Recevez vous bien ce mail de test depuis Rstudio ? ",
          html=T,
          smtp=list(host.name = "smtp.gmail.com",
                      port = 465,
                      user.name = "jean.bertin@gmail.com",
                      passwd = "MonPassword",
                      ssl = T), 
                      authenticate=T)
  



