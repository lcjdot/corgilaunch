# Description:
#   Attempting corgi script
#
# Commands:
#   hubot corgi please - Receive a corgi

# Author:
#   Laura Wynn

module.exports = (robot) ->
  msg.http("https://www.instagram.com/corgi_nation/?hl=en")
    .get() (err, res, body) ->
      msg.send JSON.parse(body).corgi