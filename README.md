# paste-template

This is a template repository designed to boost the coding workflow for Axype pastes. Feel free to clone & use it for new Axype work!

> The Axype environment has already been defined inside the `.luaurc` & `axype.yml` files! (so no need to do it manually!)

Features:

- Compile client source at bundle time
- Rojo support
- Mock SB/Paste environment (for studio)

## Initialization

Requirements:

- [Rokit](https://github.com/rojo-rbx/rokit)

Run the following command:

```
rokit install
```

## Bundling

> VS Code users:
>
> press `CTRL + P`, type `task ` and select the `Build` option

alternatively,

Running the build script via lune:

```sh
lune run scripts/build
```

## DEV Bundling

> VS Code users:
>
> same steps but select `Build [DEV]` instead of `Build`<br>
> (you need to repeat this every time you make a change under `src`)

To use this mode, pass the `dev` argument when executing the build script via lune.

Dev environment will use the `.darklua.dev.json` darklua config if available.

```sh
lune run scripts/build dev
```

## Rojo support & Studio support

> The script will run in a mock Axype environment that perfectly mirrors the real deal!

This template supports Rojo too! It will automatically update the linked files after bundling. The only thing you have to do is `rojo serve`.
