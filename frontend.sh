echo -e "\e[35minstalling nginx\e[0m"
sleep 1
yum install nginx -y
echo -e "\e[35mremoving old content\e[0m"
sleep 1
rm -rf /usr/share/nginx/html/*
systemctl enable nginx
systemctl start nginx
echo -e "\e[35mdownloading frontend content\e[0m"
sleep 1
curl -o /tmp/frontend.zip https://roboshop-artifacts.s3.amazonaws.com/frontend.zip
echo -e "\e[35mExtracting content\e[0m"
sleep 1
cd /usr/share/nginx/html
echo -e "\e[35mcopying Frontend config\e[0m"
sleep 1
unzip /tmp/frontend.zip
cp configs/nginx-roboshop.conf /etc/nginx/default.d/roboshop.conf

echo -e "\e[35mEnabling nginx\e[0m"
sleep 1
systemctl enable nginx

echo -e "\e[35mrestarting enginx nginx\e[0m"
sleep 1
systemctl restart nginx

#if any script is error the script should not continue to run
#we need to copy other configs into our script
