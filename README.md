#安全 SSH 设置脚本

##介绍
这个脚本是参考文章

>["Secure Secure Shell" by stribika](https://stribika.github.io/2015/01/04/secure-secure-shell.html)

制作。能自动实现文中提到的大部分[^1]设置，提高 SSH 的安全性。使用前请仔细阅读上述文章和下面的说明。

##使用

### openssh 6 及以上版本
使用 `master` 分支。使用方法：

<pre><code>
sudo sh ./SSS.sh
sudo service ssh restart
</code></pre>

脚本会备份原来的 `/etc/ssh` 为 `/root/ssh.bak` ，**重启 `ssh` 服务前，请仔细检查 `sshd_conf`,`ssh_conf` 文件的设置，否则有可能导致无法登入服务器！**

### openssh 5
由于这个版本的 openssh 不支持某些加密算法，所以请使用 `oldOpenSSH` 分支。使用方法：

<pre><code>
sudo sh ./SSS.sh
sudo service ssh restart
</code></pre>

脚本会备份原来的 `/etc/ssh` 为 `/root/ssh.bak` ，**重启 `ssh` 服务前，请仔细检查 `sshd_conf`,`ssh_conf` 文件的设置，否则有可能导致无法登入服务器！**

##注释

[^1]: ["Secure Secure Shell"](https://stribika.github.io/2015/01/04/secure-secure-shell.html) 中 `Traffic analysis resistance` 部分没有实现，因为它依赖 `Tor`。

#Secure SSH script

##Introduction
This script is made according to

>["Secure Secure Shell" by stribika.](https://stribika.github.io/2015/01/04/secure-secure-shell.html)

It will carry out most settings[^1] in the aricle to improve the security of openssh. Read the article above and instructions below carefully before you use it.

##Usage

### openssh 6 and above
Use `master` branch:

<pre><code>
sudo sh ./SSS.sh
sudo service ssh restart
</code></pre>

Script will back up original `/etc/ssh` to `/root/ssh.bak` ，**before you restart `ssh` service，check `sshd_conf` and `ssh_conf` , incorrect settings can block you from logining to your computer!**

### openssh 5
Use `oldOpenSSH` branch:

<pre><code>
sudo sh ./SSS.sh
sudo service ssh restart
</code></pre>

Script will back up original `/etc/ssh` to `/root/ssh.bak` ，**before you restart `ssh` service，check `sshd_conf` and `ssh_conf` , incorrect settings can block you from logining to your computer!**

##注释

[^1]: `Traffic analysis resistance` in ["Secure Secure Shell"](https://stribika.github.io/2015/01/04/secure-secure-shell.html) is not considered in this script, since it use `Tor`.