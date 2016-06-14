# Description:
#   Attempting corgi script
#
# Dependencies:
#   None
#
# Configuration:
#   HUBOT_CORGI_TRIGGER comma-separated list of additional "tiggers"
#   HUBOT_CORGI_OMITTED_JARGON comma-separated list of triggers to ignore
#
# Commands:
#   word triggers - receive a corgi image
#
# Notes:
#   See verbiage array for list of trigger phrases
#
# Author:
#   Laura Wynn (lwynn@serachdex.com)

images = require './data/images.json'
jargon = require './data/triggers.json'

removeTerm = (term, arrayToDeleteFrom) ->
  index = arrayToDeleteFrom.indexOf term
  if index > -1
    arrayToDeleteFrom.splice index, 1
    return arrayToDeleteFrom

if process.env.HUBOT_CORGI_TRIGGER?
  additionalJargon = (process.env.HUBOT_CORGI_TRIGGER).split(',')
  jargon = jargon.concat(additionalJargon)

if process.env.HUBOT_CORGI_OMITTED_JARGON?
  omittedJargon = (process.env.HUBOT_CORGI_OMITTED_JARGON).split(',')
  jargon = removeTerm(term, jargon) for term in omittedJargon

regex = new RegExp jargon.join('|'), 'gi'

module.exports = (robot) ->
  robot.hear regex, (msg) ->
    msg.send msg.random images
