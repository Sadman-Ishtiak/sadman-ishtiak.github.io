---
title: tryhackme room "Networking Concepts" solving experience 
date: 2025-10-17 00:00:00 +0600
categories: [Cybersecurity, TryHackMe]
tags: [tryhackme, hacking, networking, tcp/ip, osi]     # TAG names should always be lowercase
description: "tryhackme room Networking Concepts solving experience and tutorial note, and note on TCP/IP and OSI model."
math: true
---
## OSI Model
The OSI (Open Systems Interconnection) model is a conceptual model developed by the International Organization for Standardization (ISO) that describes how communications should occur in a computer network. It is divided into 7 Layers,

1. **Physical Layer :** Physical Layer is the wires and antenas which actually transport the data physically. Basically Wires, Ethernet cables, Fibre Optic, Wireless Signals etc.
2. **Data Link Layer :** DataLink Layer is responsible for node to node data transfer and error correction in the data transport process done in the physical layer. In short this layer package data into frames, manages MAC addresses, provide error control, and flow control in the physical layer.
3. **Network Layer :** Provides Logical Address to the devices in the network and handles data routing between the networks. Basically it provides IP addresses, routes data packets, forwards data through the networks, and allows different networks to be connected.
4. **Transport Layer :** The Transport Layer ensures reliable data transfer between two devices. It is responsible for segmentation, flow control, error recovery, and end-to-end communication. Protocols like TCP (Transmission Control Protocol) ensure reliable delivery with acknowledgments and retransmissions, while UDP (User Datagram Protocol) offers faster but less reliable transmission.
5. **Session Layer :** This layer manages and controls the dialogue (sessions) between two computers. It establishes, maintains, and terminates connections. It also handles session checkpoints and recovery, which allows data transfers to resume after a break in connection.
6. **Presentation Layer :** The Presentation Layer ensures that data is in a usable format and is where data encryption, compression, and translation occurs. For instance, it converts data between formats like ASCII to EBCDIC, or JPEG image encoding. It acts like a translator between the application and the network.
7. **Application Layer :** This is the layer closest to the end-user. It provides network services directly to user applications. Protocols like HTTP (for web browsing), FTP (for file transfer), SMTP (for email) operate at this layer. It's what users interact with when accessing network-based services.

### Summary
<table width="100%">
<tr>
<th>Layer Number</th>
<th>Layer Name</th>
<th>Main Function</th>
<th>Example Protocols and Standards</th>
</tr>
<tr>
<td>Layer 7</td>
<td>Application layer</td>
<td>Providing services and interfaces to applications</td>
<td>HTTP, FTP, DNS, POP3, SMTP, IMAP</td>
</tr>
<tr>
<td>Layer 6</td>
<td>Presentation layer</td>
<td>Data encoding, encryption, and compression</td>
<td>Unicode, MIME, JPEG, PNG, MPEG</td>
</tr>
<tr>
<td>Layer 5</td>
<td>Session layer</td>
<td>Establishing, maintaining, and synchronising sessions</td>
<td>NFS, RPC</td>
</tr>
<tr>
<td>Layer 4</td>
<td>Transport layer</td>
<td>End-to-end communication and data segmentation</td>
<td>UDP, TCP</td>
</tr>
<tr>
<td>Layer 3</td>
<td>Network layer</td>
<td>Logical addressing and routing between networks</td>
<td>IP, ICMP, IPSec</td>
</tr>
<tr>
<td>
Layer 2</td>
<td>Data link layer</td>
<td>Reliable data transfer between adjacent nodes</td>
<td>Ethernet (802.3), WiFi (802.11)</td>
</tr>
<tr>
<td>Layer 1</td>
<td>Physical layer</td>
<td>Physical data transmission media</td>
<td>Electrical, optical, and wireless signals</td>
</tr>
</table>

## TCP/IP Protocol
In TCP/IP(Transmission Control Protocol/Internet Protocol) we use 4 layers instead of 7 in OSI layers.


