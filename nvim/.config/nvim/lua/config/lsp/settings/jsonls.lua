local status_ok, schemastore = pcall(require, "schemastore")
if not status_ok then
	print("Failed to load schemastore")
	return
end

return {
	settings = {
		json = {
			schemas = schemastore.json.schemas(),
			validate = { enable = true },
		},
	},
}
