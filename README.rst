Varnish Cache commit events
===========================


This is a tiny script that pulls the latest git
changes from `varnish-cache.git`, and runs some commit hooks.

Currently it just runs the one we need: send-email in general direction of the
varnish-commit@.

It is meant to be run under crontab with no privileges somewhere that
is capable and allowed to send email.



FAQ
---

Q: Why not use the built-in commit email on Github?
A: It doesn't contain the diff, so it isn't very useful for us.

Q: Why not use webhooks and $shinyshinyshiny?
A: These emails are not urgent. We can wait 2.5 minutes for the cronjob to run.
The upside is that we don't have anything that needs to be running constantly.
If this breaks someone gets a lot of cronmail, but when it is fixed the emails
should pick up where they left off. No lost messages.


Contact
-------

This was written by Lasse Karstensen <lkarsten@varniNOSPAMsh-software.com> and is
maintained by the Varnish core team. Contact address is <varnish-dev@varnNOSPAMish-cache.org>.