1. **Application Layer:** The OSI model application, presentation and session layers, i.e., layers 5, 6, and 7, are grouped into the application layer in the TCP/IP model.
2. **Transport Layer:** This is layer 4.
3. **Internet Layer:** This is layer 3. The OSI model’s network layer is called the Internet layer in the TCP/IP model.
4. **Link Layer:** This is layer 2.

and sometimes the TCP/IP specifically gives the physical layer and sometimes it combines with the Link layer.

<table width="100%">
<tr>
<th>Layer Number</th>
<th>ISO OSI Model</th>
<th>TCP/IP Model (RFC 1122)</th>
<th>Protocols</th>
</tr>
<tr>
<td>7</td>
<td>Application Layer</td>
<td rowspan=3>Application Layer</td>
<td rowspan=3>HTTP, HTTPS, FTP, POP3, SMTP, IMAP, Telnet, SSH</td>
</tr>
<tr>
<td>6</td>
<td>Presentation Layer</td>
</tr>
<tr>
<td>5</td>
<td>Session Layer</td>
</tr>
<tr>
<td>4</td>
<td>Transport Layer</td>
<td>Transport Layer</td>
<td>TCP, UDP</td>
</tr>
<tr>
<td>3</td>
<td>Network Layer</td>
<td>Internet Layer</td>
<td>IP, ICMP, IPSec</td>
</tr>
<tr>
<td>2</td>
<td>Data Link Layer</td>
<td>Link Layer</td>
<td>Ethernet 802.3, WiFi 802.11</td>
</tr>
<tr>
<td>1</td>
<td>Physical Layer</td>
</tr>
</table>

## In Depth of networking
IP Addresses and Subnet
IP addresses are **unique identifiers** for devices (**hosts**) on a network, essential for communication using the **TCP/IP protocol suite**. They're like a **postal address** for a device.

### **IPv4 Addresses**
The most common version is **IPv4** (IP version 4).

* **Structure:** An IPv4 address is **32 bits** long, comprised of **four octets** (8 bits each), separated by dots (e.g., `192.168.0.1`). Each octet's decimal value ranges from **0 to 255**.
* **Limitation:** The 32-bit structure yields approximately **$2^{32}$** (over 4 billion) unique addresses.
* **Reserved Addresses:**
    * The address ending in **.0** (e.g., `192.168.1.0`) is typically the **network address**.
    * The address ending in **.255** (e.g., `192.168.1.255`) is the **broadcast address**, which targets all hosts on the local network.

### **Network Configuration and Subnetting**

* **Commands:** You can check a host's IP address and network configuration using:
    * **Windows:** `ipconfig`
    * **Linux/UNIX:** `ifconfig` or `ip address show` (`ip a s`)
* **Subnet Mask:** The **subnet mask** (e.g., `255.255.255.0`) determines which part of the IP address defines the network and which defines the host.
* **CIDR Notation:** A subnet mask can be written in **CIDR notation** (e.g., `/24`).
    * `/24` means the **leftmost 24 bits** of the IP address are the **network part** and are the same for all devices in that subnet (e.g., `192.168.66.x`).
    * For a `/24` network like `192.168.66.0/24`, assignable host addresses range from **`192.168.66.1` to `192.168.66.254`**.

### **Private vs. Public IP Addresses**
* **Public IP Address:** Like a home postal address, it is globally unique and routable on the Internet.
* **Private IP Address:** Cannot be reached directly from the Internet. It's used for internal (local) networks, like houses in a compound.
    * **Private Ranges (RFC 1918):** These ranges must be memorized:
        * `10.0.0.0` - `10.255.255.255` (`10/8`)
        * `172.16.0.0` - `172.31.255.255` (`172.16/12`)
        * `192.168.0.0` - `192.168.255.255` (`192.168/16`)
    * **Internet Access:** Devices with private IPs need a router with a public IP and **Network Address Translation (NAT)** to access the Internet.

### **Routing**
* **Router:** Functions like a post office, forwarding data packets to the correct network.
* **Function:** Routers operate at **Layer 3** (the IP layer), inspecting the destination IP address to decide the best path (the next router) for a packet to reach its final destination.

