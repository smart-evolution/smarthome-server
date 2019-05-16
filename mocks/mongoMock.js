use smarthome
db.createCollection('agentConfigs', {
	autoIndexId: true,
})

db.collection.insertMany([
	{"agentId": "bedroom", "tmpAdjustment": "-4" },
	{"agentId": "livingroom", "tmpAdjustment": "-4" }
])

