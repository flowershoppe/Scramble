addHandler("friend list", function(data) {
	warp_trace("friends:", data.friends)
	global.friends = data.friends
})

addHandler("friend req inc", function(data) {
	warp_trace(data.from)
	global.friend_requests_inc = data.from
})

addHandler("friend req out", function(data) {
	warp_trace(data.to)
	global.friend_requests_out = data.to
})

addHandler("friend req new", function(data) {
	warp_trace(data.from)
	array_push(global.friend_requests_inc, data.from)
})

addHandler("friend added", function(data) {
	warp_trace("friend added!")
})

addHandler("friend req accepted", function(data) {
	warp_trace("friend request from % accepted!", data.name)
})