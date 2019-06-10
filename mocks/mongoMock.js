use smarthome
db.createCollection('agentConfigs', {
	autoIndexId: true,
})

db.collection.insert([
	{"agentId": "bedroom", "tmpAdjustment": "-4" },
	{"agentId": "livingroom", "tmpAdjustment": "-4" }
])

db.createCollection('users', {
	autoIndexID: true,
))

db.collection.insert([
	{"username": "oskar.szura@gmail.com", "password": "540c213117307beea85a1c8f3b6a018c1ed7c9de"}
])
