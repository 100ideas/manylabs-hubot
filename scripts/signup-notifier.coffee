# Description:
#   let us know when someone has signed up for the mailing list.
#
# Examples:
#   post json {"email":"name@example.com", "source":"manylabs.org mailing list"} to the url
#
# URLs: 
#   manylabs-hubot.heroku.com/hubot/signup-notifier
#  
# Notes:
#
#   Post raw json with application/json
#     curl -X POST -H "Content-Type: application/json" -d '{"email":"name@example.com", "source":"mailing list name via RAW JSON"}' http://127.0.0.1:8080/hubot/signup-notifier
#
#   Post raw json with application/x-www-form-urlencoded
#     curl -X POST -H "Content-Type: application/x-www-form-urlencoded" -d 'email=name%40example.com&source=mailing+list+name+via+X-WWW-FORM' http://127.0.0.1:8080/hubot/signup-notifier
#
#   Post raw json with multipart/form-data
#     curl -X POST -H "Content-Type: multipart/form-data" -F "email=name@example.com" -F "source=manylabs.org mailing list via FORM-DATA" http://127.0.0.1:8080/hubot/signup-notifier
#   
#   Post stringified json with application/x-www-form-urlencoded
#     curl -X POST -H "Content-Type: application/x-www-form-urlencoded" -d 'payload=%7B%22email%22%3A%22name%40example.com%22%2C+%22source%22%3A%22mailing+list+name+via+payload+json%22%7D' http://127.0.0.1:8080/hubot/signup-notifier
#
#   Post stringified json with multipart/form-data
#     curl -X POST -H "Content-Type: multipart/form-data" -F 'payload={"email":"name@example.com", "source":"mailing list name via payload json"}' http://127.0.0.1:8080/hubot/signup-notifier
#


module.exports = (robot) ->
  robot.router.post "/hubot/signup-notifier", (req, res) ->    
    # express.js body-parser middleware should JSONify req.body, if not try JSON.parse on payload
    data = if req.body.payload? then JSON.parse req.body.payload else req.body

    robot.messageRoom 'general', "Oooo! \<#{data.email}\> just signed up for #{data.source}."
    robot.logger.info "signup-notifier: \<#{data.email}\> signed up for #{data.source}"

    res.send 'OK'