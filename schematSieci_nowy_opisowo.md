SCHEMAT SIECI

3 Routery połączone ze sobą będące centrum sieci
R0 Se0/0/0 - R1 Se0/0/0
R1 Se0/0/1 - R2 Se0/0/0
R2 Se0/0/1 - R0 Se0/0/1

Od Routerów odchodzą poszczególne podsieci
PODSIEĆ 0 (DHCP, NTP, CISCO IOS, TACACS+)
R0 Gig0/0 - S0 Fa0/1
S0 Fa0/2 - PC0 Fa0
S0 Fa0/3 - Server0 Fa0
S0 Fa0/4 - PC1 Fa0

PODSIEĆ 1 (VLANY)
R1 Gig0/0 - S1 Fa0/1
S1 Fa0/2 - PC2 Fa0
S1 Fa0/3 - PC3 Fa0

PODSIEĆ 2 (ACL)
R0 Se0/1/0 - R3 Se0/3/0
R3 Gig0/1 - S2 Fa0/1
S2 Fa0/2 - PC4 Fa0
R3 Gig0/2 - S3 Fa0/1
S3 Fa0/2 - PC5 Fa0
S3 Fa0/3 - PC6 Fa0

PODSIEĆ 3 (STP)
R2 Gig0/1 - S4 Fa0/1
S4 Fa0/2 - S5 Fa0/2
S4 Fa0/3 - S6 Fa0/1
S5 Fa0/1 - S6 Fa0/2
S5 Fa0/3 - S7 Fa0/1
S6 Fa0/3 - S8 Fa0/2
S7 Fa0/2 - S8 Fa0/1
S7 Fa0/3 - PC7 Fa0
S7 Fa0/4 - PC8 Fa0
S8 Fa0/3 - PC9 Fa0
S8 Fa0/4 - PC10 Fa0

PODSIEĆ 4 (SPAN)
R2 Gig0/0 - S9 Fa0/1
S9 Fa0/2 - Sniffer0 Eth0
Sniffer0 Eth1 - PC12 Fa0
S9 Fa0/3 - PC11 Fa0

PODSIEĆ 5 (ZPF)
R2 Se0/1/0 - R4 Se0/0/0
R4 Gig0/0 - S10 Gig0/1
S10 Fa0/1 - PC13 Fa0