type owner = Player?
type rawrequire = typeof(require)
type LoadAssets = (
	assetId: number
) -> {
	Get: (asset: string) -> Instance,
	Exists: (asset: string) -> boolean,
	GetNames: () -> { string },
	GetArray: () -> { Instance },
	GetDictionary: () -> { [string]: Instance },
}
type compileLua = (code: string, processName: string?) -> string
type compileLuaU = (
	code: string,
	processName: string?,
	optimizationLevel: number?,
	debugLevel: number?,
	coverageLevel: number?
) -> string
type compile = compileLuaU
type axypeFlags = {
	persistentLocalDestroyUponPing: boolean,
	isDebuggerEnabled: boolean,
	BETA_useLuauSupport: boolean,
}
type notify = (text: string, duration: number?, target: Player?) -> ()
type NewLocalScript = (code: string, parent: Instance, ...any) -> LocalScript
type NewPersistentLocalScript = (code: string, parent: Instance, ...any) -> nil
type NewScript = (code: string, parent: Instance, ...any) -> Script
type xshared = { [any]: any }
type storage = {
	get: (key: any) -> any,
	set: (key: any, value: any) -> nil,
	exists: (key: any) -> boolean,
	remove: (key: any) -> nil,
	getOwner: (key: any) -> string?,
	list: (byYou: boolean?) -> { string },
}
type isolatedStorage = { [any]: any }
type axype = {
	version: string,
	script: {
		name: string,
		displayName: string,
		compiler: string,
	},
	generator: {
		date: string,
		name: string,
	},
	creator: {
		name: string,
	},
	ui: {
		notification: (
			text: string,
			config: {
				icon: string?,
				header: string?,
				color: {
					desc: Color3,
					header: Color3,
					close: Color3,
				}? | "red"? | "white"?,
				sfx: {
					-- {soundId, soundPitch, soundVolume}
					show: { any }?,
					click: { any }?,
				}?,
				lifetime: number?,
			}
		) -> (),
	},
}
type GetAsset = (assetName: string, noCache: boolean?, allowErrors: boolean?) -> any

declare owner: owner
declare rawrequire: rawrequire
declare LoadAssets: LoadAssets

declare compileLua: compileLua
declare compileLuaU: compileLuaU
declare compile: compile

declare axypeFlags: axypeFlags
declare notify: notify

declare NewLocalScript: NewLocalScript
declare NLS: NewLocalScript
declare nLS: NewLocalScript
declare newLocalScript: NewLocalScript

declare NewScript: NewScript
declare NS: NewScript
declare nLS: NewScript
declare newLocalScript: NewScript

declare NewPersistentLocalScript: NewPersistentLocalScript
declare NPLS: NewPersistentLocalScript
declare nPLS: NewPersistentLocalScript
declare newPersistentLocalScript: NewPersistentLocalScript

declare storage: storage
declare xshared: xshared
declare axype: axype
declare isolatedStorage: isolatedStorage

declare GetAsset: GetAsset
declare getAsset: GetAsset
declare loadAsset: GetAsset
declare fetch: GetAsset
declare Fetch: GetAsset
declare LoadAsset: GetAsset
