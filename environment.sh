# convenient alias for development
alias dc='docker compose'
#alias mc='docker compose exec manage sh'
alias cc='docker compose exec control sh'

function mc() {
	docker compose exec manage${1-} sh
}