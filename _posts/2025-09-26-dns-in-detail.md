---
title: tryhackme room "DNS in Detail" solving experience 
date: 2025-09-26 00:00:00 +0600
categories: [Hacking, Tryhackme]
tags: [tryhackme, dns, hacking]     # TAG names should always be lowercase
description: "Learning the basics of DNS"
math: true
---
# What is DNS
DNS stands for Domain Name System. Every computer in the internet uses IP addresses to communicate with each other or even addressing each other. Computers can easily store the ip addresses which are numerical with very high effeciency. But for us human it is not possible to memorize these numbers. DNS comes cluches here by being the intermidiary between the computer language of ip addresses and human readable urls. that we use. DNS basically is the global computer system which takes URL from the computers as input and gives back IP addresses for the targeted URL to the user as output.

## Domain Hierarchy
Domain Hierarchy is basically a system where the url address is divided into multiple parts so the DNS server does not have to store all the domain addresses in the same server computer. so there are multiple layers which we use the domain name. they are in order,

1. **Root level domain:** Root level domain is the first server the domain resolve request goes to. There are multiple root level domain servers. They all have the same data stored in the memory and they use them to send the domain request to the subsequent level, which is the top level domain. All DNS requests goes to the root level domain and then the root level domain checks the top level domain and sends the domain request to that subsequent server for that domain.
2. **Top level domain:** Top level domain is the second level in the DNS system. All websites must have a top level domain. Typically we can see them as `.com`, `.edu`, `.mil`, `.info`, `.org` etc. Top level domain servers then send the subsequent second level domain servers. if we take google.com the google is the second level domain. so the TLD server sends the request to the second level domain server.
3. **Second level domain:** Seocond level domain works similar to the top level domain and then the request is subsequnetly sent forward for the subdomain resoling.
4. **Subdomain :** Subdomains sits on the left of the second level domain with a period `.` to separate them. both second level domain and subdomain can be at most 63 character in length and lowercase english alphabet with 0-9 numbers and hyphen `-` but no consecutive hyphen and no starting and ending hyphen. But we can spilt multiple subdomain split with period but the total length still cannot be more than 253 characters.

## Record Types
DNS can also be used for other types or record other than website URLs. Some of the common ones are, 

1. **A record:** returns back IPV4 address. 
2. **AAAA record:** returns back IPV6 address.
3. **CNAME record:** returns the the domain for the host holder. for example if we have a used another service and use that to host a portion of the website or service we use CNAME to use our subdomain to use that url. if we go by definitions, `A CNAME (Canonical Name) record is a Domain Name System (DNS) record that acts as an alias, pointing one domain name (the alias) to another, "true" domain name (the canonical name). It's used to simplify domain management by allowing multiple hostnames or subdomains to point to the same destination server or service, such as mapping www.example.com to example.com, or directing various services like email or content delivery networks (CDNs) to a single, true domain.`
4. **MX record:** A mail exchanger record (MX record) specifies the mail server responsible for accepting email messages on behalf of a domain name. This record comes with a priority flag to tell which order each server is and should be tried when main server goes down.
5. **TXT record:** TXT records contain information that helps external network servers and services handle outgoing email from your domain. Google and Gmail use TXT records to verify domain ownership, ensure email security, and prevent spam and phishing. we can put any text text types of data in the TXT record. 

## DNS request resolving process
When we make a DNS request the following things happen sequentially,

1. **Cache check:** First the computer checks if the resolved address is in the computer's cache or not. if it is there it just works with the resolved cache.
2. **Recursive DNS:** if it is not in cache then the recursive DNS server generally provided by the ISP or user can choose it by themselves. The DNS server also checks it's own cache first before trying to resolve it. if it doesnt find it in the cache it goes to the root DNS server.
3. **Root DNS:** The root DNS server then sends the request to the correct top level domain server.
4. **Top Level DNS:** The top level DNS server checks the second level name and sends it to the correct authoratitive DNS server which maintains the subdomains for that second level domain.
5. **Authoratitive DNS:** Sends the accurate address by the secondary level domain name in the server of the correct secondary level name's specific authoratitive server.

## Terminal commands for DNS analysis
we used `nslookup` for dns checking.

1. Basic Checking
```bash
nslookup shop.website.thm
```
2. Getting IPV4
```bash
nslookup --type=A website.thm
```
3. Getting CNAME
```bash
nslookup --type=CNAME shop.website.thm
```
4. Getting TXT
```bash
nslookup --type=TXT website.thm
```
5. Getting MX record
```bash
nslookup --type=MX website.thm
```