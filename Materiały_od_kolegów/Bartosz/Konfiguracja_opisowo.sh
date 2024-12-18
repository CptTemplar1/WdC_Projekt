KONFIGURACJA URZĄDZEŃ SIECIOWYCH BARTOSZA

############################################################################################################
#Centrum
#Router0
enable
configure terminal

service timestamps log datetime msec
no service timestamps debug datetime msec
service password-encryption

hostname Router0

enable password 7 0822455D0A16

aaa new-model
aaa authentication login default group tacacs+ local

no ip cef
no ipv6 cef

username cisco secret 5 $1$mERr$hx5rVt7rPNoS4wqbXKX7m0

license udi pid CISCO1941/K9 sn FTX1524PNC4-

ip domain-name router0

spanning-tree mode pvst

interface Loopback0
 no ip address
 shutdown
 exit

interface GigabitEthernet0/0
 ip address 193.168.1.1 255.255.255.0
 duplex auto
 speed auto
 exit

interface GigabitEthernet0/1
 no ip address
 duplex auto
 speed auto
 shutdown
 exit

interface Serial0/0/0
 ip address 1.0.0.2 255.0.0.0
 exit

interface Serial0/0/1
 ip address 5.0.0.1 255.0.0.0
 clock rate 2000000
 exit

interface Serial0/1/0
 ip address 4.0.0.1 255.0.0.0
 clock rate 2000000
 exit

interface Serial0/1/1
 no ip address
 clock rate 2000000
 exit

interface Vlan1
 no ip address
 shutdown
 exit

router rip
 network 1.0.0.0
 network 2.0.0.0
 network 3.0.0.0
 network 4.0.0.0
 network 5.0.0.0
 network 192.168.1.0
 network 192.168.2.0
 network 193.168.1.0
 network 194.168.1.0
 network 195.168.1.0
 network 196.168.10.0
 network 196.168.20.0
 exit

ip classless
ip flow-export version 9

tacacs-server host 193.168.1.3
tacacs-server key cisco

logging 193.168.1.3

line con 0
 password 7 0822455D0A16
 login authentication default
 exit

line aux 0
 exit

line vty 0 4
 password 7 0822455D0A16
 transport input ssh
 exit

line vty 5 15
 password 7 0822455D0A16
 transport input ssh
 exit

ntp server 193.168.1.3

end



#Router1
enable
configure terminal

no service timestamps log datetime msec
no service timestamps debug datetime msec
service password-encryption

hostname Router

enable password 7 0822455D0A16

no ip cef
no ipv6 cef

license udi pid CISCO1941/K9 sn FTX1524HY87-

spanning-tree mode pvst

interface GigabitEthernet0/0
 no ip address
 duplex auto
 speed auto
 exit

interface GigabitEthernet0/0.10
 encapsulation dot1Q 10
 ip address 192.168.1.1 255.255.255.0
 exit

interface GigabitEthernet0/0.20
 encapsulation dot1Q 20
 ip address 192.168.2.2 255.255.255.0
 exit

interface GigabitEthernet0/1
 no ip address
 duplex auto
 speed auto
 shutdown
 exit

interface Serial0/0/0
 ip address 1.0.0.1 255.0.0.0
 clock rate 2000000
 exit

interface Serial0/0/1
 ip address 2.0.0.1 255.0.0.0
 exit

interface Serial0/1/0
 ip address 6.0.0.1 255.0.0.0
 exit

interface Serial0/1/1
 no ip address
 clock rate 2000000
 exit

interface Vlan1
 no ip address
 shutdown
 exit

router rip
 network 1.0.0.0
 network 2.0.0.0
 network 3.0.0.0
 network 4.0.0.0
 network 5.0.0.0
 network 6.0.0.0
 network 192.168.1.0
 network 192.168.2.0
 network 193.168.1.0
 network 194.168.1.0
 network 195.168.1.0
 network 196.168.10.0
 network 196.168.20.0
 exit

ip classless
ip flow-export version 9

line con 0
 password 7 0822455D0A16
 login
 exit

line aux 0
 exit

