# et:ts=4
# portdepends.tcl
# $Id: portdepends.tcl 41527 2008-11-05 14:38:06Z pguyot@kallisys.net $
#
# Copyright (c) 2002 - 2003 Apple Computer, Inc.
# All rights reserved.
#
# Redistribution and use in source and binary forms, with or without
# modification, are permitted provided that the following conditions
# are met:
# 1. Redistributions of source code must retain the above copyright
#    notice, this list of conditions and the following disclaimer.
# 2. Redistributions in binary form must reproduce the above copyright
#    notice, this list of conditions and the following disclaimer in the
#    documentation and/or other materials provided with the distribution.
# 3. Neither the name of Apple Computer, Inc. nor the names of its contributors
#    may be used to endorse or promote products derived from this software
#    without specific prior written permission.
# 
# THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
# AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
# IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
# ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER OR CONTRIBUTORS BE
# LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR
# CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
# SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS
# INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN
# CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE)
# ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE
# POSSIBILITY OF SUCH DAMAGE.
#

package provide portdepends 1.0
package require portutil 1.0

# define options
options depends_build depends_run depends_lib depends
# Export options via PortInfo
options_export depends_build depends_lib depends_run

option_proc depends_build validate_depends_options
option_proc depends_run validate_depends_options
option_proc depends_lib validate_depends_options

# New option for the new dependency. We generate a warning because we don't handle this yet.
option_proc depends validate_depends_options_new

set_ui_prefix

proc validate_depends_options {option action {value ""}} {
    global targets
    switch $action {
		set {
			foreach depspec $value {
			    # port syntax accepts colon-separated junk that we do not understand yet.
				switch -regex $depspec {
					^(lib|bin|path):([-A-Za-z0-9_/.${}^?+()|\\\\]+):([-._A-Za-z0-9]+)$ {}
					^(port)(:.+)?:([-._A-Za-z0-9]+)$ {}
					default { return -code error [format [msgcat::mc "invalid depspec: %s"] $depspec] }
				}
			}
		}
    }
}

proc validate_depends_options_new {option action {value ""}} {
    ui_warn [msgcat::mc "depends option is not handled yet"]
}
