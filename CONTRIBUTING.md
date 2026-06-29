# Contributing to Fluxer Mobile

Thanks for your interest in contributing. Please read this before opening a pull
request.

## Scope during beta

During the current beta we only accept contributions for **bug fixes**, and a pull
request must be for a linked, reported issue. App translations are handled through
our Weblate instance (see the [README](./README.md)). These guidelines will be
expanded after the beta.

Pull requests should target the `canary` branch. For local testing, use the
`canary` build flavor so your build matches that branch.

## Licensing of contributions

This project is licensed under the GNU Affero General Public License, version 3
(AGPLv3, see [`LICENSE`](./LICENSE)) **together with an App Store additional
permission** under section 7 of the AGPLv3 (see
[`LICENSE-APPSTORE-EXCEPTION`](./LICENSE-APPSTORE-EXCEPTION)).

By submitting a contribution to this repository, you agree that your contribution
is licensed under **the AGPLv3 together with the App Store additional permission in
`LICENSE-APPSTORE-EXCEPTION`**, on the same terms as the rest of the project. This
lets Fluxer distribute the app through application stores (such as the Apple App
Store and Google Play) without changing the project's public AGPLv3 licensing. You
keep the copyright in your contribution.

There is **no separate or signed Contributor License Agreement**. Agreement to the
above is given by the act of contributing, together with the DCO sign-off below.

## Developer Certificate of Origin (DCO) sign-off

Every commit must be signed off under the Developer Certificate of Origin (see the
[`DCO`](./DCO) file). The sign-off is a single line at the end of each commit
message:

```
Signed-off-by: Your Name <your.email@example.com>
```

Add it automatically with:

```
git commit -s
```

The name and email must be your real identity and match your committer details. If
you forget, amend the last commit with `git commit --amend -s`, or sign off a whole
branch with `git rebase --signoff <base>` and force-push.

> The DCO sign-off (`-s`, a `Signed-off-by` line) is **separate from** the
> cryptographic commit signing (`-S`, the GitHub "Verified" badge via GPG/SSH/S/MIME)
> that this project also requires. Please do both.

Pull requests from humans are checked automatically by the DCO workflow; a pull
request cannot be merged until every non-bot commit is signed off.
