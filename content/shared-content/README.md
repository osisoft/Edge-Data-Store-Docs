# `content/shared-content` subtree

All content in this directory is consumed from the [PI Adapter](https://github.com/osisoft/PI-Adapter) framework repository as a subtree. This repo contains shared files that are used in all adapter documentation. Within Edge Data Store, files from the PI Adapter repo are reused in the `modbus` and `opc-ua` portions of the TOC, as Modbus and OPC-UA are dependent on referencing a version of the framework.

[Subtree wiki article](https://dev.azure.com/osieng/engineering/_wiki/wikis/team-content/25155/Documentation-Frameworks?anchor=how-do-i-use-a-documentation-framework-in-my-new-document%3F)

## To update the subtree

To update content in `content/shared-content`, perform the following actions from a command prompt session:

1. Change directory to `content/shared-content`.

1. Enter the following command. 

    ```bash
    git subtree pull --prefix content/shared-content https://github.com/osisoft/PI-Adapter main --squash
	```

1. Resolve any conflicts and complete the merge.

## Which branch of the PI Adapter framework is EDS consuming?

It's currently consuming `main`. It should continue to consume `main` until another use case arises.

## What if I want to consume a different branch?

If you want to swap out the most recent version of the PI Adapter framework for a specific version, update the branch parameter in the `git subtree pull` command:

```bash
git subtree pull --prefix content/shared-content https://github.com/osisoft/PI-Adapter <CUSTOM_BRANCH> --squash
```