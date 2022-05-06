# `content/opc-ua/shared-content` subtree

All content in this directory is consumed from the [PI Adapter OPC-UA Docs](https://github.com/osisoft/pi-adapter-opc-ua-docs) repository as a subtree. This repo contains the unique OPC-UA documents used in EDS. Note that the OPC-UA document also makes use of the PI Adapter framework documents stored in `content/shared-content`.

[Subtree wiki article](https://dev.azure.com/osieng/engineering/_wiki/wikis/team-content/25155/Documentation-Frameworks?anchor=how-do-i-use-a-documentation-framework-in-my-new-document%3F)

## To update the subtree

To update content in `content/opc-ua/shared-content`, perform the following actions from a command prompt session:

1. Enter the following command. 

    ```bash
    git subtree pull --prefix content/opc-ua/shared-content https://github.com/osisoft/pi-adapter-opc-ua-Docs main --squash
	```

1. Resolve any conflicts and complete the merge.

## Which branch of the PI Adapter OPC-UA docs is EDS consuming?

It's currently consuming `main`. It should continue to consume `main` until another use case arises.

## What if I want to consume a different branch of the PI Adapter OPC-UA docs?

If you want to swap out the most recent version of the PI Adapter OPC-UA docs for a specific version, update the branch parameter in the `git subtree pull` command:

```bash
git subtree pull --prefix content/opc-ua/shared-content https://github.com/osisoft/pi-adapter-opc-ua-Docs <CUSTOM_BRANCH> --squash
```