
# setting variable for filename
CSV_FILE=names.csv
PASSWORD=password




#Creating each user

while IFS= read $USERNAME
do
#check if username already exists
If [ $(getent passwd $USERNAME) ];
then
echo $USERNAME already exists
else
    sudo useradd -m -G developers -s /bin/bash $USERNAME
    sudo echo -e "$PASSWORD\n$PASSWORD" | sudo passwd "${USERNAME}""
    mkdir home/$USERNAME/home/.ssh
    touch home/$USERNAME/home/.ssh/authorized_keys
    bash -c "cat .ssh/id_rsa.pub >> home/$USERNAME/.ssh/authorized_keys"

fi
done < $CSV_FILE    
