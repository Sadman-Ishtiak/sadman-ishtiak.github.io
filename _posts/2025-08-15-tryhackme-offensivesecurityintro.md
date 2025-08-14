---
title: Trying to learn hacking using tryhackme Offensive Security Intro 
date: 2025-08-02 00:00:00 +0600
categories: [Hacking, offensivesecurityintro]
tags: [tryhackme, offensivesecurityintro, hacking, gobuster]     # TAG names should always be lowercase
description: "The first room of tryhackme"
math: true
---
# Offensive Security Intro
This room is given to us as a walkthrough the note consists of only the knowledge from the room

## What is Offensive Security?
There are two things types of general tasks in cyber security.
1. Offensive security involves breaking into systems, exploiting software bugs and finding loopholes to gain unauthorized access.
2. Defensive security is the opposite of offensive and involves knowing and preventing those exploits.
## Hacking your first machine
This part of the room gives a website and a terminal access which can be used to do an attack on a website. we use the tool `gobuster` which is a terminal based tool that is used to brute force directories on web server. According to the kali website,
```txt
Gobuster is a tool used to brute-force: URIs (directories and files) in web sites, DNS subdomains (with wildcard support), Virtual Host names on target web servers, Open Amazon S3 buckets, Open Google Cloud buckets and TFTP servers.
```
we used the tool in the virtual macihne and given the directed command
```bash
gobuster -u http://fakebank.thm -w wordlist.txt dir
```
and this gives an output
![Gobuster in the working](/assets/images/thm-offensivecybersecurity-gobuster.png)
/bank transfer directory gives http code 200 (accepted) so when we go there we find that this is an admin panel where we can control and transfer money.
## Careers in cyber security
There are a lot of tools available similar to the one used with previous task and we desparately need a lot of cyber security professionals. Some of the roles learning offensive cyber security gives are
1. Penetration Tester - Responsible for testing technology products for finding exploitable security vulnerabilities.
2. Red Teamer - Plays the role of an adversary, attacking an organization and providing feedback from an enemy's perspective.
3. Security Engineer - Design, monitor, and maintain security controls, networks, and systems to help prevent cyberattacks.
