-- Put functions in this file to use them in several other scripts.
-- To get access to the functions, you need to put:
-- require "my_directory.my_file"
-- in any script using the functions.

return function()
	local messages = {}
	local count = 0

	return {
		getCount = function()
			return count
		end,
		pushPendingMessageChunk = function(messageChunk)
			table.insert(messages, 1, messageChunk)
			count = count + 1
		end,
		putPendingMessageChunkBack = function(messageChunk)
			count = count + 1
			messages[count] = messageChunk
		end,
		popPendingMessageChunk = function()
			local popped = messages[count]
			messages[count] = nil
			count = count - 1
			return popped
		end
	}
end