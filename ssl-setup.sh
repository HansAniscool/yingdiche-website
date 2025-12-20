#!/bin/bash

# SSL证书自动配置脚本
# 适用于云服务器部署

# 安装Certbot（Let's Encrypt）
sudo apt update
sudo apt install certbot python3-certbot-nginx -y

# 申请SSL证书
sudo certbot --nginx -d yingdiche.cn -d www.yingdiche.cn

# 设置自动续期
sudo crontab -l | { cat; echo "0 12 * * * /usr/bin/certbot renew --quiet"; } | sudo crontab -

echo "SSL证书配置完成！"
echo "您的网站现在可以通过 https://yingdiche.cn 访问"