line vty 0 4
 password 7 0822455D0A16
 login
 exit

line vty 5 15
 password 7 0822455D0A16
 login
 exit

end


#Router2
enable
configure terminal

no service timestamps log datetime msec
no service timestamps debug datetime msec
service password-encryption

hostname Router2

enable password 7 0822455D0A16

no ip cef
no ipv6 cef

username cisco secret 5 $1$mERr$hx5rVt7rPNoS4wqbXKX7m0

license udi pid CISCO1941/K9 sn FTX15246M6S-

ip domain-name router2

spanning-tree mode pvst

interface GigabitEthernet0/0
 ip address 194.168.1.1 255.255.255.0
 duplex auto
 speed auto
 exit

interface GigabitEthernet0/1
 ip address 195.168.1.1 255.255.255.0
 duplex auto
 speed auto
 exit

interface Serial0/0/0
 ip address 2.0.0.2 255.0.0.0
 clock rate 2000000
 exit

interface Serial0/0/1
 ip address 3.0.0.1 255.0.0.0
 exit

interface Vlan1
 no ip address
 shutdown
 exit

router rip
 network 1.0.0.0
 network 2.0.0.0
 network 3.0.0.0
 network 4.0.0.0
 network 5.0.0.0
 network 172.16.0.0
 network 192.168.1.0
 network 192.168.2.0
 network 193.168.1.0
 network 194.168.1.0
 network 195.168.1.0
 network 196.168.10.0
 network 196.168.20.0
 network 197.168.1.0
 network 198.168.1.0
 exit

ip classless
ip flow-export version 9

line con 0
 password 7 0822455D0A16
 login
 exit

line aux 0
 exit

line vty 0 4
 password 7 0822455D0A16
 login local
 transport input ssh
 exit

line vty 5 15
 password 7 0822455D0A16
 login
 exit

end




#Router5
enable
configure terminal

no service timestamps log datetime msec
no service timestamps debug datetime msec
no service password-encryption

hostname Router5

no ip cef
no ipv6 cef

license udi pid CISCO1941/K9 sn FTX1524B6EX-

spanning-tree mode pvst

interface GigabitEthernet0/0
 ip address 197.168.1.1 255.255.255.0
 duplex auto
 speed auto
 exit

interface GigabitEthernet0/1
 ip address 198.168.1.1 255.255.255.0
 duplex auto
 speed auto
 exit

interface Serial0/0/0
 ip address 5.0.0.2 255.0.0.0
 exit

interface Serial0/0/1
 ip address 3.0.0.2 255.0.0.0
 clock rate 2000000
 exit

interface Serial0/1/0
 ip address 7.0.0.1 255.0.0.0
 exit

interface Serial0/1/1
 no ip address
 clock rate 2000000
 exit

interface Vlan1
 no ip address
 shutdown
 exit

router rip
 network 1.0.0.0
 network 2.0.0.0
 network 3.0.0.0
 network 4.0.0.0
 network 5.0.0.0
 network 7.0.0.0
 network 172.16.0.0
 network 192.168.1.0
 network 192.168.2.0
 network 193.168.1.0
 network 194.168.1.0
 network 195.168.1.0
 network 196.168.10.0
 network 196.168.20.0
 network 197.168.1.0
 exit

ip classless
ip route 0.0.0.0 0.0.0.0 197.168.1.2
ip flow-export version 9

line con 0
 exit

line aux 0
 exit

line vty 0 4
 login
 exit

end


############################################################################################################
#ACL
#Router3
enable
configure terminal

no service timestamps log datetime msec
no service timestamps debug datetime msec
no service password-encryption

hostname Router

no ip cef
no ipv6 cef

license udi pid CISCO2911/K9 sn FTX1524KB94-

spanning-tree mode pvst

interface GigabitEthernet0/0
 no ip address
 duplex auto
 speed auto
 shutdown
 exit

interface GigabitEthernet0/1
 ip address 196.168.10.1 255.255.255.0
 ip access-group 100 in
 duplex auto
 speed auto
 exit

interface GigabitEthernet0/2
 ip address 196.168.20.1 255.255.255.0
 ip access-group 100 in
 duplex auto
 speed auto
 exit

