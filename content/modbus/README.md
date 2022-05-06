# `content/modbus/shared-content` subtree

All content in this directory is consumed from the [PI Adapter Modbus Docs](https://github.com/osisoft/PI-Adapter-Modbus-Docs) repository as a subtree. This repo contains the unique Modbus documents used in EDS. Note that the Modbus document also makes use of the PI Adapter framework documents stored in `content/shared-content`.

[Subtree wiki article](https://dev.azure.com/osieng/engineering/_wiki/wikis/team-content/25155/Documentation-Frameworks?anchor=how-do-i-use-a-documentation-framework-in-my-new-document%3F)

## To update the subtree

To update content in `content/modbus/shared-content`, perform the following actions from a command prompt session:

1. Enter the following command. 

    ```bash
    git subtree pull --prefix content/modbus/shared-content https://github.com/osisoft/PI-Adapter-Modbus-Docs main --squash
	```

1. Resolve any conflicts and complete the merge.

    **Remember:** The Modbus docs include the PI Adapter framework. Delete any files that are not unique to Modbus and are redundant to the framework.

## Which branch of the PI Adapter Modbus docs is EDS consuming?

It's currently consuming `main`. It should continue to consume `main` until another use case arises.

## What if I want to consume a different branch of the PI Adapter Modbus docs?

If you want to swap out the most recent version of the PI Adapter Modbus docs for a specific version, update the branch parameter in the `git subtree pull` command:

```bash
git subtree pull --prefix content/modbus/shared-content https://github.com/osisoft/PI-Adapter-Modbus-Docs <CUSTOM_BRANCH> --squash
```