{Layer} = require "./Layer"

class exports.VideoLayer extends Layer
	
	constructor: (options={}) ->
		
		# We need the player to exist before we add the options
		@player = document.createElement("video")
		@player.setAttribute("webkit-playsinline", "true")
		@player.style.width = "100%"
		@player.style.height = "100%"

		super options
		
		# Make it work with .on and .off
		# https://developer.mozilla.org/en-US/docs/Web/Guide/Events/Media_events
		@player.on = @player.addEventListener
		@player.off = @player.removeEventListener
		
		@video = options.video
		
		@_element.appendChild(@player)
	
	@define "video",
		get: -> @player.src
		set: (video) -> @player.src = video