interface Serial0/3/0
 ip address 4.0.0.2 255.0.0.0
 exit

interface Serial0/3/1
 no ip address
 clock rate 2000000
 exit

interface Vlan1
 no ip address
 shutdown
 exit

router rip
 network 1.0.0.0
 network 2.0.0.0
 network 3.0.0.0
 network 4.0.0.0
 network 192.168.1.0
 network 192.168.2.0
 network 193.168.1.0
 network 194.168.1.0
 network 195.168.1.0
 network 196.168.10.0
 network 196.168.20.0
 exit

ip classless
ip flow-export version 9

access-list 100 permit icmp any any
access-list 100 deny ip any 196.168.10.0 0.0.0.255
access-list 100 deny ip 196.168.10.0 0.0.0.255 any
access-list 100 permit ip any any

line con 0
 exit

line aux 0
 exit

line vty 0 4
 login
 exit

end


#Switch8
enable
configure terminal

no service timestamps log datetime msec
no service timestamps debug datetime msec
no service password-encryption

hostname Switch

spanning-tree mode pvst
spanning-tree extend system-id

interface FastEthernet0/1
 exit

interface FastEthernet0/2
 exit

interface FastEthernet0/3
 exit

interface FastEthernet0/4
 exit

interface FastEthernet0/5
 exit

interface FastEthernet0/6
 exit

interface FastEthernet0/7
 exit

interface FastEthernet0/8
 exit

interface FastEthernet0/9
 exit

interface FastEthernet0/10
 exit

interface FastEthernet0/11
 exit

interface FastEthernet0/12
 exit

interface FastEthernet0/13
 exit

interface FastEthernet0/14
 exit

interface FastEthernet0/15
 exit

interface FastEthernet0/16
 exit

interface FastEthernet0/17
 exit

interface FastEthernet0/18
 exit

interface FastEthernet0/19
 exit

interface FastEthernet0/20
 exit

interface FastEthernet0/21
 exit

interface FastEthernet0/22
 exit

interface FastEthernet0/23
 exit

interface FastEthernet0/24
 exit

interface GigabitEthernet0/1
 exit

interface GigabitEthernet0/2
 exit

interface Vlan1
 no ip address
 shutdown
 exit

line con 0
 exit

line vty 0 4
 login
 exit

line vty 5 15
 login
 exit

end


#Switch9
enable
configure terminal

no service timestamps log datetime msec
no service timestamps debug datetime msec
no service password-encryption

hostname Switch

spanning-tree mode pvst
spanning-tree extend system-id

interface FastEthernet0/1
 exit

interface FastEthernet0/2
 exit

interface FastEthernet0/3
 exit

interface FastEthernet0/4
 exit

interface FastEthernet0/5
 exit

interface FastEthernet0/6
 exit

interface FastEthernet0/7
 exit

interface FastEthernet0/8
 exit

interface FastEthernet0/9
 exit

interface FastEthernet0/10
 exit

interface FastEthernet0/11
 exit

interface FastEthernet0/12
 exit

interface FastEthernet0/13
 exit

interface FastEthernet0/14
 exit

interface FastEthernet0/15
 exit

interface FastEthernet0/16
 exit

interface FastEthernet0/17
 exit

interface FastEthernet0/18
 exit

interface FastEthernet0/19
 exit

interface FastEthernet0/20
 exit

interface FastEthernet0/21
 exit

interface FastEthernet0/22
 exit

interface FastEthernet0/23
 exit

interface FastEthernet0/24
 exit

interface GigabitEthernet0/1
 exit

interface GigabitEthernet0/2
 exit

interface Vlan1
 no ip address
 shutdown
 exit

line con 0
 exit

line vty 0 4
 login
 exit

line vty 5 15
 login
 exit

end



############################################################################################################
#DHCP, NTP, CISCO IOS, TACACS+
#Switch1
enable
configure terminal

service timestamps log datetime msec
no service timestamps debug datetime msec
service password-encryption

hostname Switch1

enable password 7 0822455D0A16

ip domain-name switch1

