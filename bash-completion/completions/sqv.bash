_sqv() {
    local i cur prev opts cmd
    COMPREPLY=()
    if [[ "${BASH_VERSINFO[0]}" -ge 4 ]]; then
        cur="$2"
    else
        cur="${COMP_WORDS[COMP_CWORD]}"
    fi
    prev="$3"
    cmd=""
    opts=""

    for i in "${COMP_WORDS[@]:0:COMP_CWORD}"
    do
        case "${cmd},${i}" in
            ",$1")
                cmd="sqv"
                ;;
            *)
                ;;
        esac
    done

    case "${cmd}" in
        sqv)
            opts="-n -v -h -V --output --overwrite --signature-file --message --cleartext --keyring --not-after --not-before --signatures --verbose --time --policy-as-of --help --version <FILE> [DATA-FILE]"
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 1 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                --output)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --signature-file)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --keyring)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --not-after)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --not-before)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --signatures)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                -n)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --time)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --policy-as-of)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
    esac
}

if [[ "${BASH_VERSINFO[0]}" -eq 4 && "${BASH_VERSINFO[1]}" -ge 4 || "${BASH_VERSINFO[0]}" -gt 4 ]]; then
    complete -F _sqv -o nosort -o bashdefault -o default sqv
else
    complete -F _sqv -o bashdefault -o default sqv
fi
