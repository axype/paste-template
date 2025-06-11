--[=[
    client/init.<lua|luau>

    To require modules under the `shared` folder use the `@shared` prefix inside `require()`
    Do the same for modules under `client` too! Do not require server modules as it's not recommended.
    ```
        local sharedModule = require("@shared/module")
    ```

    .lua extension users:
    - Do not use [generalized iterations](https://rfcs.luau.org/generalized-iteration.html) inside `shared` & `client` as darklua doesn't have a replacement for them (lua 5.1 does not have this feature, resulting in an error when compiling the client code)

    Notice:
    - To use the luau compiler, change this file's extension from `lua` to `luau`
]=]

local sharedModule = require("@shared/module")

print("Hello world, from client!")
sharedModule()