username cisco secret 5 $1$mERr$hx5rVt7rPNoS4wqbXKX7m0

spanning-tree mode pvst
spanning-tree extend system-id

interface FastEthernet0/1
 exit

interface FastEthernet0/2
 exit

interface FastEthernet0/3
 exit

interface FastEthernet0/4
 exit

interface FastEthernet0/5
 exit

interface FastEthernet0/6
 exit

interface FastEthernet0/7
 exit

interface FastEthernet0/8
 exit

interface FastEthernet0/9
 exit

interface FastEthernet0/10
 exit

interface FastEthernet0/11
 exit

interface FastEthernet0/12
 exit

interface FastEthernet0/13
 exit

interface FastEthernet0/14
 exit

interface FastEthernet0/15
 exit

interface FastEthernet0/16
 exit

interface FastEthernet0/17
 exit

interface FastEthernet0/18
 exit

interface FastEthernet0/19
 exit

interface FastEthernet0/20
 exit

interface FastEthernet0/21
 exit

interface FastEthernet0/22
 exit

interface FastEthernet0/23
 exit

interface FastEthernet0/24
 exit

interface GigabitEthernet0/1
 exit

interface GigabitEthernet0/2
 exit

interface Vlan1
 ip address 193.168.1.2 255.255.255.0
 exit

ip default-gateway 193.168.1.1

logging 193.168.1.3

line con 0
 password 7 0822455D0A16
 login
 exit

line vty 0 4
 password 7 0822455D0A16
 login local
 transport input ssh
 exit

line vty 5 15
 password 7 0822455D0A16
 login local
 transport input ssh
 exit

ntp server 193.168.1.3

end



############################################################################################################
#VLANs
#Switch0
enable
configure terminal

service timestamps log datetime msec
no service timestamps debug datetime msec
service password-encryption

hostname Switch

enable password 7 0822455D0A16

spanning-tree mode pvst
spanning-tree extend system-id

interface FastEthernet0/1
 switchport mode trunk
 exit

interface FastEthernet0/2
 switchport access vlan 10
 switchport mode access
 exit

interface FastEthernet0/3
 switchport access vlan 20
 switchport mode access
 exit

interface FastEthernet0/4
 exit

interface FastEthernet0/5
 exit

interface FastEthernet0/6
 exit

interface FastEthernet0/7
 exit

interface FastEthernet0/8
 exit

interface FastEthernet0/9
 exit

interface FastEthernet0/10
 exit

interface FastEthernet0/11
 exit

interface FastEthernet0/12
 exit

interface FastEthernet0/13
 exit

interface FastEthernet0/14
 exit

interface FastEthernet0/15
 exit

interface FastEthernet0/16
 exit

interface FastEthernet0/17
 exit

interface FastEthernet0/18
 exit

interface FastEthernet0/19
 exit

interface FastEthernet0/20
 exit

interface FastEthernet0/21
 exit

interface FastEthernet0/22
 exit

interface FastEthernet0/23
 exit

interface FastEthernet0/24
 exit

interface GigabitEthernet0/1
 exit

interface GigabitEthernet0/2
 exit

interface Vlan1
 ip address 192.168.1.2 255.255.255.0
 exit

interface Vlan2
 ip address 192.168.1.5 255.255.255.252
 exit

interface Vlan3
 ip address 192.168.1.9 255.255.255.252
 exit

ip default-gateway 192.168.1.1

line con 0
 password 7 0822455D0A16
 login
 exit

line vty 0 4
 password 7 0822455D0A16
 login
 exit

line vty 5 15
 password 7 0822455D0A16
 login
 exit

end



############################################################################################################
#ZPF
#Router6
enable
configure terminal

no service timestamps log datetime msec
no service timestamps debug datetime msec
no service password-encryption

hostname Router6

no ip cef
no ipv6 cef

license udi pid CISCO1941/K9 sn FTX1524B1Z1-
license boot module c1900 technology-package securityk9

spanning-tree mode pvst

class-map type inspect match-all IN-NET-CLASS-MAP
 match access-group 101
 exit

