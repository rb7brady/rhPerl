headerVar=authorization:
tokenType=Bearer
token="$1"
authHeader="$headerVar $tokenType $token"

curl --request GET --url https://api.robinhood.com/positions/ --header "$authHeader"