### **IPv6**
* **IPv6** (IP version 6) is the newer version, designed to address the depletion of IPv4 addresses, though IPv4 remains the most common.


### **Port Numbers**
Both UDP and TCP use **port numbers** to identify the sending and receiving process on a host (which is identified by its IP address).

* A port number uses two octets (16 bits), allowing for **$2^{16} - 1 = 65,535$** possible ports.
* Valid port numbers range from **1 to 65535** (port 0 is reserved).

### **UDP (User Datagram Protocol)**

* **Type:** A simple, **connectionless** transport protocol.
* **Reliability:** It does **not** need to establish a connection and offers **no guarantee** of delivery; it does not acknowledge received packets.
* **Advantage:** Due to its lack of overhead, it is **faster** than protocols that provide delivery confirmation (like TCP), similar to sending standard mail without confirmation.

### **TCP (Transmission Control Protocol)**
* **Type:** A **connection-oriented** transport protocol.
* **Reliability:** It uses mechanisms to ensure **reliable data delivery**, acknowledging received packets.
    * **Sequence Numbers:** Each data octet has a sequence number, helping the receiver identify **lost or duplicated packets**.
    * **Acknowledgment Numbers:** The receiver sends an acknowledgment number specifying the last received octet.
* **Connection Establishment:** Before data is sent, a connection must be established using a **three-way handshake** involving two flags: **SYN** (Synchronize) and **ACK** (Acknowledgment):
    1.  **SYN:** Client sends a SYN packet to the server with its initial sequence number.
    2.  **SYN-ACK:** Server responds with a SYN-ACK packet, including its own initial sequence number.
    3.  **ACK:** Client completes the handshake by sending an ACK packet.

### **Encapsulation**
**Encapsulation** is the process where each layer of the network stack **adds a header** (and sometimes a trailer) to the unit of data it receives from the layer above it, and then passes the newly "encapsulated" unit to the layer below. This allows each layer to focus on its specific function without worrying about the functions of other layers.

#### **The Encapsulation Process (From Top to Bottom)**
The data unit takes on a different name at each stage:
1.  **Application Data:** The process starts with user data (e.g., an email or search query). The **Application Layer** formats this data according to the application protocol (e.g., HTTPS).
2.  **Transport Segment/Datagram:** The **Transport Layer** (TCP or UDP) adds its respective header.
    * For **TCP**, the data unit is called a **segment**.
    * For **UDP**, the data unit is called a **datagram**.
3.  **Network Packet:** The **Network Layer** (Internet Layer) adds an **IP header** (including the source and destination IP addresses) to the segment or datagram, creating an **IP packet**. This packet is routable over the Internet.
4.  **Data Link Frame:** The **Data Link Layer** (e.g., Ethernet or WiFi) receives the IP packet and adds the proper **header and trailer**, creating a **frame**.

#### **The Life of a Packet (Example Scenario)**
When searching for a room on a website like TryHackMe:
1.  **Application Layer:** Your web browser prepares an **HTTP request** (using HTTPS) containing the search query.
2.  **Transport Layer (TCP):** The **TCP** layer first establishes a connection via the **three-way handshake** with the server. Once established, the HTTP request is sent within **TCP segments**.
3.  **Network Layer (IP):** The **IP layer** adds the **source IP address** (your computer's IP) and the **destination IP address** (the server's IP) to form an **IP packet**.
4.  **Link Layer:** The link layer adds its necessary **header and trailer** to the packet to create a **frame**, which is then transmitted to the first router.
5.  **Routing:** Each intermediate **router removes the link layer header/trailer**, inspects the **destination IP address**, and then re-encapsulates the packet with the appropriate link layer header/trailer for the next hop, repeating this until the packet reaches the target network's router.
6.  **De-encapsulation:** The process is **reversed** at the receiving end, with each layer removing its corresponding header/trailer until the original application data is extracted and delivered to the server application.
