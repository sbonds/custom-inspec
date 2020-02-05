# Inspec checks
Inspec checks for various tasks

## Running a check locally

```bash
cd custom-inspec
sudo inspec exec sudo-no-pwfeedback
```

## Running a check remotely

```bash
cd custom-inspec
inspec exec sudo-no-pwfeedback --target=ssh://<remote host name or IP> --user=<remote user> --sudo
```
Inspec only checks one host at a time. Really clever sysadmins will make use of a for loop to get around that.

Also look at the `--reporter=json` option for things like:

```bash
for server in serverA serverB serverC; do echo Checking $server; inspec exec sudo-no-pwfeedback --target=ssh://$server --user=remoteuser --sudo --reporter=json > inspec-sudo-no-pwfeedback-$(date +%Y%m%d)-${server}.json; done
```

## sudo-no-pwfeedback

This inspec profile checks if "pwfeedback" is disabled, which is the default. This avoids https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2019-18634.
