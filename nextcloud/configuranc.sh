#!/bin/bash
echo "Esse script Ativa e desativa apps dentro do Nextcloud"

#Colocar o Nextcloud em modo de manuntenção
echo "Vou colocar o Nextcloud em modo de manutenção para as mudificações necessárias" 
#docker exec --user www-data nextcloud php occ maintenance:mode on


#Escanear arquivos 
echo "Escaneando arquivos novos ..."
docker exec --user www-data nextcloud php occ files:scan --all
echo "arquivos escaneados"

#Exemplos de install / enable / disable
#docker exec --user www-data nextcloud php occ app:install 
#docker exec --user www-data nextcloud php occ app:enable 
#docker exec --user www-data nextcloud php occ app:disable

echo "Agora vamos ativar alguns apps úteis!"
#Instalação dos pacotes
#Enabled:  
#- occweb
#---
docker exec --user www-data nextcloud php occ app:install occweb
#docker exec --user www-data nextcloud php occ app:enable occweb
#docker exec --user www-data nextcloud php occ app:disable
#---
#- extract:
#---
docker exec --user www-data nextcloud php occ app:install extract 
docker exec --user www-data nextcloud php occ app:enable extract
#---  
#- files_rightclick:
#---
docker exec --user www-data nextcloud php occ app:install files_rightclick
docker exec --user www-data nextcloud php occ app:enable files_rightclick
#---
#- flowupload:
#---
docker exec --user www-data nextcloud php occ app:install flowupload
docker exec --user www-data nextcloud php occ app:enable flowupload
#---
#- occweb:   
#---
#docker exec --user www-data nextcloud php occ app:install occweb
#docker exec --user www-data nextcloud php occ app:enable occweb

#---
#- uploaddetails:
#---
#docker exec --user www-data nextcloud php occ app:install occweb
#docker exec --user www-data nextcloud php occ app:enable occweb
#---
echo " Apps instalados, agora desativar alguns que não usamos!"
#Disabled:  
#- activity
docker exec --user www-data nextcloud php occ app:disable activity
#- admin_audit  
docker exec --user www-data nextcloud php occ app:disable admin_audit
#- dashboard  
docker exec --user www-data nextcloud php occ app:disable dashboard
#- encryption  
docker exec --user www-data nextcloud php occ app:disable encryption
#- files_external  
docker exec --user www-data nextcloud php occ app:disable files_external
#- firstrunwizard   
docker exec --user www-data nextcloud php occ app:disable firstrunwizard
#- user_ldap
docker exec --user www-data nextcloud php occ app:disable user_ldap

echo "muito bom agora vamos tirar o nextclou do modo de manutenção pra começar a diversão :D"
docker exec --user www-data nextcloud php occ maintenance:mode off

