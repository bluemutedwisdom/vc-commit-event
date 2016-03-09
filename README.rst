Varnish Cache commit emails
===========================

This is a tiny script meant to be run under crontab on
some unprivileged user.

It will fetch the latest git commits and use the normal git post-receive hook
we used when we self-hosted git, for notifying the -commit@ email list.


FAQ
---

Q: Why not use the built-in stuff in github?

A: It doesn't contain the diff. That stuff is just a traffic generator for the
github web site.


Contact
-------

Contact varnish-core@varnNOSPAMish-cache.org about this script.

