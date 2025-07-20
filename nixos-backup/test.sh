set -e

read -p "time (leave blank to use current time): " desc

# Check if input is empty
if [ -z "$desc" ]; then
	desc= "the time is: $(date '+%Y-%m-%d %H:%M:%S')"
fi

echo "$desc"
