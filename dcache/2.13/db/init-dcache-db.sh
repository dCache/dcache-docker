su -c "createuser -U postgres --no-superuser --no-createrole --createdb dcache" postgres
su -c "createdb -O dcache -U postgres alarms" postgres
su -c "createdb -O dcache -U postgres chimera" postgres
su -c "createdb -O dcache -U postgres billing" postgres 
su -c "createdb -O dcache -U postgres pinmanager" postgres
su -c "createdb -O dcache -U postgres spacemanager" postgres
su -c "createdb -O dcache -U postgres transfermanager" postgres
su -c "createdb -O dcache -U postgres srm" postgres

