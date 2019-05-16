use smarthome
db.createCollection('agentConfigs', {
	autoIndexId: true,
})

db.collection.insert([
	{"agentId": "bedroom", "tmpAdjustment": "-4" },
	{"agentId": "livingroom", "tmpAdjustment": "-4" }
])

