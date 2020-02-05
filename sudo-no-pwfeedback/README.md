# Check that sudo has pwfeedback disabled

The `pwfeedback` option is disabled by default. When enabled on unpatched sudo versions older than 1.8.26 this can lead to a buffer overflow local privilege escalation.

The bug has been assigned [CVE-2019-18634](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2019-18634).

This Inspec check checks that the pwfeedback option is disabled using "sudo -V" output when run as root.