policy-map type inspect IN-2-OUT-PMAP
 class type inspect IN-NET-CLASS-MAP
  inspect
 exit
 exit

zone security IN-ZONE
zone security OUT-ZONE
zone-pair security IN-2-OUT-ZPAIR source IN-ZONE destination OUT-ZONE
 service-policy type inspect IN-2-OUT-PMAP
 exit

interface GigabitEthernet0/0
 ip address 198.168.1.1 255.255.255.0
 zone-member security IN-ZONE
 duplex auto
 speed auto
 exit

interface GigabitEthernet0/1
 ip address 192.168.3.1 255.255.255.0
 duplex auto
 speed auto
 exit

interface Serial0/0/0
 ip address 7.0.0.2 255.0.0.0
 zone-member security OUT-ZONE
 clock rate 2000000
 exit

interface Serial0/0/1
 ip address 10.2.2.1 255.255.255.252
 clock rate 2000000
 exit

interface Vlan1
 no ip address
 shutdown
 exit

router rip
 network 7.0.0.0
 network 197.168.1.0
 network 198.168.1.0
 exit

ip classless
ip route 0.0.0.0 0.0.0.0 10.2.2.2 

ip flow-export version 9

access-list 101 permit ip 198.168.1.0 0.0.0.255 any

line con 0
 login
 exit

line aux 0
 exit

line vty 0 4
 password ciscovtypa55
 login
 exit

end


#Switch12
enable
configure terminal

no service timestamps log datetime msec
no service timestamps debug datetime msec
no service password-encryption

hostname Switch

spanning-tree mode pvst
spanning-tree extend system-id

interface FastEthernet0/1
 exit
interface FastEthernet0/2
 exit
interface FastEthernet0/3
 exit
interface FastEthernet0/4
 exit
interface FastEthernet0/5
 exit
interface FastEthernet0/6
 exit
interface FastEthernet0/7
 exit
interface FastEthernet0/8
 exit
interface FastEthernet0/9
 exit
interface FastEthernet0/10
 exit
interface FastEthernet0/11
 exit
interface FastEthernet0/12
 exit
interface FastEthernet0/13
 exit
interface FastEthernet0/14
 exit
interface FastEthernet0/15
 exit
interface FastEthernet0/16
 exit
interface FastEthernet0/17
 exit
interface FastEthernet0/18
 exit
interface FastEthernet0/19
 exit
interface FastEthernet0/20
 exit
interface FastEthernet0/21
 exit
interface FastEthernet0/22
 exit
interface FastEthernet0/23
 exit
interface FastEthernet0/24
 exit
interface GigabitEthernet0/1
 exit
interface GigabitEthernet0/2
 exit

interface Vlan1
 no ip address
 shutdown
 exit

line con 0
 exit

line vty 0 4
 login
 exit

line vty 5 15
 login
 exit

end


############################################################################################################
#SPAN
#Switch2
enable
configure terminal

no service timestamps log datetime msec
no service timestamps debug datetime msec
service password-encryption

hostname Switch2

enable password 7 0822455D0A16

spanning-tree mode pvst
spanning-tree extend system-id

interface FastEthernet0/1
 exit
interface FastEthernet0/2
 exit
interface FastEthernet0/3
 exit
interface FastEthernet0/4
 exit
interface FastEthernet0/5
 exit
interface FastEthernet0/6
 exit
interface FastEthernet0/7
 exit
interface FastEthernet0/8
 exit
interface FastEthernet0/9
 exit
interface FastEthernet0/10
 exit
interface FastEthernet0/11
 exit
interface FastEthernet0/12
 exit
interface FastEthernet0/13
 exit
interface FastEthernet0/14
 exit
interface FastEthernet0/15
 exit
interface FastEthernet0/16
 exit
interface FastEthernet0/17
 exit
interface FastEthernet0/18
 exit
interface FastEthernet0/19
 exit
interface FastEthernet0/20
 exit
interface FastEthernet0/21
 exit
interface FastEthernet0/22
 exit
interface FastEthernet0/23
 exit
interface FastEthernet0/24
 exit
interface GigabitEthernet0/1
 exit
