local nk = require("nakama")

local function some_example(context, payload)
  -- we'll assume payload was sent as JSON and decode it.
  local json = nk.json_decode(payload)

  -- log data sent to RPC call.
  nk.logger_info(("Payload: %q"):format(json))

  local id = nk.uuid_v4()
  -- create a leaderboard with the json as metadata.
  nk.leaderboard_create(id, "desc", "best", "0 0 * * 1", json, false)

  return nk.json_encode({["id"] = id})
  -- will return "{'id': 'some UUID'}" (JSON) as bytes
end

nk.register_rpc(some_example, "my_unique_id")