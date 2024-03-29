--- arpd.c.orig	Sun Feb  9 05:20:40 2003
+++ arpd.c	Wed Sep  1 13:38:11 2004
@@ -265,7 +265,7 @@
 	    spa->addr_ip, tha->addr_eth, tpa->addr_ip);
 	
 	if (op == ARP_OP_REQUEST) {
-		syslog(LOG_DEBUG, __FUNCTION__ ": who-has %s tell %s",
+		syslog(LOG_DEBUG, "%s: who-has %s tell %s", __FUNCTION__,
 		    addr_ntoa(tpa), addr_ntoa(spa));
 	} else if (op == ARP_OP_REPLY) {
 		syslog(LOG_INFO, "arp reply %s is-at %s",
@@ -282,7 +282,7 @@
 	int error;
 
 	if (addr_cmp(addr, &arpd_ifent.intf_addr) == 0) {
-		syslog(LOG_DEBUG, __FUNCTION__ ": %s at %s",
+		syslog(LOG_DEBUG, "%s: %s at %s", __FUNCTION__,
 		    addr_ntoa(addr), addr_ntoa(&arpd_ifent.intf_link_addr));
 		return (0);
 	}
@@ -291,10 +291,10 @@
 	error = arp_get(arpd_arp, &arpent);
 	
 	if (error == -1) {
-		syslog(LOG_DEBUG, __FUNCTION__ ": no entry for %s",
+		syslog(LOG_DEBUG, "%s: no entry for %s", __FUNCTION__,
 		    addr_ntoa(addr));
 	} else {
-		syslog(LOG_DEBUG, __FUNCTION__ ": %s at %s",
+		syslog(LOG_DEBUG, "%s: %s at %s", __FUNCTION__,
 		    addr_ntoa(addr), addr_ntoa(&arpent.arp_ha));
 	}
 	return (error);
@@ -423,7 +423,7 @@
 		if ((req = SPLAY_FIND(tree, &arpd_reqs, &tmp)) != NULL) {
 			addr_pack(&src.arp_ha, ADDR_TYPE_ETH, ETH_ADDR_BITS,
 			    ethip->ar_sha, ETH_ADDR_LEN);
-			syslog(LOG_DEBUG, __FUNCTION__ ": %s at %s",
+			syslog(LOG_DEBUG, "%s: %s at %s", __FUNCTION__,
 			    addr_ntoa(&req->pa), addr_ntoa(&src.arp_ha));
 			
 			/* This address is claimed */