interface GigabitEthernet0/2
 exit

interface Vlan1
 ip address 194.168.1.2 255.255.255.0
 exit

ip default-gateway 194.168.1.1

line con 0
 password 7 0822455D0A16
 login
 exit

line vty 0 4
 password 7 0822455D0A16
 login
 exit

line vty 5 15
 password 7 0822455D0A16
 login
 exit

monitor session 1 source interface Fa0/1
monitor session 1 destination interface Fa0/2

end



############################################################################################################
#STP
#Switch3
enable
configure terminal

no service timestamps log datetime msec
no service timestamps debug datetime msec
no service password-encryption

hostname Switch3

no ip domain-lookup

spanning-tree mode pvst
spanning-tree extend system-id
spanning-tree vlan 1 priority 24576

interface FastEthernet0/1
 exit
interface FastEthernet0/2
 exit
interface FastEthernet0/3
 exit
interface FastEthernet0/4
 exit
interface FastEthernet0/5
 exit
interface FastEthernet0/6
 exit
interface FastEthernet0/7
 exit
interface FastEthernet0/8
 exit
interface FastEthernet0/9
 exit
interface FastEthernet0/10
 exit
interface FastEthernet0/11
 exit
interface FastEthernet0/12
 exit
interface FastEthernet0/13
 exit
interface FastEthernet0/14
 exit
interface FastEthernet0/15
 exit
interface FastEthernet0/16
 exit
interface FastEthernet0/17
 exit
interface FastEthernet0/18
 exit
interface FastEthernet0/19
 exit
interface FastEthernet0/20
 exit
interface FastEthernet0/21
 exit
interface FastEthernet0/22
 exit
interface FastEthernet0/23
 exit
interface FastEthernet0/24
 exit
interface GigabitEthernet0/1
 exit
interface GigabitEthernet0/2
 exit

interface Vlan1
 no ip address
 shutdown
 exit

line con 0
 login
 exit

line vty 0 4
 login
 exit

line vty 5 15
 login
 exit

end


#Switch4
enable
configure terminal

no service timestamps log datetime msec
no service timestamps debug datetime msec
no service password-encryption

hostname Switch4

no ip domain-lookup

spanning-tree mode pvst
spanning-tree extend system-id
spanning-tree vlan 1 priority 28672

interface FastEthernet0/1
 exit
interface FastEthernet0/2
 exit
interface FastEthernet0/3
 exit
interface FastEthernet0/4
 exit
interface FastEthernet0/5
 exit
interface FastEthernet0/6
 exit
interface FastEthernet0/7
 exit
interface FastEthernet0/8
 exit
interface FastEthernet0/9
 exit
interface FastEthernet0/10
 exit
interface FastEthernet0/11
 exit
interface FastEthernet0/12
 exit
interface FastEthernet0/13
 exit
interface FastEthernet0/14
 exit
interface FastEthernet0/15
 exit
interface FastEthernet0/16
 exit
interface FastEthernet0/17
 exit
interface FastEthernet0/18
 exit
interface FastEthernet0/19
 exit
interface FastEthernet0/20
 exit
interface FastEthernet0/21
 exit
interface FastEthernet0/22
 exit
interface FastEthernet0/23
 exit
interface FastEthernet0/24
 exit
interface GigabitEthernet0/1
 exit
interface GigabitEthernet0/2
 exit

interface Vlan1
 no ip address
 shutdown
 exit

line con 0
 login
 exit

line vty 0 4
 login
 exit

line vty 5 15
 login
 exit

end



#Switch5
enable
configure terminal

no service timestamps log datetime msec
no service timestamps debug datetime msec
no service password-encryption

hostname Switch5

no ip domain-lookup

spanning-tree mode pvst
spanning-tree extend system-id

interface FastEthernet0/1
 exit
interface FastEthernet0/2
 exit
interface FastEthernet0/3
 exit
interface FastEthernet0/4
 exit
interface FastEthernet0/5
 exit
interface FastEthernet0/6
 exit
interface FastEthernet0/7
 exit
interface FastEthernet0/8
 exit
