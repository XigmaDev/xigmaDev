#!/bin/bash
cp /etc/sysctl.conf /etc/sysctl.conf.backup.$(date +%F)
cat <<EOT >> /etc/sysctl.conf
### IMPROVE SYSTEM MEMORY MANAGEMENT ###
fs.file-max = 2097152
vm.swappiness = 10
vm.dirty_ratio = 60
vm.dirty_background_ratio = 2

### GENERAL NETWORK SECURITY OPTIONS ###
net.ipv4.tcp_syncookies = 1
net.ipv4.tcp_syn_retries = 2
net.ipv4.tcp_synack_retries = 2
net.ipv4.tcp_max_syn_backlog = 4096
net.ipv4.tcp_rfc1337 = 1
net.ipv4.tcp_fin_timeout = 15
net.ipv4.tcp_keepalive_time = 300
net.ipv4.tcp_keepalive_probes = 5
net.ipv4.tcp_keepalive_intvl = 15
net.ipv4.ip_forward = 0
net.ipv4.conf.all.forwarding = 0
net.ipv4.conf.default.forwarding = 0
net.ipv6.conf.all.forwarding = 0
net.ipv6.conf.default.forwarding = 0
net.ipv4.conf.all.send_redirects = 0
net.ipv4.conf.default.send_redirects = 0
net.ipv4.conf.all.accept_source_route = 0
net.ipv4.conf.default.accept_source_route = 0
net.ipv6.conf.all.accept_source_route = 0
net.ipv6.conf.default.accept_source_route = 0
net.ipv4.conf.all.rp_filter = 1
net.ipv4.conf.default.rp_filter = 1
net.ipv4.conf.all.accept_redirects = 0
net.ipv4.conf.default.accept_redirects = 0
net.ipv4.conf.all.secure_redirects = 0
net.ipv4.conf.default.secure_redirects = 0
net.ipv6.conf.all.accept_redirects = 0
net.ipv6.conf.default.accept_redirects = 0
net.ipv4.conf.all.log_martians = 1
net.ipv4.conf.default.log_martians = 1
net.ipv4.conf.all.bootp_relay = 0
net.ipv4.conf.all.proxy_arp = 0
net.ipv4.tcp_timestamps = 1
net.ipv4.icmp_echo_ignore_all = 0
net.ipv4.icmp_echo_ignore_broadcasts = 1
net.ipv4.icmp_ignore_bogus_error_responses = 1

### TUNING NETWORK PERFORMANCE ###
net.ipv4.tcp_congestion_control = htcp
net.ipv4.tcp_congestion_control = bbr
net.ipv4.tcp_notsent_lowat = 16384
net.core.default_qdisc = fq
net.ipv4.tcp_window_scaling = 1
net.ipv4.tcp_rmem = 8192 87380 16777216
net.ipv4.udp_rmem_min = 16384
net.core.rmem_default = 262144
net.core.rmem_max = 16777216
net.ipv4.tcp_wmem = 8192 65536 16777216
net.ipv4.udp_wmem_min = 16384
net.core.wmem_default = 262144
net.core.wmem_max = 16777216
net.core.somaxconn = 32768
net.core.netdev_max_backlog = 65536
net.core.dev_weight = 64
net.ipv4.tcp_max_tw_buckets = 1440000
net.ipv4.tcp_tw_recycle = 0
net.ipv4.tcp_tw_reuse = 1
net.ipv4.tcp_max_orphans = 16384
net.ipv4.tcp_orphan_retries = 0
net.ipv4.ipfrag_low_thresh = 196608
net.ipv6.ip6frag_low_thresh = 196608
net.ipv4.ipfrag_high_thresh = 262144
net.ipv6.ip6frag_high_thresh = 262144
net.ipv4.tcp_no_metrics_save = 1
net.ipv4.tcp_moderate_rcvbuf = 1
net.unix.max_dgram_qlen = 50
net.ipv4.neigh.default.gc_thresh3 = 2048
net.ipv4.neigh.default.gc_thresh2 = 1024
net.ipv4.neigh.default.gc_thresh1 = 32
net.ipv4.neigh.default.gc_interval = 30
net.ipv4.neigh.default.proxy_qlen = 96
net.ipv4.neigh.default.unres_qlen = 6
net.ipv4.tcp_ecn = 1
net.ipv4.tcp_reordering = 3
net.ipv4.tcp_retries2 = 15
net.ipv4.tcp_retries1 = 3
net.ipv4.tcp_slow_start_after_idle = 0
net.ipv4.tcp_fastopen = 3
net.ipv4.route.flush = 1
net.ipv6.route.flush = 1
net.core.optmem_max = 25165824
net.ipv4.tcp_mem = 65536 131072 262144
net.ipv4.udp_mem = 65536 131072 262144
net.ipv4.tcp_low_latency = 1

EOT

sysctl -p

echo "System memory and network settings updated successfully!"
