# Contributing to the d.velop business objects toolkit

Thank you for considering contributing to this project. It will help to make this project more valuable for the
community.

We value any feedback and contributions whether it's a bug report, bugfix, additional feature or documentation.
Please read this document before submitting an issue or pull request to ensure that your contributions can
be handled effectively.

# How to report a bug

## Security vulnerability

Please do **NOT** open an issue if you find a security vulnerability.
Instead send an e-mail to `securityissue@d-velop.de`.

In order to determine whether you are dealing with a security issue, ask yourself these two questions:
* Can I access something that's not mine, or something I shouldn't have access to?
* Can I disable something for other people?

If the answer to either of those two questions are "yes", then you're probably dealing with a security issue.
Note that even if you answer "no" to both questions, you may still be dealing with a security issue,
so if you're unsure, just email us.

## File a bug report.

You can file bug reports on the [issues page](https://github.com/d-velop/dvelop-bo-toolkit/issues).

Please follow the following steps prior to filing a bug report.

1. Search through existing [issues](https://github.com/d-velop/dvelop-bo-toolkit/issues) to ensure that
   your specific issue has not yet been reported.

2. Ensure that you have tested the latest version of this toolkit.
   Although you may have an issue against an older version of the toolkit, we cannot provide bug fixes for old versions.
   It's also possible that the bug may have been fixed in the latest release.

When filing an issue, make sure to answer the following questions:

1. What version of the script are you using?

2. What operating system are you using?

3. What did you do?

4. What did you expect to see?

5. What did you see instead?

# Submitting Pull Requests

Please be aware of the following notes prior to opening a pull request:

1. This project is released under the license specified in [LICENSE](LICENSE).
   Any code you submit will be released under that license. Furthermore it's likely
   that we have to reject code which depends on third party code which isn't compatible
   to the aforementioned license.

2. If you would like to implement support for a significant feature that is not
   yet available, please talk to us beforehand to avoid any
   duplication of effort.

3. Wherever possible, pull requests should contain tests as appropriate.
   Bugfixes should contain tests that exercise the corrected behavior (i.e., the
   test should fail without the bugfix and pass with it), and new features
   should be accompanied by tests exercising the feature.

4. Follow the [Code Conventions](#code-conventions).

5. Pull requests that contain failing tests will not be merged until the test
   failures are addressed. Pull requests that cause a significant drop in the
   test coverage percentage are unlikely to be merged until tests have
   been added.

# Code Conventions

The script code has to be written considering the following PowerShell [code conventions](https://github.com/PoshCode/PowerShellPracticeAndStyle/blob/master/Style-Guide/Documentation-and-Comments.md)

## Documentation

Things that should be explained to the end user have to be added in the documentation for the corresponding sub project.

For example in the business objects upload scripts' [usage documentation](business_objects_upload/README.md) or the [Postman collection documentation](./postman_collection/README.md) respectively.

## Naming of Tests

There are no traditional unit tests.

## Commit message

Please use the following template for commit messages which is derived from
[template of the git project](https://git-scm.com/book/en/v2/Distributed-Git-Contributing-to-a-Project):

```
Short (50 chars or less) summary of changes

More detailed explanatory text, if necessary.  Wrap it to
about 72 characters or so.  In some contexts, the first
line is treated as the subject of an email and the rest of
the text as the body.  The blank line separating the
summary from the body is critical (unless you omit the body
entirely); tools like rebase can get confused if you run
the two together.

Write your commit message in the imperative: "Fix bug" and not "Fixed bug"
or "Fixes bug."  This convention matches up with commit messages generated
by commands like git merge and git revert.

Further paragraphs come after blank lines.

- Bullet points are okay, too

- Typically a hyphen or asterisk is used for the bullet, followed by a
  single space, with blank lines in between, but conventions vary here
```