interface FastEthernet0/9
 exit
interface FastEthernet0/10
 exit
interface FastEthernet0/11
 exit
interface FastEthernet0/12
 exit
interface FastEthernet0/13
 exit
interface FastEthernet0/14
 exit
interface FastEthernet0/15
 exit
interface FastEthernet0/16
 exit
interface FastEthernet0/17
 exit
interface FastEthernet0/18
 exit
interface FastEthernet0/19
 exit
interface FastEthernet0/20
 exit
interface FastEthernet0/21
 exit
interface FastEthernet0/22
 exit
interface FastEthernet0/23
 exit
interface FastEthernet0/24
 exit
interface GigabitEthernet0/1
 exit
interface GigabitEthernet0/2
 exit

interface Vlan1
 no ip address
 shutdown
 exit

line con 0
 login
 exit

line vty 0 4
 login
 exit

line vty 5 15
 login
 exit

end



#Switch6
enable
configure terminal

no service timestamps log datetime msec
no service timestamps debug datetime msec
no service password-encryption

hostname Switch6

no ip domain-lookup

spanning-tree mode pvst
spanning-tree extend system-id

interface FastEthernet0/1
 exit
interface FastEthernet0/2
 exit
interface FastEthernet0/3
 spanning-tree portfast
 spanning-tree bpduguard enable
 exit
interface FastEthernet0/4
 spanning-tree portfast
 spanning-tree bpduguard enable
 exit
interface FastEthernet0/5
 exit
interface FastEthernet0/6
 exit
interface FastEthernet0/7
 exit
interface FastEthernet0/8
 exit
interface FastEthernet0/9
 exit
interface FastEthernet0/10
 exit
interface FastEthernet0/11
 exit
interface FastEthernet0/12
 exit
interface FastEthernet0/13
 exit
interface FastEthernet0/14
 exit
interface FastEthernet0/15
 exit
interface FastEthernet0/16
 exit
interface FastEthernet0/17
 exit
interface FastEthernet0/18
 exit
interface FastEthernet0/19
 exit
interface FastEthernet0/20
 exit
interface FastEthernet0/21
 exit
interface FastEthernet0/22
 exit
interface FastEthernet0/23
 exit
interface FastEthernet0/24
 exit
interface GigabitEthernet0/1
 exit
interface GigabitEthernet0/2
 exit

interface Vlan1
 no ip address
 shutdown
 exit

line con 0
 login
 exit

line vty 0 4
 login
 exit

line vty 5 15
 login
 exit

end



#Switch7
enable
configure terminal

no service timestamps log datetime msec
no service timestamps debug datetime msec
no service password-encryption

hostname Switch7

no ip domain-lookup

spanning-tree mode pvst
spanning-tree extend system-id

interface FastEthernet0/1
 exit
interface FastEthernet0/2
 exit
interface FastEthernet0/3
 spanning-tree portfast
 spanning-tree bpduguard enable
 exit
interface FastEthernet0/4
 spanning-tree portfast
 spanning-tree bpduguard enable
 exit
interface FastEthernet0/5
 exit
interface FastEthernet0/6
 exit
interface FastEthernet0/7
 exit
interface FastEthernet0/8
 exit
interface FastEthernet0/9
 exit
interface FastEthernet0/10
 exit
interface FastEthernet0/11
 exit
interface FastEthernet0/12
 exit
interface FastEthernet0/13
 exit
interface FastEthernet0/14
 exit
interface FastEthernet0/15
 exit
interface FastEthernet0/16
 exit
interface FastEthernet0/17
 exit
interface FastEthernet0/18
 exit
interface FastEthernet0/19
 exit
interface FastEthernet0/20
 exit
interface FastEthernet0/21
 exit
interface FastEthernet0/22
 exit
interface FastEthernet0/23
 exit
interface FastEthernet0/24
 exit
interface GigabitEthernet0/1
 exit
interface GigabitEthernet0/2
 exit

interface Vlan1
 no ip address
 shutdown
 exit

line con 0
 login
 exit

line vty 0 4
 login
 exit

line vty 5 15
 login
 exit

end
